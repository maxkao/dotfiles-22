#!/bin/sh
## find-largefiles.sh

function find_largefiles () {
    (set -x; _find_largefiles "${@}"; return)
    return
}

function _find_largefiles () {
    # find-largefiles() -- find files larger than size (default: +10M)
    SIZE=${1:-"+10M"}
    if [ -n "${1}" ]; then
        shift
    fi
    find . -xdev -type f -size "${SIZE}" -exec ls -al "${@}" {} \;
    return
}

if [ -n "${BASH_SOURCE}" ] && [ "${BASH_SOURCE}" == "${0}" ]; then
    find_largefiles "${@}"
    exit
fi
