let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let arrayFrom = ../utils/arrayFrom.dhall

let orNull = ../utils/orNull.dhall

let PullRequestTarget = ../../types/events/PullRequestTarget.dhall

let PullRequestTarget/Types = ../../types/events/pull_request_target/types.dhall

let PullRequestTarget/Types/toJSON = ./PullRequestTarget/Types.dhall

let toJSON
    : PullRequestTarget -> JSON.Type
    = \(input : PullRequestTarget) ->
        JSON.object
          ( toMap
              { types =
                  orNull
                    PullRequestTarget/Types
                    PullRequestTarget/Types/toJSON
                    input.types
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
