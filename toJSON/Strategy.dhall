let JSON =
      https://prelude.dhall-lang.org/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let arrayFrom = ./utils/arrayFrom.dhall

let objectFrom = ./utils/objectFrom.dhall

let orNull = ./utils/orNull.dhall

let Strategy = ../types/Strategy.dhall

let toJSON
    : Strategy -> JSON.Type
    = \(input : Strategy) ->
        JSON.object
          ( toMap
              { matrix =
                  objectFrom
                    (List Text)
                    (arrayFrom Text JSON.string)
                    input.matrix
              , fail-fast = orNull Bool JSON.bool input.fail-fast
              , max-parallel = orNull Natural JSON.natural input.max-parallel
              }
          )

in  toJSON
