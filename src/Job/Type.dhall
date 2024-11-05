let Concurrency = ../Concurrency/Type.dhall

let Container = ../Container/Type.dhall

let Defaults = ../Defaults/Type.dhall

let Env = ../Env/Type.dhall

let JobEnv = ../JobEnv/Type.dhall

let RunsOn = ../RunsOn/Type.dhall

let Service = ../Service/Type.dhall

let Step = ../Step/Type.dhall

let Strategy = ../Strategy/Type.dhall

let Permission = ../Permission/Type.dhall

let PermissionAccess = ../PermissionAccess/Type.dhall

let ContinueOnError = ../ContinueOnError/Type.dhall

in  { name : Optional Text
    , needs : Optional (List Text)
    , continue-on-error : Optional ContinueOnError
    , runs-on : RunsOn
    , environment : Optional JobEnv
    , strategy : Optional Strategy
    , outputs : Optional (List { mapKey : Text, mapValue : Text })
    , env : Optional Env
    , defaults : Optional Defaults
    , steps : List Step
    , timeout-minutes : Optional Natural
    , `if` : Optional Text
    , services : Optional (List { mapKey : Text, mapValue : Service })
    , container : Optional Container
    , concurrency : Optional Concurrency
    , permissions :
        Optional (List { mapKey : Permission, mapValue : PermissionAccess })
    , secrets : Optional (List { mapKey : Text, mapValue : Text })
    }
