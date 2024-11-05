let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let arrayFrom = ../utils/arrayFrom.dhall

let orNull = ../utils/orNull.dhall

let MergeGroup = ../../types/events/MergeGroup.dhall

let MergeGroup/Types = ../../types/events/merge_group/types.dhall

let MergeGroup/Types/toJSON = ./MergeGroup/Types.dhall

let toJSON
    : MergeGroup -> JSON.Type
    = \(input : MergeGroup) ->
        JSON.object
          ( toMap
              { types =
                  orNull
                    (List MergeGroup/Types)
                    (arrayFrom MergeGroup/Types MergeGroup/Types/toJSON)
                    input.types
              }
          )

in  toJSON
