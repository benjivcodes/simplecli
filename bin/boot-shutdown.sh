#!/usr/bin/env bash

function shutdown()
{
  echo `date` " " `whoami` " Received a signal to shutdown"
  rm -f /Users/benjaminvanackeran/.ssh/ssh-agent.sock*
  exit 0
}

function startup()
{
  echo `date` " " `whoami` " Starting..."
  rm -f /Users/benjaminvanackeran/.ssh/ssh-agent.sock*
  tail -f /dev/null &
  wait $!
}

trap shutdown SIGTERM
trap shutdown SIGKILL

startup;

