let JSON =
      https://prelude.dhall-lang.org/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let orNull = ./utils/orNull.dhall

let Input = ../types/Input.dhall

let InputType = ../types/InputType.dhall

let InputType/toJSON = ./InputType.dhall

let toJSON
    : Input -> JSON.Type
    = \(input : Input) ->
        JSON.object (toMap
        { description = orNull Text JSON.string input.description
        , required = JSON.bool input.required
        , default = orNull Text JSON.string input.default
        , type = orNull InputType InputType/toJSON input.type
        })

in  toJSON
