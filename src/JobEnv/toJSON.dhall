let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let orNull = ../Utils/orNull.dhall

let JobEnv = ./Type.dhall

let toJSON
    : JobEnv -> JSON.Type
    = \(input : JobEnv) ->
        JSON.object
          ( toMap
              { name = JSON.string input.name
              , url = orNull Text JSON.string input.url
              }
          )

in  toJSON
