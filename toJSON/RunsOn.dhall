let JSON =
      https://prelude.dhall-lang.org/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let RunsOn = ../types/RunsOn.dhall

let toJSON
    : RunsOn -> JSON.Type
    = \(input : RunsOn) -> JSON.string (showConstructor input)

in  toJSON
