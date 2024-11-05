let JSON =
      https://prelude.dhall-lang.org/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let arrayFrom = ../utils/arrayFrom.dhall

let orNull = ../utils/orNull.dhall

let RepositoryDispatch = ../../types/events/RepositoryDispatch.dhall

let toJSON
    : RepositoryDispatch -> JSON.Type
    = \(input : RepositoryDispatch) ->
        JSON.object
          ( toMap
              { types =
                  orNull (List Text) (arrayFrom Text JSON.string) input.types
              }
          )

in  toJSON
