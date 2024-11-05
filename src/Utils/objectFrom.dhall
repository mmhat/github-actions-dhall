let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let Map =
      https://prelude.dhall-lang.org/v23.0.0/Map/Type.dhall
        sha256:210c7a9eba71efbb0f7a66b3dcf8b9d3976ffc2bc0e907aadfb6aa29c333e8ed

let Map/map =
      https://prelude.dhall-lang.org/v23.0.0/Map/map.dhall
        sha256:23e09b0b9f08649797dfe1ca39755d5e1c7cad2d0944bdd36c7a0bf804bde8d0

let objectFrom
    : forall (a : Type) -> (a -> JSON.Type) -> Map Text a -> JSON.Type
    = \(a : Type) ->
      \(f : a -> JSON.Type) ->
      \(map : Map Text a) ->
        JSON.object (Map/map Text a JSON.Type f map)

in  objectFrom
