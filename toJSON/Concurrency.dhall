let JSON = https://prelude.dhall-lang.org/JSON/package.dhall

let Concurrency = ../types/Concurrency.dhall

let toJSON
    : Concurrency -> JSON.Type
    = \(input : Concurrency) ->
        JSON.object
          ( toMap
              { group = JSON.string input.group
              , cancel-in-progress = JSON.bool input.cancel-in-progress
              }
          )

in  toJSON
