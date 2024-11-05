let Env = ../Env/Type.dhall

let Strategy = ../Strategy/Type.dhall

in  { id : Optional Text
    , name : Optional Text
    , env : Optional Env
    , run : Optional Text
    , uses : Optional Text
    , shell : Optional Text
    , `with` : Optional (List { mapKey : Text, mapValue : Text })
    , continue-on-error : Optional Bool
    , strategy : Optional Strategy
    , `if` : Optional Text
    , working-directory : Optional Text
    , timeout-minutes : Optional Natural
    }
