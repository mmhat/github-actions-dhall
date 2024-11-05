let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let orNull = ./utils/orNull.dhall

let Defaults = ../types/Defaults.dhall

let Run
    : Type
    = { shell : Optional Text, working-directory : Optional Text }

let Run/toJSON
    : Run -> JSON.Type
    = \(input : Run) ->
        JSON.object
          ( toMap
              { shell = orNull Text JSON.string input.shell
              , working-directory =
                  orNull Text JSON.string input.working-directory
              }
          )

let toJSON
    : Defaults -> JSON.Type
    = \(input : Defaults) ->
        JSON.object (toMap { run = orNull Run Run/toJSON input.run })

in  toJSON
