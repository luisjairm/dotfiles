# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Plugins zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-plugins/sudo.plugin.zsh
#source /usr/share/zsh-plugins/copypath.plugin.zsh

alias v='code'
alias ls ="lsd"
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'

alias icat='kitty +kitten icat'

# Created by newuser for 5.8.1
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Android - React Native
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function mkt() {
    base_path="src"
    folders=(
        "Data/repositories"
        "Data/source/local/asyncStorage"
        "Data/source/local/sqlite"
        "Data/source/remote/api"
        "Data/source/remote/models"
        "Domain/entities"
        "Domain/repositories"
        "Domain/useCases"
        "Presentation/components"
        "Presentation/context"
        "Presentation/hooks"
        "Presentation/navigations"
        "Presentation/screens"
        "Presentation/theme"
        "Presentation/utils"
    )

    for folder in "${folders[@]}"; do
        mkdir -p "$base_path/$folder"
    done

    echo "Carpetas creadas correctamente."
}

function clean(){
 rm ~/.zsh_history
}
# History
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
