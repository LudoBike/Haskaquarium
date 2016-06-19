module Haskaquarium.Fish
  ( Fish(..)
  , Sex(..)
  ) where

import Haskaquarium.Types

data Fish = Fish { name :: Name
                 , sex  :: Sex
                 } deriving (Show, Eq)

data Sex = Male | Female
         deriving (Show, Eq)
