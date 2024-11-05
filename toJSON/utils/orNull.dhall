let JSON =
      https://prelude.dhall-lang.org/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let Optional/fold =
      https://prelude.dhall-lang.org/Optional/fold.dhall
        sha256:c5b9d72f6f62bdaa0e196ac1c742cc175cd67a717b880fb8aec1333a5a4132cf

let orNull
    : forall (a : Type) -> (a -> JSON.Type) -> Optional a -> JSON.Type
    = \(a : Type) ->
      \(f : a -> JSON.Type) ->
      \(o : Optional a) ->
        Optional/fold a o JSON.Type f JSON.null

in  orNull
