let JSON =
      https://prelude.dhall-lang.org/v23.0.0/JSON/package.dhall
        sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let arrayFrom = ../Utils/arrayFrom.dhall

let orNull = ../Utils/orNull.dhall

let Service = ./Type.dhall

let Credentials = ../Credentials/Type.dhall

let Credentials/toJSON = ../Credentials/toJSON.dhall

let Env = ../Env/Type.dhall

let Env/toJSON = ../Env/toJSON.dhall

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
