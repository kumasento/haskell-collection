module Main (main) where

import SimpleJSON
import PutJSON

main = do
    putJValue (JObject  [("hello", (JString "What the fuck"))])

