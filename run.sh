#!/bin/bash
function logError() {
    echo "[error] ${1}"
}


function logInfo() {
    echo "[info] ${1}"
}


function logWarning() {
    echo "[warning] ${1}"
}


function optionalVariable() {
    if [ -z "${!1}" ]
    then
        logWarning "\${${1}} is not set; using default value '${2}'"
        eval ${1}=${2}
    fi
}

function requiredVariable() {
    if [ -z "${!1}" ]
    then
        logError "\${${1}} is not set"
        exit 1
    fi
}

function checkEnv() {
    requiredVariable TELEGRAM_BOT_KEY
}


function runBot() {
    logInfo "Try to start WEATHERBot"
    logInfo "/usr/bin/ngsweatherbot -k ${TELEGRAM_BOT_KEY}"
    /usr/bin/ngsweatherbot -k ${TELEGRAM_BOT_KEY}
}


checkEnv

case "$1" in
run)
    runBot
    ;;
esac