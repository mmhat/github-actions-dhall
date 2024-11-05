let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let arrayFrom = ../../Utils/arrayFrom.dhall

let orNull = ../../Utils/orNull.dhall

let RepositoryDispatch = ./Type.dhall

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
