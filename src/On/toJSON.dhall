let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let arrayFrom = ../Utils/arrayFrom.dhall

let orNull = ../Utils/orNull.dhall

let On = ./Type.dhall

let Push = ../Event/Push/Type.dhall

let Push/toJSON = ../Event/Push/toJSON.dhall

let PullRequest = ../Event/PullRequest/Type.dhall

let PullRequest/toJSON = ../Event/PullRequest/toJSON.dhall

let PullRequestReview = ../Event/PullRequestReview/Type.dhall

let PullRequestReview/toJSON = ../Event/PullRequestReview/toJSON.dhall

let Delete = ../Event/Delete/Type.dhall

let Delete/toJSON = ../Event/Delete/toJSON.dhall

let Schedule = ../Event/Schedule/Type.dhall

let Schedule/toJSON = ../Event/Schedule/toJSON.dhall

let RepositoryDispatch = ../Event/RepositoryDispatch/Type.dhall

let RepositoryDispatch/toJSON = ../Event/RepositoryDispatch/toJSON.dhall

let WorkflowCall = ../Event/WorkflowCall/Type.dhall

let WorkflowCall/toJSON = ../Event/WorkflowCall/toJSON.dhall

let WorkflowDispatch = ../Event/WorkflowDispatch/Type.dhall

let WorkflowDispatch/toJSON = ../Event/WorkflowDispatch/toJSON.dhall

let WorkflowRun = ../Event/WorkflowRun/Type.dhall

let WorkflowRun/toJSON = ../Event/WorkflowRun/toJSON.dhall

let Release = ../Event/Release/Type.dhall

let Release/toJSON = ../Event/Release/toJSON.dhall

let MergeGroup = ../Event/MergeGroup/Type.dhall

let MergeGroup/toJSON = ../Event/MergeGroup/toJSON.dhall

let PullRequestTarget = ../Event/PullRequestTarget/Type.dhall

let PullRequestTarget/toJSON = ../Event/PullRequestTarget/toJSON.dhall

let toJSON
    : On -> JSON.Type
    = \(input : On) ->
        JSON.object
          ( toMap
              { push = orNull Push Push/toJSON input.push
              , pull_request =
                  orNull PullRequest PullRequest/toJSON input.pull_request
              , pull_request_review =
                  orNull
                    PullRequestReview
                    PullRequestReview/toJSON
                    input.pull_request_review
              , pull_request_target =
                  orNull
                    PullRequestTarget
                    PullRequestTarget/toJSON
                    input.pull_request_target
              , delete = orNull Delete Delete/toJSON input.delete
              , schedule =
                  orNull
                    (List Schedule)
                    (arrayFrom Schedule Schedule/toJSON)
                    input.schedule
              , repository_dispatch =
                  orNull
                    RepositoryDispatch
                    RepositoryDispatch/toJSON
                    input.repository_dispatch
              , workflow_call =
                  orNull WorkflowCall WorkflowCall/toJSON input.workflow_call
              , workflow_dispatch =
                  orNull
                    WorkflowDispatch
                    WorkflowDispatch/toJSON
                    input.workflow_dispatch
              , workflow_run =
                  orNull WorkflowRun WorkflowRun/toJSON input.workflow_run
              , release = orNull Release Release/toJSON input.release
              , merge_group =
                  orNull MergeGroup MergeGroup/toJSON input.merge_group
              }
          )

in  toJSON
