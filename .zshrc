export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod go-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
fi

zi load zsh-users/zsh-autosuggestions
zi load zsh-users/zsh-syntax-highlighting
zi load zsh-users/zsh-completions
zi load agkozak/zsh-z

alias mro_kubectl_dev='az aks get-credentials --admin --name aks-mro-qas-eastus2 --resource-group rg-mro-qas-eastus2'
alias mro_kubectl_prod='az aks get-credentials --admin --name aks-mro-producao-eastus2 --resource-group rg-mro-producao-eastus2'
alias search_dir='cd "$(find * -type d | fzf)"'
alias update_vscode='~/Scripts/update_vscode.sh'
alias update_discord='~/Scripts/update_discord.sh'

export NODE_OPTIONS="--dns-result-order=ipv4first"

eval "$(starship init zsh)"

export PATH=$PATH:$HOME/Android/Sdk/platform-tools
export PATH=$PATH:$HOME/Android/Sdk/emulator
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/Scripts

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

source <(kubectl completion zsh)

# pnpm
export PNPM_HOME="/home/rodrigosilva/.local/share/pnpm"

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(zoxide init zsh)"

export INFERENCE_MODEL="meta-llama/Llama-3.3-70B-Instruct"
# ollama names this model differently, and we must use the ollama name when loading the model
export OLLAMA_INFERENCE_MODEL="llama3.2:3b-instruct-fp16"
export LLAMA_STACK_PORT=5001
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# bun completions
[ -s "/home/rodrigosilva/.bun/_bun" ] && source "/home/rodrigosilva/.bun/_bun"



# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"


export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=$M2_HOME/bin:$PATH


