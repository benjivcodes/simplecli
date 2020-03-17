#!/usr/bin/env bash

#exec 1> >(logger -s -t $(basename $0)-cli) 2>&1
#org_dir=$(pwd)
#cd "$(dirname "$bash_source")" || exit 1
#dir="${HOME}/.cli"
#cd "${org_dir}" || exit 1

bash_source="${BASH_SOURCE[0]}"
if [[ -h $bash_source ]]; then
  bash_source="$(readlink "$bash_source")"
fi

bold=$(tput bold)
normal=$(tput sgr0)
cli_lib="${CLIHOME}/lib"
command_dir="${CLIHOME}/lib/commands"
available_commands=()

source_commands() {
  for c in $(/bin/ls ${command_dir}); do
    available_commands+=("${c}")
  done

  for f in "${command_dir}"/*; do
    source "$f"
  done
}

handle_command() {
  source_commands

  if [[ $# -lt 1 ]]; then
    usage
  else
    command="$1"
    shift
    "${command}"_handle "$@"
  fi
}

usage() {
  echo -e "  usage: $(basename "$0") <command> <subcommand> [parameters]\n"
  echo -e "  To see help text, you can run:\n"
  echo -e "  cli help"
  echo -e "  cli <command> help"
  echo -e "  cli <subcommand> help"
}

help() {
  echo "  A simple command line based extensible toolchain for MacOS."
  echo ""
  usage
  echo ""
  echo -e "  AVAILABLE COMMANDS$\n"

  source_commands
  for command in "${available_commands[@]}"; do
    echo -e "  ${command}\t$(${command}_description)"
  done

  echo ""
}

command="$1"
case $command in
  help)
    help
  ;;
  *)
    handle_command "$@"
  ;;
esac
