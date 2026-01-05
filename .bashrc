#shellcheck disable=SC2034

export PATH=${HOME}/.bin:${HOME}/.local/bin:${HOME}/.cargo/bin:${PATH}
export MANPAGER="nvim +Man!"
PS1_INCLUDE_HOSTNAME=false
PS1_USERNAME_BG=12

function cpstat() {
  local pid="${1:-$(pgrep -xn cp)}" src dst
  [[ "$pid" ]] || return
  while [[ -f "/proc/$pid/fd/3" ]]; do
    read -r src dst < <(stat -L --printf '%s ' "/proc/$pid/fd/"{3,4})
    (( src )) || break
    printf 'cp %d%%\r' $((dst*100/src))
    sleep 1
  done
  echo
}

#eval "$(zoxide init --cmd cd bash)"
