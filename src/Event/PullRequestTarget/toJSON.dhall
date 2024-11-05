let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let arrayFrom = ../../Utils/arrayFrom.dhall

let orNull = ../../Utils/orNull.dhall

let PullRequestTarget = ./Type.dhall

let Status = ./Status.dhall

let statusToJSON = ./statusToJSON.dhall

let toJSON
    : PullRequestTarget -> JSON.Type
    = \(input : PullRequestTarget) ->
        JSON.object
          ( toMap
              { types = orNull Status statusToJSON input.types
              , branches =
                  orNull (List Text) (arrayFrom Text JSON.string) input.branches
              , branches-ignore =
                  orNull
                    (List Text)
                    (arrayFrom Text JSON.string)
                    input.branches-ignore
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
