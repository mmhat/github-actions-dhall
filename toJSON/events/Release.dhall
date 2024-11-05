let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let arrayFrom = ../utils/arrayFrom.dhall

let orNull = ../utils/orNull.dhall

let Release = ../../types/events/Release.dhall

let Release/Types = ../../types/events/release/types.dhall

let Release/Types/toJSON = ./Release/Types.dhall

let toJSON
    : Release -> JSON.Type
    = \(input : Release) ->
        JSON.object
          ( toMap
              { types =
                  orNull
                    (List Release/Types)
                    (arrayFrom Release/Types Release/Types/toJSON)
                    input.types
              }
          )

in  toJSON
