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

jack/headphone)
  case "$3" in
    plug)
    logger "headphone plugged"
      alsaucm -c bdw-rt5677 set _verb HiFi set _enadev Headphone
      ;;
    unplug)
      logger "headphone unplugged"
      alsaucm -c bdw-rt5677 set _verb HiFi set _disdev Headphone
      ;;
    *)
      logger "ACPI action undefined: $3"
      ;;
  esac
  ;;
