let On = ../On/Type.dhall

let Env = ../Env/Type.dhall

let Concurrency = ../Concurrency/Type.dhall

let Defaults = ../Defaults/Type.dhall

let Job = ../Job/Type.dhall

let Permission = ../Permission/Type.dhall

let PermissionAccess = ../PermissionAccess/Type.dhall

in  { name : Text
    , on : On
    , env : Optional Env
    , concurrency : Optional Concurrency
    , defaults : Optional Defaults
    , permissions :
        Optional (List { mapKey : Permission, mapValue : PermissionAccess })
    , jobs : List { mapKey : Text, mapValue : Job }
    }
