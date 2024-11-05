let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let orNull = ./utils/orNull.dhall

let Secret = ../types/Secret.dhall

let toJSON
    : Secret -> JSON.Type
    = \(input : Secret) ->
        JSON.object
          ( toMap
              { description = orNull Text JSON.string input.description
              , required = JSON.bool input.required
              }
          )

in  toJSON
