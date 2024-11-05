let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let Concurrency = ./Type.dhall

let toJSON
    : Concurrency -> JSON.Type
    = \(input : Concurrency) ->
        JSON.object
          ( toMap
              { group = JSON.string input.group
              , cancel-in-progress = JSON.bool input.cancel-in-progress
              }
          )

in  toJSON
