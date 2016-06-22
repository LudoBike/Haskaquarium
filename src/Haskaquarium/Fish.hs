module Haskaquarium.Fish
  ( Fish(..)
  , Sex(..)
  , Breed(..)
  ) where

import Haskaquarium.Types

data Fish = Fish { name  :: Name
                 , sex   :: Sex
                 , breed :: Breed
                 } deriving (Show, Eq)

data Sex = Male | Female
         deriving (Show, Eq)

data Breed = Carnivorous Name
           | Vegetarian  Name
           deriving (Show, Eq)

