{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
-- FSNotes管理システムを圏論的に表現するHaskellコード
{-# LANGUAGE TypeFamilies #-}

import Control.Category
import Data.List (intercalate)
import Data.Map qualified as Map
import Prelude hiding (id, (.))

-- ノートを表す型
data Note = Note
    { noteId :: String -- ノートの一意識別子
    , noteTitle :: String -- ノートのタイトル
    , noteTags :: [String] -- ノートに付けられたタグのリスト
    }
    deriving (Eq, Show)

-- ノート間の関係性（射）を表す型
data NoteArrow
    = TagRelation String -- タグによる関連
    | LinkRelation -- 直接リンクによる関連
    | IdArrow -- 恒等射（自己参照）
    deriving (Eq, Show)

-- FSNotes圏を定義
newtype FSNotesCategory a b = FSNotesCategory [NoteArrow]
    deriving (Eq, Show)

-- Control.Categoryのインスタンス化
instance Category FSNotesCategory where
    -- 恒等射
    id = FSNotesCategory [IdArrow]

    -- 射の合成
    (FSNotesCategory arrows2) . (FSNotesCategory arrows1) =
        FSNotesCategory (arrows1 ++ arrows2)

-- 注: 実際の圏では合成の順序が重要ですが、
-- この簡略化された実装では単に矢印リストを連結しています

-- FSNotes圏での実際の使用例
exampleNote1 :: Note
exampleNote1 = Note "note1" "プログラミング学習" ["programming", "learning"]

exampleNote2 :: Note
exampleNote2 = Note "note2" "Haskell入門" ["programming", "haskell"]

exampleNote3 :: Note
exampleNote3 = Note "note3" "圏論の基礎" ["math", "category"]

-- ノート間の関連性を表す射を作成
tagRelation :: Note -> Note -> Maybe (FSNotesCategory Note Note)
tagRelation note1 note2 =
    let commonTags = filter (`elem` noteTags note2) (noteTags note1)
     in if null commonTags
            then Nothing
            else Just $ FSNotesCategory [TagRelation (head commonTags)]

-- リンク関連を作成
linkRelation :: Note -> Note -> FSNotesCategory Note Note
linkRelation _ _ = FSNotesCategory [LinkRelation]

-- 恒等射を作成
idRelation :: Note -> FSNotesCategory Note Note
idRelation _ = id

-- 射の合成例を表示
main :: IO ()
main = do
    putStrLn "FSNotes Management System as a Category"
    putStrLn "---------------------------------------"

    -- ノート間の関連性を示す
    putStrLn $ "Note 1: " ++ noteTitle exampleNote1
    putStrLn $ "Note 2: " ++ noteTitle exampleNote2
    putStrLn $ "Note 3: " ++ noteTitle exampleNote3

    -- タグによる関連を表示
    case tagRelation exampleNote1 exampleNote2 of
        Just rel -> putStrLn $ "Note 1 relates to Note 2 via tag: " ++ show rel
        Nothing -> putStrLn "Note 1 has no tag relation with Note 2"

    -- 合成の例
    let directLink = linkRelation exampleNote2 exampleNote3
    let composition = case tagRelation exampleNote1 exampleNote2 of
            Just tagRel -> directLink . tagRel
            Nothing -> FSNotesCategory []

    putStrLn $ "Composition of relations: " ++ show composition
