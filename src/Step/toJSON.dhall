let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let Map =
      https://prelude.dhall-lang.org/v23.0.0/Map/Type.dhall
        sha256:210c7a9eba71efbb0f7a66b3dcf8b9d3976ffc2bc0e907aadfb6aa29c333e8ed

let objectFrom = ./utils/objectFrom.dhall

let orNull = ./utils/orNull.dhall

let Step = ../types/Step.dhall

let Env = ../types/Env.dhall

let Env/toJSON = ./Env.dhall

let Strategy = ../types/Strategy.dhall

let Strategy/toJSON = ./Strategy.dhall

let toJSON
    : Step -> JSON.Type
    = \(input : Step) ->
        JSON.object
          ( toMap
              { id = orNull Text JSON.string input.id
              , name = orNull Text JSON.string input.name
              , env = orNull Env Env/toJSON input.env
              , run = orNull Text JSON.string input.run
              , uses = orNull Text JSON.string input.uses
              , shell = orNull Text JSON.string input.shell
              , `with` =
                  orNull
                    (Map Text Text)
                    (objectFrom Text JSON.string)
                    input.`with`
              , continue-on-error =
                  orNull Bool JSON.bool input.continue-on-error
              , strategy = orNull Strategy Strategy/toJSON input.strategy
              , `if` = orNull Text JSON.string input.`if`
              , working-directory =
                  orNull Text JSON.string input.working-directory
              , timeout-minutes =
                  orNull Natural JSON.natural input.timeout-minutes
              }
          )

in  toJSON
