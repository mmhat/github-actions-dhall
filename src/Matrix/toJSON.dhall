let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let arrayFrom = ../Utils/arrayFrom.dhall

let objectFrom = ../Utils/objectFrom.dhall

let Matrix = ./Type.dhall

let toJSON
    : Matrix -> JSON.Type
    = \(input : Matrix) ->
        merge
          { Expression = JSON.string
          , Simple = objectFrom (List Text) (arrayFrom Text JSON.string)
          , Raw = \(json : JSON.Type) -> json
          }
          input

in  toJSON
