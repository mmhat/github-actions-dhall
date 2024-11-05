let Env = ../Env/Type.dhall

let Defaults = ../Defaults/Type.dhall

let Concurrency = ../Concurrency/Type.dhall

let Permission = ../Permission/Type.dhall

let PermissionAccess = ../PermissionAccess/Type.dhall

in  { env = None Env
    , defaults = None Defaults
    , concurrency = None Concurrency
    , permissions =
        None (List { mapKey : Permission, mapValue : PermissionAccess })
    }
