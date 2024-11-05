let Concurrency = ../Concurrency/Type.dhall

let Container = ../Container/Type.dhall

let Defaults = ../Defaults/Type.dhall

let Env = ../Env/Type.dhall

let JobEnv = ../JobEnv/Type.dhall

let Service = ../Service/Type.dhall

let Strategy = ../Strategy/Type.dhall

let Permission = ../Permission/Type.dhall

let PermissionAccess = ../PermissionAccess/Type.dhall

let ContinueOnError = ../ContinueOnError/Type.dhall

in  { name = None Text
    , needs = None (List Text)
    , continue-on-error = None ContinueOnError
    , strategy = None Strategy
    , environment = None JobEnv
    , outputs = None (List { mapKey : Text, mapValue : Text })
    , env = None Env
    , defaults = None Defaults
    , timeout-minutes = None Natural
    , `if` = None Text
    , services = None (List { mapKey : Text, mapValue : Service })
    , container = None Container
    , concurrency = None Concurrency
    , permissions =
        None (List { mapKey : Permission, mapValue : PermissionAccess })
    , secrets = None (List { mapKey : Text, mapValue : Text })
    }
