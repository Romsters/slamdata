module Model.Notebook.Cell.FileInput where

import Data.Maybe (Maybe(..))
import Model.Resource (Resource())
import Optic.Core (LensP(), lens)

newtype FileInput =
  FileInput { showFiles :: Boolean
            , files :: [Resource]
            , file :: Maybe Resource
            }

initialFileInput :: FileInput
initialFileInput =
  FileInput { showFiles: false
            , files: []
            , file: Nothing
            }

_fileInput :: LensP FileInput _
_fileInput = lens (\(FileInput obj) -> obj) (const FileInput)

_showFiles :: LensP FileInput Boolean
_showFiles = _fileInput <<< lens _.showFiles (_ { showFiles = _ })

_files :: LensP FileInput [Resource]
_files = _fileInput <<< lens _.files (_ { files = _ })

_file :: LensP FileInput (Maybe Resource)
_file = _fileInput <<< lens _.file (_ { file = _ })