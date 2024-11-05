let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/Type.dhall
        sha256:40edbc9371979426df63e064333b02689b969c4cfbbccfa481216d2d1a6e9759

let Map =
      https://prelude.dhall-lang.org/v23.0.0/Map/Type.dhall
        sha256:210c7a9eba71efbb0f7a66b3dcf8b9d3976ffc2bc0e907aadfb6aa29c333e8ed

in  < Expression : Text | Simple : Map Text (List Text) | Raw : JSON >
