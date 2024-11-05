let JSON =
      https://prelude.dhall-lang.org/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let arrayFrom = ../utils/arrayFrom.dhall

let orNull = ../utils/orNull.dhall

let WorkflowRun = ../../types/events/WorkflowRun.dhall

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
