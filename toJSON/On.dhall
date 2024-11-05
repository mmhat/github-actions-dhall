let JSON =
      https://prelude.dhall-lang.org/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let arrayFrom = ./utils/arrayFrom.dhall

let orNull = ./utils/orNull.dhall

let On = ../types/On.dhall

let Push = ../types/events/Push.dhall

let Push/toJSON = ./events/Push.dhall

let PullRequest = ../types/events/PullRequest.dhall

let PullRequest/toJSON = ./events/PullRequest.dhall

let PullRequestReview = ../types/events/PullRequestReview.dhall

let PullRequestReview/toJSON = ./events/PullRequestReview.dhall

let Delete = ../types/events/Delete.dhall

let Delete/toJSON = ./events/Delete.dhall

let Schedule = ../types/events/Schedule.dhall

let Schedule/toJSON = ./events/Schedule.dhall

let RepositoryDispatch = ../types/events/RepositoryDispatch.dhall

let RepositoryDispatch/toJSON = ./events/RepositoryDispatch.dhall

let WorkflowCall = ../types/events/WorkflowCall.dhall

let WorkflowCall/toJSON = ./events/WorkflowCall.dhall

let WorkflowDispatch = ../types/events/WorkflowDispatch.dhall

let WorkflowDispatch/toJSON = ./events/WorkflowDispatch.dhall

let WorkflowRun = ../types/events/WorkflowRun.dhall

let WorkflowRun/toJSON = ./events/WorkflowRun.dhall

let Release = ../types/events/Release.dhall

let Release/toJSON = ./events/Release.dhall

let MergeGroup = ../types/events/MergeGroup.dhall

let MergeGroup/toJSON = ./events/MergeGroup.dhall

let PullRequestTarget = ../types/events/PullRequestTarget.dhall

let PullRequestTarget/toJSON = ./events/PullRequestTarget.dhall

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
