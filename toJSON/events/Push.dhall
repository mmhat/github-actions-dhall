let JSON =
      https://prelude.dhall-lang.org/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let arrayFrom = ../utils/arrayFrom.dhall

let orNull = ../utils/orNull.dhall

let Push = ../../types/events/Push.dhall

let toJSON
    : Push -> JSON.Type
    = \(input : Push) ->
        JSON.object
          ( toMap
              { branches =
                  orNull (List Text) (arrayFrom Text JSON.string) input.branches
              , branches-ignore =
                  orNull
                    (List Text)
                    (arrayFrom Text JSON.string)
                    input.branches-ignore
              , tags =
                  orNull (List Text) (arrayFrom Text JSON.string) input.tags
              , paths =
                  orNull (List Text) (arrayFrom Text JSON.string) input.paths
              , paths-ignore =
                  orNull
                    (List Text)
                    (arrayFrom Text JSON.string)
                    input.paths-ignore
              }
          )

in  toJSON
