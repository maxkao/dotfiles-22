#!/usr/bin/env bash
### bashrc.bashmarks.sh
## bashmarks
    # l()  -- list bashmarks
    # s()  -- save bashmarks as $1
    # g()  -- goto bashmark $1
    # p()  -- print bashmark $1
    # d()  -- delete bashmark $1
# shellcheck source=../bashmarks/bashmarks.sh
source "${__DOTFILES}/etc/bashmarks/bashmarks.sh"
lsbashmarks () {
    # lsbashmarks() -- list Bashmarks (e.g. for NERDTree)
    export -p | grep -E 'DIR_\w+="' | pyline "line[15:].replace('\"','').split('=',1)"
}

    # see also: ${__DOTFILES}/scripts/nerdtree_to_bashmarks.py


