let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let PullRequestTarget/Types =
      ../../../types/events/pull_request_target/types.dhall

let toJSON
    : PullRequestTarget/Types -> JSON.Type
    = \(input : PullRequestTarget/Types) -> JSON.string (showConstructor input)

in  toJSON
