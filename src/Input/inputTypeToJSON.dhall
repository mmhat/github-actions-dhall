let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let InputType = ./InputType.dhall

let inputTypeToJSON
    : InputType -> JSON.Type
    = \(input : InputType) -> JSON.string (showConstructor input)

in  inputTypeToJSON
