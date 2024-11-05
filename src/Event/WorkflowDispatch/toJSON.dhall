let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let Map =
      https://prelude.dhall-lang.org/v23.0.0/Map/Type.dhall
        sha256:210c7a9eba71efbb0f7a66b3dcf8b9d3976ffc2bc0e907aadfb6aa29c333e8ed

let objectFrom = ../../Utils/objectFrom.dhall

let orNull = ../../Utils/orNull.dhall

let WorkflowDispatch = ./Type.dhall

let Input = ../../Input/Type.dhall

let Input/toJSON = ../../Input/toJSON.dhall

let toJSON
    : WorkflowDispatch -> JSON.Type
    = \(input : WorkflowDispatch) ->
        JSON.object
          ( toMap
              { inputs =
                  orNull
                    (Map Text Input)
                    (objectFrom Input Input/toJSON)
                    input.inputs
              }
          )

in  toJSON
