#!/usr/bin/env bash

# Use terminal colors (ANSI via tput). No hex, no truecolor.
b="$(tput bold 2>/dev/null || true)"
dim="$(tput dim 2>/dev/null || true)"
rst="$(tput sgr0 2>/dev/null || true)"

c_cyan="$(tput setaf 6 2>/dev/null || true)"
c_blue="$(tput setaf 4 2>/dev/null || true)"
c_green="$(tput setaf 2 2>/dev/null || true)"
c_yellow="$(tput setaf 3 2>/dev/null || true)"
c_red="$(tput setaf 1 2>/dev/null || true)"
c_mag="$(tput setaf 5 2>/dev/null || true)"
c_white="$(tput setaf 7 2>/dev/null || true)"

pause_line() {
  local msg="$1"
  local delay="${2:-0.25}"
  printf "%b\n" "$msg"
  sleep "$delay"
}

# Simple ASCII spinner to fake work in progress.
spinner_check() {
  local label="$1"
  local dots="$2"
  local result="$3"
  local result_color="$4"
  local ticks="${5:-14}"
  local frames='|/-\\'
  local i frame

  for ((i = 0; i < ticks; i++)); do
    frame="${frames:i%4:1}"
    printf "\r${c_cyan}[CHECK]${rst} ${c_white}%s${rst} ${dim}%s${rst} ${frame}" "$label" "$dots"
    sleep 0.07
  done

  printf "\r${c_cyan}[CHECK]${rst} ${c_white}%s${rst} ${dim}%s${rst} ${b}%b%s${rst}\n" "$label" "$dots" "$result_color" "$result"
  sleep 0.18
}

print_banner() {
  local purple=$'\033[38;2;171;146;252m' # #ab92fc
  local lime=$'\033[38;2;135;255;95m'    # #87ff5f
  printf "%b" "$purple"
  cat <<'ASCII'
                  _            ____
                 : \           |   \    .
                 |  \ .        |    :   |\            /\
              .  |   :|\__     |    |   | \          /  \
 .            |\ |   |! \ \    |    |   | |\        /   /
 \"-.______   | \:   ||\ \ \   |    |   | | \      /   /
  \_       "-_|  |\  || \ \/   |    |___| ! |\____/  _/-. /\
    "-_   ____:  |_\ ||  \/  ___\  __  _//  | |  ___ \---" /
       \  \   |  _____,  /___\___\/ / /   \_! |  // _/  / /
     ___\_ \__|  |    | __. _/____ / /     /  > // /    \/
   //_________|  /    |/  |/  \__// /     /  /_/ \/
              | /     |   :      | /     /__/
              |/                 |/   
ASCII
  printf "%bE V A N G E L I O N%b\n" "$lime" "$rst"
}

printf "\n\n"
print_banner
printf "\n"
pause_line "${b}${c_cyan}[BOOT]${rst} ${c_white}core.system${rst} ${dim}v3.33${rst} - ${b}${c_blue}INITIALIZING${rst}" 0.45
pause_line "${c_green}[INFO]${rst} ${c_white}environment state:${rst} ${b}${c_mag}GEOFRONT${rst}" 0.35
pause_line "${c_green}[INFO]${rst} ${c_white}manual override:${rst} ${b}${c_yellow}ENABLED${rst}" 0.35

spinner_check "power conduit" ".........." "OK" "${c_green}" 16
spinner_check "containment seals" "......" "STABLE" "${c_green}" 14
spinner_check "synchronization ratio" ".." "87.2%" "${c_mag}" 18

pause_line "${c_yellow}[WARN]${rst} ${c_white}organic feedback detected${rst}" 0.30
pause_line "${c_yellow}[WARN]${rst} ${c_white}secondary coloration engaged${rst}" 0.30
pause_line "${c_blue}[NOTE]${rst} ${c_white}LCL channel active${rst}" 0.30

pause_line "${c_mag}[STATUS]${rst} ${c_white}unit designation:${rst} ${b}${c_white}01${rst}" 0.28
pause_line "${c_mag}[STATUS]${rst} ${c_white}user interface:${rst} ${b}${c_green}CONNECTED${rst}" 0.28
pause_line "${b}${c_red}[ALERT]${rst} ${c_white}abnormal resonance detected${rst}" 0.30
pause_line "${b}${c_red}[ALERT]${rst} ${c_white}safety limits exceeded${rst} ${dim}(within tolerance)${rst}" 0.35

pause_line "${c_green}[INFO]${rst} ${c_white}switching to manual control${rst}" 0.28
pause_line "${c_green}[INFO]${rst} ${c_white}operator authorization accepted${rst}" 0.28
pause_line "${b}${c_green}[READY]${rst} ${c_white}system standing by${rst}" 0.25
pause_line "${b}${c_green}[READY]${rst} ${c_white}awaiting activation command${rst}" 0.25

printf "\n"
