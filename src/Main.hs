--
--         Haskaquarium
-- For informations on the project itself see README.md
-- For informations on the license see License.md
--

module Main where

import Haskaquarium

breeds = [ Carnivorous "Mérou"
         , Carnivorous "Thon"
         , Carnivorous "Poisson-clown"
         , Vegetarian  "Sole"
         , Vegetarian  "Bar"
         , Vegetarian  "Carpe"
         ]

-- 'main' runs the main program
main :: IO ()
main = do
  let fishes = [ Fish "Robert"   Male   (breeds !! 0)
               , Fish "Joseline" Female (breeds !! 5)
               , Fish "Gertrude" Female (breeds !! 1)
               , Fish "LudoBike" Male   (breeds !! 3)]
  let aquarium = Aquarium fishes 10
  putStrLn $ showState aquarium
  let newAquarium = eat (fishes !! 3) Nothing . eat (fishes !! 0) (Just $ fishes !! 1) $ aquarium
  putStrLn $ showState newAquarium
