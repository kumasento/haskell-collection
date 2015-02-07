module PrettyJSON where

import Prettify 
import Numeric
import Data.Bits 
import Data.Char

enclose :: Char -> Char -> Doc -> Doc
enclose left right x = char left <> x <> char right

oneChar :: Char -> Doc
oneChar c = case lookup c simpleEscapes of
              Just r -> text r
              Nothing | mustEscape c  -> hexEscape c
                      | otherwise     -> char c
                        where mustEscape x = x < ' ' || x == '\x7f' || x >'\x7f'

simpleEscapes :: [(Char, String)]
simpleEscapes = zipWith ch "\b\n\f\r\t\\\"/" "bnfrt\\\"/"
    where ch a b = (a, ['\\', b])

-- The length of hex representation of x should be less than 4
-- or there'll be problem

smallHex :: Int -> Doc
smallHex x = text "\\u"
          <> text (replicate (4 - length h) '0')
          <> text h
    where h = showHex x ""

astral :: Int -> Doc
astral n = smallHex (a + 0xd800) <> smallHex (b + 0xdc00)
    where 
      a = (n `shiftR` 10) .&. 0x3ff
      b = n .&. 0x3ff

hexEscape :: Char -> Doc
hexEscape c | d < 0x10000 = smallHex d
            | otherwise   = astral (d - 0x10000)
    where d = ord c

string :: String -> Doc
string = enclose '"' '"' . hcat . map oneChar

series :: Char -> Char -> (a->Doc) -> [a] -> Doc
series open close item = enclose open close
                        . fsep . punctuate (char '.') . map item

