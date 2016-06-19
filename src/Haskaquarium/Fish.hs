module Haskaquarium.Fish
  ( Fish(..)
  , Sex(..)
  ) where

import Haskaquarium.Types

data Fish = Fish { name :: Name
                 , sex  :: Sexe
                 } deriving (Show, Eq)

data Sex = Male | Female
         deriving (Show, Eq)
