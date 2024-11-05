let JSON =
      https://prelude.dhall-lang.org/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let Map =
      https://prelude.dhall-lang.org/Map/Type.dhall
        sha256:210c7a9eba71efbb0f7a66b3dcf8b9d3976ffc2bc0e907aadfb6aa29c333e8ed

let objectFrom = ../utils/objectFrom.dhall

let orNull = ../utils/orNull.dhall

let WorkflowCall = ../../types/events/WorkflowCall.dhall

let Input = ../../types/Input.dhall

let Input/toJSON = ../Input.dhall

let Output = ../../types/Output.dhall

let Output/toJSON = ../Output.dhall

let Secret = ../../types/Secret.dhall

let Secret/toJSON = ../Secret.dhall

let toJSON
    : WorkflowCall -> JSON.Type
    = \(input : WorkflowCall) ->
        JSON.object
          ( toMap
              { inputs =
                  orNull
                    (Map Text Input)
                    (objectFrom Input Input/toJSON)
                    input.inputs
              , outputs =
                  orNull
                    (Map Text Output)
                    (objectFrom Output Output/toJSON)
                    input.outputs
              , secrets =
                  orNull
                    (Map Text Secret)
                    (objectFrom Secret Secret/toJSON)
                    input.secrets
              }
          )

in  toJSON
