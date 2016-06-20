--
--         Haskaquarium
-- For informations on the project itself see README.md
-- For informations on the license see License.md
--

module Main where

import Haskaquarium

-- 'main' runs the main program
main :: IO ()
main = do
  let fishes = [ Fish "Robert"   Male
               , Fish "Joseline" Female
               , Fish "Gertrude" Female
               , Fish "LudoBike" Male]
  let aquarium = Aquarium fishes 10
  putStrLn $ loop 8 aquarium

loop :: Int -> Aquarium -> String
loop 0 _ = ""
loop i a = showState a ++ loop (i-1) (letTime a)
