module Main where

import System.Environment (getArgs)
import UUIDList (nthUUID, uuidPosition)

main :: IO ()
main = do
    args <- getArgs
    case args of
      ["nth", nStr] ->
        case reads nStr of
          [(n, "")] -> do
              case nthUUID n of
                Just uuid -> putStrLn uuid
                Nothing   -> putStrLn "Индекс вне диапазона."
          _ -> putStrLn "Неверный формат числа (должно быть целое)."

      ["pos", uuidStr] ->
        case uuidPosition uuidStr of
          Just n  -> print n
          Nothing -> putStrLn "Неверный UUID."

      _ -> putStrLn "Использование: myuuid [nth <индекс> | pos <UUID>]"
