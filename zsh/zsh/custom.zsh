# Editor
# export TERM=xterm-termite
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export KEYTIMEOUT=1
export LYEDITOR='nvr  --remote %(file)s --remote-send "%(line)sG%(column)s|"'
# export LYEDITOR='nvr --remote'
# export LYEDITOR='nvr --remote %(file) -c %(line)'

# Correct commands.
setopt CORRECT

# color for ls
if is-callable 'dircolors'; then
  if [[ -s "$HOME/.dircolors" ]]; then
    eval "$(dircolors "$HOME/.dircolors")"
  else
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
  fi
fi

export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f'

if [[ -s "$HOME/.rbenv" ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [[ -s "$HOME/.lyp" ]]; then
  export PATH="$HOME/.lyp/bin:$PATH"
fi

if [[ -s "$HOME/.cabal/bin" ]]; then
  export PATH="$PATH:~/.cabal/bin:.cabal-sandbox/bin"
fi

if [[ -s "$HOME/.local/bin" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

export DOCKER_HOST_IP=172.17.0.1

export EVENT_NOEPOLL=1

if [[ -s "$HOME/Android/Sdk" ]]; then
  export ANDROID_HOME=~/Android/Sdk
  export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"
fi

if type yarn > /dev/null; then
  export PATH="$(yarn global bin):$PATH"
fi

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv virtualenv-init -)"

autojump="/etc/profile.d/autojump.sh";

if [[ -s $autojump ]]; then
  source $autojump
fi

if [ -x $(which fasd) ]; then
  eval "$(fasd --init auto)"
fi

# ASDF runtime versions manager
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash
