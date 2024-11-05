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

let arrayFrom = ../Utils/arrayFrom.dhall

let objectFrom = ../Utils/objectFrom.dhall

let orNull = ../Utils/orNull.dhall

let Job = ./Type.dhall

let Concurrency = ../Concurrency/Type.dhall

let Concurrency/toJSON = ../Concurrency/toJSON.dhall

let Container = ../Container/Type.dhall

let Container/toJSON = ../Container/toJSON.dhall

let Defaults = ../Defaults/Type.dhall

let Defaults/toJSON = ../Defaults/toJSON.dhall

let Env = ../Env/Type.dhall

let Env/toJSON = ../Env/toJSON.dhall

let JobEnv = ../JobEnv/Type.dhall

let JobEnv/toJSON = ../JobEnv/toJSON.dhall

let RunsOn/toJSON = ../RunsOn/toJSON.dhall

let Service = ../Service/Type.dhall

let Service/toJSON = ../Service/toJSON.dhall

let Step = ../Step/Type.dhall

let Step/toJSON = ../Step/toJSON.dhall

let Strategy = ../Strategy/Type.dhall

let Strategy/toJSON = ../Strategy/toJSON.dhall

let Permission = ../Permission/Type.dhall

let PermissionAccess = ../PermissionAccess/Type.dhall

let PermissionAccess/toJSON = ../PermissionAccess/toJSON.dhall

let ContinueOnError = ../ContinueOnError/Type.dhall

let ContinueOnError/toJSON = ../ContinueOnError/toJSON.dhall

let toJSON
    : Job -> JSON.Type
    = \(input : Job) ->
        JSON.object
          ( toMap
              { name = orNull Text JSON.string input.name
              , needs =
                  orNull (List Text) (arrayFrom Text JSON.string) input.needs
              , continue-on-error =
                  orNull
                    ContinueOnError
                    ContinueOnError/toJSON
                    input.continue-on-error
              , runs-on = RunsOn/toJSON input.runs-on
              , environment = orNull JobEnv JobEnv/toJSON input.environment
              , strategy = orNull Strategy Strategy/toJSON input.strategy
              , outputs =
                  orNull
                    (Map Text Text)
                    (objectFrom Text JSON.string)
                    input.outputs
              , env = orNull Env Env/toJSON input.env
              , defaults = orNull Defaults Defaults/toJSON input.defaults
              , steps = arrayFrom Step Step/toJSON input.steps
              , timeout-minutes =
                  orNull Natural JSON.natural input.timeout-minutes
              , `if` = orNull Text JSON.string input.`if`
              , services =
                  orNull
                    (Map Text Service)
                    (objectFrom Service Service/toJSON)
                    input.services
              , container = orNull Container Container/toJSON input.container
              , concurrency =
                  orNull Concurrency Concurrency/toJSON input.concurrency
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
              , secrets =
                  orNull
                    (Map Text Text)
                    (objectFrom Text JSON.string)
                    input.secrets
              }
          )

in  toJSON
