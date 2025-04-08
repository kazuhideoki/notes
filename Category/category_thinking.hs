{-# LANGUAGE InstanceSigs #-}

import Control.Category
import Prelude hiding (id, (.))

type Idea = String

-- ひとつの対象、「心」っちゅう概念でモノイド圏を作るんよ。
-- 型パラメータはダミー扱いで、実際には Mind = Thought () () として使うんじゃ。
newtype Thought a b = Thought {process :: Idea -> Idea}

type Mind = Thought () ()

instance Category Thought where
    id :: Thought a a
    id = Thought id -- 何も考えん、ぼうっとしてる状態じゃね

    (.) :: Thought b c -> Thought a b -> Thought a c
    (Thought f) . (Thought g) = Thought (f . g)

-- 合成は、思考の連続、たとえば「仕事終わった」→「もうこんな時間か」→「家に帰ろう」

-- 具体的な思考の変化（射）の例じゃけぇ

-- 仕事が終わった時の「考え」
thinkWork :: Mind
thinkWork = Thought (++ " 仕事終わったんよ")

-- 時間に気付いた時の「考え」
thinkTime :: Mind
thinkTime = Thought (++ " もうこんな時間じゃのう")

-- 家に帰ろうと思う「考え」
thinkHome :: Mind
thinkHome = Thought (++ " 家に帰ろう思うたんよ")

-- 射の合成、つまり多重に考えて思索に耽る感じじゃ
fullThought :: Mind
fullThought = thinkHome . thinkTime . thinkWork

main :: IO ()
main = do
    let initialIdea = "最初のアイデアは…"
    putStrLn $ "初めは: " ++ initialIdea
    putStrLn $ "考えた後: " ++ process fullThought initialIdea
