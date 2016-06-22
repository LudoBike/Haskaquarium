module Haskaquarium.Fish
  ( Fish(..)
  , Sex(..)
  , Breed(..)
  , eat
  ) where

import Haskaquarium.Types
import Haskaquarium.Aquarium

import Data.List

data Fish = Fish { name  :: Name
                 , sex   :: Sex
                 , breed :: Breed
                 } deriving (Show, Eq)

data Sex = Male | Female
         deriving (Show, Eq)

data Breed = Carnivorous Name
           | Vegetarian  Name
           deriving (Show, Eq)

-- 'eat' feed a Fish with food in Aquarium
eat :: Fish -> Maybe Fish -> Aquarium -> Aquarium
eat f1@(Fish _ _ b) f2 a = case b of
                         Vegetarian _ -> eatSeaweed a
                         Carnivorous _ -> case f2 of
                                            Just f -> eatFish f1 f a
                                            Nothing -> error "Need a fish to eat"

-- 'eatSeaweed' remove a seewead from aquarium
eatSeaweed :: Aquarium -> Aquarium
eatSeaweed Aquarium f s = Aquarium f (s-1)

-- 'eatFish' remove the 2nd given fish of the aquarium
-- if is not the same as the 1st else throw an error
eatFish :: Fish -> Fish -> Aquarium -> Aquarium
eatFish f1 f2 (Aquarium f s)
  | f1 /= f2 = Aquarium (delete f2 f) s
  | otherwise = error "A fish can't eat himself"
