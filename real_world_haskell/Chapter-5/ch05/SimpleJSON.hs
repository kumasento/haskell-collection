
--Module Structure
module SimpleJSON 
    ( 
      JValue (..)
    , getString
    , getInt
    , getDouble
    , getBool
    , getObject 
    , getArray
    , isNull
    ) where

--About how to construct a data structure in Haskell.
data JValue = JString String
            | JNumber Double
            | JBool   Bool
            | JNull 
            | JObject [(String, JValue)]
            | JArray  [JValue]
              deriving (Eq, Ord, Show)


--About how to retrieve data from this data structure
getString :: JValue -> Maybe String
getString (JString s) = Just s
getString _           = Nothing

getInt :: JValue -> Maybe Int
getInt (JNumber n) = Just (truncate n)
getInt _           = Nothing

getDouble :: JValue -> Maybe Double
getDouble (JNumber n) = Just n
getDouble _           = Nothing

getBool :: JValue -> Maybe Bool
getBool (JBool b) = Just b
getBool _         = Nothing

getObject :: JValue -> Maybe [(String, JValue)]
getObject (JObject o) = Just o
getObject _           = Nothing

getArray :: JValue -> Maybe [JValue]
getArray (JArray a) = Just a
getArray _          = Nothing

isNull v = v == JNull

