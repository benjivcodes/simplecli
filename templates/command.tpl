#!/usr/bin/env bash
# Simple CLI command template.

function command_description(){
    echo "Example command, see command file for details"
}

function command_help(){
  echo ""
  echo -e "  usage: $(basename "$0") command <subcommand>\n"
  echo -e "  ${bold}AVAILABLE SUBCOMMANDS:${normal}\n"
  echo -e "  example           Example command summary"
  echo ""
}

function command_handle(){
  command="$1"

  case $command in
  *)
    command_help
  ;;

  esac
}
