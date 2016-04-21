# Editor
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export KEYTIMEOUT=1

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


if [[ -s "$HOME/.rbenv" ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
