{-# LANGUAGE InstanceSigs #-}

import Control.Category
import Prelude hiding (id, (.))

-- 駅を表す型じゃけんね
data Station where
    Station :: String -> Station
    deriving (Eq)

instance Show Station where
    show :: Station -> String
    show (Station name) = name

-- 電車の移動を表す型として、ルート（駅のリスト）で表すんよ
newtype Train a b = Train {route :: [Station]}
    deriving (Show)

instance Category Train where
    -- 恒等射：その駅に止まること。ここでは空のルートで表現しとるけぇ、
    -- 実際は「駅そのもの」に留まると解釈できるんよ
    id :: Train a a
    id = Train []

    -- 射の結合：連続的な移動。ルートを単純に連結しとるんよ
    (.) :: Train b c -> Train a b -> Train a c
    (Train route2) . (Train route1) = Train (route1 ++ route2)

-- 例として、駅 A, B, C を定義しとるけぇ
stationA, stationB, stationC :: Station
stationA = Station "小手指駅"
stationB = Station "池袋駅"
stationC = Station "品川シーサイド駅"

-- 駅間の移動を表す。たとえば A から B へ移動する場合じゃけぇ、
moveAB :: Train a b4
moveAB = Train [stationA, stationB]

-- B から C へ移動する場合じゃけぇ、
moveBC :: Train b c
moveBC = Train [stationB, stationC]

-- 連続した移動、すなわち A から B 経由で C へ行く通勤ルートじゃね
commute :: Train Station Station
commute = moveBC . moveAB

main :: IO ()
main = do
    putStrLn $ "通勤ルート: " ++ show (route commute)
