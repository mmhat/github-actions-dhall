let Push = ../Event/Push/Type.dhall

let PullRequest = ../Event/PullRequest/Type.dhall

let PullRequestReview = ../Event/PullRequestReview/Type.dhall

let Delete = ../Event/Delete/Type.dhall

let Schedule = ../Event/Schedule/Type.dhall

let RepositoryDispatch = ../Event/RepositoryDispatch/Type.dhall

let WorkflowCall = ../Event/WorkflowCall/Type.dhall

let WorkflowDispatch = ../Event/WorkflowDispatch/Type.dhall

let WorkflowRun = ../Event/WorkflowRun/Type.dhall

let Release = ../Event/Release/Type.dhall

let MergeGroup = ../Event/MergeGroup/Type.dhall

let PullRequestTarget = ../Event/PullRequestTarget/Type.dhall

in  { push : Optional Push
    , pull_request : Optional PullRequest
    , pull_request_review : Optional PullRequestReview
    , pull_request_target : Optional PullRequestTarget
    , delete : Optional Delete
    , schedule : Optional (List Schedule)
    , repository_dispatch : Optional RepositoryDispatch
    , workflow_call : Optional WorkflowCall
    , workflow_dispatch : Optional WorkflowDispatch
    , workflow_run : Optional WorkflowRun
    , release : Optional Release
    , merge_group : Optional MergeGroup
    }
