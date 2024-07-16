#!/bin/bash

start_ssh_agent() {
    if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        eval "$(ssh-agent -s)"
    fi
}

add_ssh_keys() {
    # PERSONAL
    if [[ -f ~/.ssh/id_rsa_personal ]]; then
        ssh-add ~/.ssh/id_rsa_personal
    else
        echo "Erro: O arquivo ~/.ssh/id_rsa_personal não existe."
    fi

    # WORK
    if [[ -f ~/.ssh/id_rsa_work ]]; then
        ssh-add ~/.ssh/id_rsa_work
    else
        echo "Erro: O arquivo ~/.ssh/id_rsa_work não existe."
    fi
}

start_ssh_agent
add_ssh_keys
