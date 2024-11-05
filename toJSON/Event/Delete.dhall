let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let Map =
      https://prelude.dhall-lang.org/v23.0.0/Map/Type.dhall
        sha256:210c7a9eba71efbb0f7a66b3dcf8b9d3976ffc2bc0e907aadfb6aa29c333e8ed

let Delete = ../../types/events/Delete.dhall

let toJSON
    : Delete -> JSON.Type
    = \(input : Delete) -> JSON.object (toMap input : Map Text JSON.Type)

in  toJSON
