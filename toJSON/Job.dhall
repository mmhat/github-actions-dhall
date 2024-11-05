let JSON =
      https://prelude.dhall-lang.org/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let List/map =
      https://prelude.dhall-lang.org/List/map.dhall
        sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let Map =
      https://prelude.dhall-lang.org/Map/Type.dhall
        sha256:210c7a9eba71efbb0f7a66b3dcf8b9d3976ffc2bc0e907aadfb6aa29c333e8ed

let Map/Entry =
      https://prelude.dhall-lang.org/Map/Entry.dhall
        sha256:f334283bdd9cd88e6ea510ca914bc221fc2dab5fb424d24514b2e0df600d5346

let arrayFrom = ./utils/arrayFrom.dhall

let objectFrom = ./utils/objectFrom.dhall

let orNull = ./utils/orNull.dhall

let Job = ../types/Job.dhall

let Concurrency = ../types/Concurrency.dhall

let Concurrency/toJSON = ./Concurrency.dhall

let Container = ../types/Container.dhall

let Container/toJSON = ./Container.dhall

let Defaults = ../types/Defaults.dhall

let Defaults/toJSON = ./Defaults.dhall

let Env = ../types/Env.dhall

let Env/toJSON = ./Env.dhall

let JobEnv = ../types/JobEnv.dhall

let JobEnv/toJSON = ./JobEnv.dhall

let RunsOn/toJSON = ./RunsOn.dhall

let Service = ../types/Service.dhall

let Service/toJSON = ./Service.dhall

let Step = ../types/Step.dhall

let Step/toJSON = ./Step.dhall

let Strategy = ../types/Strategy.dhall

let Strategy/toJSON = ./Strategy.dhall

let Permission = ../types/Permission.dhall

let PermissionAccess = ../types/PermissionAccess.dhall

let PermissionAccess/toJSON = ./PermissionAccess.dhall

let ContinueOnError = ../types/ContinueOnError.dhall

let ContinueOnError/toJSON = ./ContinueOnError.dhall

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
