{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_haskell_warp (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Jaskinia\\Documents\\docker-sandbox\\2_haskell_warp\\haskell-warp\\.stack-work\\install\\495683e6\\bin"
libdir     = "C:\\Users\\Jaskinia\\Documents\\docker-sandbox\\2_haskell_warp\\haskell-warp\\.stack-work\\install\\495683e6\\lib\\x86_64-windows-ghc-8.0.2\\haskell-warp-0.1.0.0-7EbZrbfJAsa7k3uvOkuCrq"
dynlibdir  = "C:\\Users\\Jaskinia\\Documents\\docker-sandbox\\2_haskell_warp\\haskell-warp\\.stack-work\\install\\495683e6\\lib\\x86_64-windows-ghc-8.0.2"
datadir    = "C:\\Users\\Jaskinia\\Documents\\docker-sandbox\\2_haskell_warp\\haskell-warp\\.stack-work\\install\\495683e6\\share\\x86_64-windows-ghc-8.0.2\\haskell-warp-0.1.0.0"
libexecdir = "C:\\Users\\Jaskinia\\Documents\\docker-sandbox\\2_haskell_warp\\haskell-warp\\.stack-work\\install\\495683e6\\libexec"
sysconfdir = "C:\\Users\\Jaskinia\\Documents\\docker-sandbox\\2_haskell_warp\\haskell-warp\\.stack-work\\install\\495683e6\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskell_warp_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskell_warp_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "haskell_warp_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "haskell_warp_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskell_warp_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskell_warp_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
