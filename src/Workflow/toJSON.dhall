let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let List/map =
      https://prelude.dhall-lang.org/v23.0.0/List/map.dhall
        sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let Map =
      https://prelude.dhall-lang.org/v23.0.0/Map/Type.dhall
        sha256:210c7a9eba71efbb0f7a66b3dcf8b9d3976ffc2bc0e907aadfb6aa29c333e8ed

let Map/Entry =
      https://prelude.dhall-lang.org/v23.0.0/Map/Entry.dhall
        sha256:f334283bdd9cd88e6ea510ca914bc221fc2dab5fb424d24514b2e0df600d5346

let objectFrom = ../Utils/objectFrom.dhall

let orNull = ../Utils/orNull.dhall

let Workflow = ./Type.dhall

let Env = ../Env/Type.dhall

let Env/toJSON = ../Env/toJSON.dhall

let Concurrency = ../Concurrency/Type.dhall

let Concurrency/toJSON = ../Concurrency/toJSON.dhall

let Defaults = ../Defaults/Type.dhall

let Defaults/toJSON = ../Defaults/toJSON.dhall

let Job = ../Job/Type.dhall

let Job/toJSON = ../Job/toJSON.dhall

let On/toJSON = ../On/toJSON.dhall

let Permission = ../Permission/Type.dhall

let PermissionAccess = ../PermissionAccess/Type.dhall

let PermissionAccess/toJSON = ../PermissionAccess/toJSON.dhall

let toJSON =
      \(input : Workflow) ->
        JSON.object
          ( toMap
              { name = JSON.string input.name
              , on = On/toJSON input.on
              , env = orNull Env Env/toJSON input.env
              , concurrency =
                  orNull Concurrency Concurrency/toJSON input.concurrency
              , defaults = orNull Defaults Defaults/toJSON input.defaults
              , permissions =
                  orNull
                    (Map Permission PermissionAccess)
                    ( \(some : Map Permission PermissionAccess) ->
                        JSON.object
                          ( List/map
                              (Map/Entry Permission PermissionAccess)
                              (Map/Entry Text JSON.Type)
                              ( \ ( entry
                                  : Map/Entry Permission PermissionAccess
                                  ) ->
                                  JSON.keyValue
                                    JSON.Type
                                    (showConstructor entry.mapKey)
                                    (PermissionAccess/toJSON entry.mapValue)
                              )
                              some
                          )
                    )
                    input.permissions
              , jobs = objectFrom Job Job/toJSON input.jobs
              }
          )

in  toJSON