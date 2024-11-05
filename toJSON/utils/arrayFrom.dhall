let JSON =
      https://prelude.dhall-lang.org/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let List/map =
      https://prelude.dhall-lang.org/List/map.dhall
        sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let arrayFrom
    : forall (a : Type) -> (a -> JSON.Type) -> List a -> JSON.Type
    = \(a : Type) ->
      \(f : a -> JSON.Type) ->
      \(list : List a) ->
        JSON.array (List/map a JSON.Type f list)

in  arrayFrom
