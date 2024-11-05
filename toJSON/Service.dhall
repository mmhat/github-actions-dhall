let JSON =
      https://prelude.dhall-lang.org/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let arrayFrom = ./utils/arrayFrom.dhall

let orNull = ./utils/orNull.dhall

let Service = ../types/Service.dhall

let Credentials = ../types/Credentials.dhall

let Credentials/toJSON = ./Credentials.dhall

let Env = ../types/Env.dhall

let Env/toJSON = ./Env.dhall

let toJSON
    : Service -> JSON.Type
    = \(input : Service) ->
        JSON.object
          ( toMap
              { image = JSON.string input.image
              , credentials =
                  orNull Credentials Credentials/toJSON input.credentials
              , env = orNull Env Env/toJSON input.env
              , ports =
                  orNull (List Text) (arrayFrom Text JSON.string) input.ports
              , volumes =
                  orNull (List Text) (arrayFrom Text JSON.string) input.volumes
              , options = orNull Text JSON.string input.options
              }
          )

in  toJSON
