let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let arrayFrom = ../Utils/arrayFrom.dhall

let objectFrom = ../Utils/objectFrom.dhall

let orNull = ../Utils/orNull.dhall

let Strategy = ./Type.dhall

let Matrix/toJSON = ../Matrix/toJSON.dhall

let toJSON
    : Strategy -> JSON.Type
    = \(input : Strategy) ->
        JSON.object
          ( toMap
              { matrix = Matrix/toJSON input.matrix
              , fail-fast = orNull Bool JSON.bool input.fail-fast
              , max-parallel = orNull Natural JSON.natural input.max-parallel
              }
          )

in  toJSON
