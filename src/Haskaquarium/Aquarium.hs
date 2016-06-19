module Haskaquarium.Aquarium
  ( Aquarium(..)
  , letTime
  , showState
  , addSeaweed
  , addFish
  ) where

import Haskaquarium.Fish
import Haskaquarium.Types

-- 'Aquarium' represent the aquarium
data Aquarium = Aquarium { fishes   :: [Fish]
                         , seaweeds :: Int
                         } deriving (Show, Eq)

-- 'letTime' done actions wich are due to the time
letTime :: Aquarium -> Aquarium
letTime a = a

-- 'showState' show the state of an aquarium properly
showState :: Aquarium -> String
showState (Aquarium f s) = showNbr (length f) s ++ showFishes f

-- 'showNbr' show the number of fish and seaweed properly
showNbr :: Integral a => a -> a -> String
showNbr fishes seaweeds = "There is " ++ f ++ " fish(es) and " ++ s ++ "seaweed(s)."
  where f = show fishes
        s = show seaweeds

showFishes :: [Fish] -> String
showFishes = foldr f ""
  where f (Fish n s) acc = "\n- " ++ n ++ (' ':show s) ++ acc

-- 'addSeaweed' add a seaweed to an Aquarium
addSeaweed :: Aquarium -> Aquarium
addSeaweed (Aquarium f s) = Aquarium f (s+1)

-- 'addFish' add a fish to an Aquarium
addFish :: Aquarium -> Fish -> Aquarium
addFish (Aquarium f s) toAdd = Aquarium (toAdd:f) s
