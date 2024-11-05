let Credentials = ../Credentials/Type.dhall

let Env = ../Env/Type.dhall

in  { credentials = None Credentials
    , env = None Env
    , ports = None (List Text)
    , volumes = None (List Text)
    , options = None Text
    }
