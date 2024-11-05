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

in  { push = None Push
    , pull_request = None PullRequest
    , pull_request_review = None PullRequestReview
    , pull_request_target = None PullRequestTarget
    , delete = None Delete
    , schedule = None (List Schedule)
    , repository_dispatch = None RepositoryDispatch
    , workflow_call = None WorkflowCall
    , workflow_dispatch = None WorkflowDispatch
    , workflow_run = None WorkflowRun
    , release = None Release
    , merge_group = None MergeGroup
    }
