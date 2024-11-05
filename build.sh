#!/usr/bin/bash

set -eu

is-record-type () {
    local file="${1}"
    local c1="$(dhall --file "${type_file}" | tr -d '\n' | cut -c 1)"
    [[ "${c1}" == '{' ]]
}

declare -a schema_files=()

for f in $(find toJSON -type f -name '*.dhall' -printf '%P\n'); do
    echo $f
    if [[ -f "src/${f%.dhall}/Type.dhall" ]]; then
        git mv "toJSON/$f" "src/${f%.dhall}/toJSON.dhall"
    fi
done

exit 0

for type_file in $(find src -type f -name 'Type.dhall'); do
    c1="$(dhall --file "${type_file}" | tr -d '\n' | cut -c 1)"
    if is-record-type "${type_file}"; then
        dir="$(dirname "${type_file}")"
        name="$(basename "${dir}")"
        default_file="${dir}/default.dhall"
        schema_file="${dir}.dhall"
        if [[ ! -f "${default_file}" ]]; then
            echo "Writing ${default_file}"
            dhall <<< '{=}' > "${default_file}"
        fi
        echo "Writing ${schema_file}"
        echo "{ Type = ./${name}/Type.dhall, default = ./${name}/default.dhall }" > "${schema_file}"
        dhall format "${schema_file}"
        schema_files+=("${schema_file}")
    fi
done
dhall package --name schemas.dhall "${schema_files[@]}"

find src -depth -type d -exec dhall package {} \;
find src -type f -name '*.dhall' -print0 | xargs -0 dhall format
find src -type f -name package.dhall -print0 | xargs -0 dhall freeze --all
