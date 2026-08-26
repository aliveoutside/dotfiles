#!/bin/sh
set -eu

pnpm_home=${PNPM_HOME:-"$HOME/.local/share/pnpm"}
bw="$pnpm_home/bin/bw"
[ -x "$bw" ] && exit 0

if [ "$(uname -s)" = Linux ] && [ -r /etc/os-release ]; then
    # shellcheck disable=SC1091
    . /etc/os-release
    case " ${ID:-} ${ID_LIKE:-} " in
        *" arch "*)
            sudo pacman --sync --needed --noconfirm -- nodejs pnpm
            mkdir -p "$pnpm_home/bin"
            PNPM_HOME="$pnpm_home" PATH="$pnpm_home/bin:$PATH" \
                pnpm add --global @bitwarden/cli
            exit 0
            ;;
    esac
fi

printf 'chezmoi: install @bitwarden/cli at %s before templates can be rendered\n' "$bw" >&2
exit 1
