let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let orNull = ../Utils/orNull.dhall

let Input = ./Type.dhall

let InputType = ./InputType.dhall

let inputTypeToJSON = ./inputTypeToJSON.dhall

let toJSON
    : Input -> JSON.Type
    = \(input : Input) ->
        JSON.object
          ( toMap
              { description = orNull Text JSON.string input.description
              , required = JSON.bool input.required
              , default = orNull Text JSON.string input.default
              , type = orNull InputType inputTypeToJSON input.type
              }
          )

in  toJSON
