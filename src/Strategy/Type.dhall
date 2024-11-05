let Matrix = ../Matrix/Type.dhall

in  { matrix : Matrix
    , fail-fast : Optional Bool
    , max-parallel : Optional Natural
    }
