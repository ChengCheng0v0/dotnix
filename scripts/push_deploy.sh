#!/usr/bin/env bash

source "$(dirname "$0")/set_colors.sh"

if [ -z "$1" ]; then
  echo "${bold}${red}Error:${reset} ${red}Flake path is not specified.${reset}"
  echo -e "\n${bold}${cyan}Example Usage:${reset}\n    ./push_deploy.sh /etc/nixos\n  ${bold}${cyan}Or use Just:${reset}\n    just deploy /etc/nixos"
  echo -e "\n${blue}zako zako, remember not to forget the parameters next time!${reset}"
  exit 1
fi

hosts=(
  "Localhost %   % Self % localhost"
  "Cheng-NixOS-PC %   % Home | PC % root@192.168.2.2"
  "server-m710q %   % Home | PostgreSQL,pgAdmin,Navidrome % root@192.168.2.3"
  "vps-vmiss-79676 %   % CN.HK.BGP.V2.Basic | hic.top % root@vps-vmiss-79676"
)

function choose_operation() {
  choice=$(echo -e "switch\ntest\nboot\nbuild" | fzf --reverse --height=~10 --prompt="Choose an operation: " --ansi)
  if [ -z "$choice" ]; then
    echo "${bold}${red}Error:${reset} ${red}Please select an action to perform after the build.${reset}"
    exit 1
  else
    echo "$choice"
  fi
}

function deploy() {
  echo "${blue}Deploying (${cyan}${3}${reset}${blue}) ${cyan}${1}${reset} ${blue}to ${cyan}${2}${reset}${blue} ...${reset}"
  if [ "$2" == "localhost" ]; then
    deploy_command="sudo nixos-rebuild ${3} --flake $1 --impure"
  else
    deploy_command="sudo nixos-rebuild ${3} --flake $1 --impure --target-host ${2}"
    echo "${blue}If the SSH login prompt appears later, complete it manually.${reset}"
  fi
  echo "${bold}${magenta}->${reset} ${magenta}${deploy_command}${reset}"
  $deploy_command
  if [ $? -eq 0 ]; then
    echo "${bold}${green}Done!${reset}"
  else
    echo "${bold}${red}There are errors :(${reset}"
  fi
}

function choose_host() {
  reserve_operations=(
    $'\u200B'"${dim}╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌${reset}"
    $'\u200B'"${blue}  (All)${reset}"
    $'\u200B'"${red}  (Quit)${reset}"
  )

  options=()
  for i in ${!hosts[@]}; do
    meta=${hosts[$i]}
    name=$(echo $meta | choose -f ' % ' 0)
    icon=$(echo $meta | choose -f ' % ' 1)
    note=$(echo $meta | choose -f ' % ' 2)

    if [ "$name" == "Localhost" ]; then
      options+=("${cyan}${icon}  ${name} (${note})${reset}")
    else
      options+=("${icon}  ${name} (${note})")
    fi
  done

  choice=$(echo -e "$(
    printf "%s\n" "${options[@]}"
    printf "%s\n" "${reserve_operations[@]}"
  )" | fzf --reverse --height=~10 --prompt="Deploy to: " --ansi)
  echo "${bold}${blue}[${reset} ${blue}${choice}${reset} ${bold}${blue}]${reset}"

  case "$choice" in
  *"(Quit)"*) exit 0 ;;
  $'\u200B'*)
    echo "${bold}${red}Error:${reset} ${red}\`${choice}\`${reset}${red} is not a valid host.${reset}"
    exit 1
    ;;
  *)
    if [ -z "$choice" ]; then
      exit 1
    fi
    for i in ${!hosts[@]}; do
      meta=${hosts[$i]}
      name=$(echo $meta | choose -f ' % ' 0)
      icon=$(echo $meta | choose -f ' % ' 1)
      note=$(echo $meta | choose -f ' % ' 2)
      host=$(echo $meta | choose -f ' % ' 3)
      if [ "$name" == $(echo "$choice" | choose 1) ]; then
        echo "${bold}${dim}Host metadata:${reset} ${dim}${meta}${reset}"

        operation=$(choose_operation)
        if [ $? -ne 0 ] || [ -z "$operation" ]; then
          echo "${bold}${red}Error:${reset} ${red}Please select an action to perform after the build.${reset}"
          exit 1
        fi

        deploy "$1" "$host" "$operation"
      fi
    done
    ;;
  esac
}

choose_host $@
