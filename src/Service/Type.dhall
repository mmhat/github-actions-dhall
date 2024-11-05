let Credentials = ../Credentials/Type.dhall

let Env = ../Env/Type.dhall

in  { image : Text
    , credentials : Optional Credentials
    , env : Optional Env
    , ports : Optional (List Text)
    , volumes : Optional (List Text)
    , options : Optional Text
    }
