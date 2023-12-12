# add this to 'source $pwd/.aliases' to '~/.zshrc'
# get a param to check if there is an available session or not and create a new one if needed
function tmas
{
  if [ -z $1 ]; then
    local res=$(tmux ls |fzf --reverse --prompt='tmux attach session: '|cut -d: -f1 | xargs echo)
    if [ -z $res ]; then echo "No session"; return; else tmux attach-session -t $res; fi
  else
    local res=$(tmux list-session| grep $1)
    if [ -z $res ]; then
      tmux new -s $1;
    else
      local res=$(tmux list-session|grep $1 |fzf --reverse --prompt='tmux attach session: '|cut -d: -f1 | xargs echo)
      if [ -z $res ]; then return; else tmux attach-session -t $res; fi
    fi
  fi
  return ;
}

alias open=xdg-open

