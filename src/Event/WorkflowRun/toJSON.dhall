let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let arrayFrom = ../../Utils/arrayFrom.dhall

let orNull = ../../Utils/orNull.dhall

let WorkflowRun = ./Type.dhall

let toJSON
    : WorkflowRun -> JSON.Type
    = \(input : WorkflowRun) ->
        JSON.object
          ( toMap
              { workflows = arrayFrom Text JSON.string input.workflows
              , types =
                  orNull (List Text) (arrayFrom Text JSON.string) input.types
              , branches =
                  orNull (List Text) (arrayFrom Text JSON.string) input.branches
              }
          )

in  toJSON
