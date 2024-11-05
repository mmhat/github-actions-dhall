let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let arrayFrom = ../../Utils/arrayFrom.dhall

let orNull = ../../Utils/orNull.dhall

let MergeGroup = ./Type.dhall

let Status = ./Status.dhall

let statusToJSON = ./statusToJSON.dhall

let toJSON
    : MergeGroup -> JSON.Type
    = \(input : MergeGroup) ->
        JSON.object
          ( toMap
              { types =
                  orNull
                    (List Status)
                    (arrayFrom Status statusToJSON)
                    input.types
              }
          )

in  toJSON
