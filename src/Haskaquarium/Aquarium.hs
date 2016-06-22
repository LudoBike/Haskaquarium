module Haskaquarium.Aquarium
  ( Aquarium(..)
  , letTime
  , showState
  , addSeaweed
  , addFish
  , eat
  ) where

import Haskaquarium.Fish
import Haskaquarium.Types

import Data.List

-- 'Aquarium' represent the aquarium
data Aquarium = Aquarium { fishes   :: [Fish]
                         , seaweeds :: Int
                         } deriving (Show, Eq)

-- 'letTime' done actions wich are due to the time
letTime :: Aquarium -> Aquarium
letTime a = a

-- 'showState' show the state of an aquarium properly
showState :: Aquarium -> String
showState (Aquarium f s) = showNbr (length f) s ++ showFishes f ++ "\n"

-- 'showNbr' show the number of fish and seaweed properly
showNbr :: Int -> Int -> String
showNbr fishes seaweeds = "There is " ++ f ++ " fish(es) and " ++ s ++ " seaweed(s).\n"
  where f = show fishes
        s = show seaweeds

showFishes :: [Fish] -> String
showFishes = foldr f ""
  where f (Fish n s b) acc = "- " ++ n ++ (' ':show s) ++ (' ':showBreed b) ++ '\n':acc

showBreed :: Breed -> String
showBreed (Carnivorous name) = "carnivorous " ++ name
showBreed (Vegetarian name) = "vegetarian " ++ name

-- 'addSeaweed' add a seaweed to an Aquarium
addSeaweed :: Aquarium -> Aquarium
addSeaweed (Aquarium f s) = Aquarium f (s+1)

-- 'addFish' add a fish to an Aquarium
addFish :: Aquarium -> Fish -> Aquarium
addFish (Aquarium f s) toAdd = Aquarium (toAdd:f) s

-- 'eat' feed a Fish with food in Aquarium
eat :: Fish -> Maybe Fish -> Aquarium -> Aquarium
eat f1@(Fish _ _ b) f2 a = case b of
                         Vegetarian _ -> eatSeaweed a
                         Carnivorous _ -> case f2 of
                                            Just f -> eatFish f1 f a
                                            Nothing -> error "Need a fish to eat"

-- 'eatSeaweed' remove a seewead from aquarium
eatSeaweed :: Aquarium -> Aquarium
eatSeaweed (Aquarium f s) = Aquarium f (s-1)

-- 'eatFish' remove the 2nd given fish of the aquarium
-- if is not the same as the 1st else throw an error
eatFish :: Fish -> Fish -> Aquarium -> Aquarium
eatFish f1 f2 (Aquarium f s)
  | f1 /= f2 = Aquarium (delete f2 f) s
  | otherwise = error "A fish can't eat himself"
