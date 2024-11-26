#!/bin/bash
function install_simple_logger {
    echo "Installing SimpleLogger..."
    # Creare il file di log
    touch $LOG_FILE_PATH
    echo "SimpleLogger installed and log file created at $LOG_FILE_PATH"
}

function start_simple_logger {
    echo "Starting SimpleLogger..."
    echo "$(date) • Devstack start" >> $LOG_FILE_PATH
}
function stop_simple_logger {
    echo "Stopping SimpleLogger..."
    echo "$(date) • Devstack stop" >> $LOG_FILE_PATH
}
# Hook the functions into Devstack lifecycle
if [[ "$1" == "stack" && "$2" == "install" ]]; then
    install_simple_logger
elif [[ "$1" == "stack" && "$2" == "post-config" ]]; then
    start_simple_logger
elif [[ "$1" == "unstack" ]]; then
    stop_simple_logger
fi
