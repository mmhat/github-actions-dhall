let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let orNull = ./utils/orNull.dhall

let Output = ../types/Output.dhall

let toJSON
    : Output -> JSON.Type
    = \(input : Output) ->
        JSON.object
          ( toMap
              { description = orNull Text JSON.string input.description
              , value = JSON.string input.value
              }
          )

in  toJSON
