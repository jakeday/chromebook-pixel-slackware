#!/bin/sh

IFS=${IFS}/
set $@

case "$1" in
  button)
    case "$2" in
      power)
        /usr/sbin/pm-suspend
        ;;
      lid) grep -q open /proc/acpi/button/lid/LID0/state || /usr/sbin/pm-suspend
        ;;
      *)
        logger "ACPI action $2 is not defined"
        ;;
    esac
    ;;
  *)
    logger "ACPI group $1 / action $2 is not defined"
    ;;
esac
