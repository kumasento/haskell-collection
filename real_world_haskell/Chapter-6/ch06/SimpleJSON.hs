module JSON where

data JValue = JString String
            | JNumber Double
            | JBool Bool
            | JNull 
            | JObject [(String, JValue)]
            | JArray [JValue] 
            deriving (Eq, Ord, Show)

