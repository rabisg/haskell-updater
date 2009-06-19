{- |
   Module      : Distribution.Gentoo.Util
   Description : Utility functions
   Copyright   : (c) Ivan Lazar Miljenovic 2009
   License     : GPL-2 or later
   Maintainer  : Ivan.Miljenovic@gmail.com

   Common utility functions.
 -}
module Distribution.Gentoo.Util where

import Data.List(groupBy)
import System.Directory(getDirectoryContents)
import Control.Monad(liftM)

concatMapM   :: (a -> IO [b]) -> [a] -> IO [b]
concatMapM f = liftM concat . mapM f

breakAll   :: (a -> Bool) -> [a] -> [[a]]
breakAll p = groupBy (const (not . p))

-- Don't return . or ..
getDirectoryContents'     :: FilePath -> IO [FilePath]
getDirectoryContents' dir = do is <- getDirectoryContents dir
                               return $ filter (`notElem` [".", ".."]) is
