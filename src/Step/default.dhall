let Strategy = ../Strategy/Type.dhall

let Env = ../Env/Type.dhall

in  { env = None Env
    , id = None Text
    , name = None Text
    , shell = None Text
    , run = None Text
    , uses = None Text
    , continue-on-error = None Bool
    , `with` = None (List { mapKey : Text, mapValue : Text })
    , strategy = None Strategy
    , `if` = None Text
    , working-directory = None Text
    , timeout-minutes = None Natural
    }
