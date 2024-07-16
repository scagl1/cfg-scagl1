
# .bashrc

# Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then    
    echo "OS detectado: Linux."  

    # Source global definitions
    if [ -f /etc/bashrc ]; then
        . /etc/bashrc
    fi

    # User specific environment
    if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
        PATH="$HOME/.local/bin:$HOME/bin:$PATH"
    fi
    export PATH

    # Uncomment the following line if you don't like systemctl's auto-paging feature:
    # export SYSTEMD_PAGER=

    # User specific aliases and functions
    if [ -d ~/.bashrc.d ]; then
        for rc in ~/.bashrc.d/*; do
            if [ -f "$rc" ]; then
                . "$rc"
            fi
        done
    fi

    if [ -f "$HOME/init_ssh_agent.sh" ]; then
        if [ ! -x "$HOME/init_ssh_agent.sh" ]; then
            chmod +x "$HOME/init_ssh_agent.sh"
            if [ $? -ne 0 ]; then
                echo "Aviso: Não foi possível definir permissões de execução para $HOME/init_ssh_agent.sh"
            fi
        fi
    fi

    alias start-ssh='source ~/init_ssh_agent.sh'

    unset rc
    . "$HOME/.cargo/env"

# macOS
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "OS detectado: macOS."  
fi

alias config='/usr/bin/git --git-dir=/home/scagl1/.cfg/ --work-tree=/home/scagl1'
