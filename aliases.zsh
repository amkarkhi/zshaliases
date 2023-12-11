# get a param to check if there is an available session or not and create a new one if needed
function tmas
{
  if [ -z $1 ]; then
    local res=$(tmux list-session |fzf --reverse --prompt='tmux attach session: '|cut -d: -f1 | xargs echo)
    if [ -z $res ]; then return; else tmux attach-session -t $res; fi
  else
    local fff=$(tmux list-session| grep $1)
    if [ -z $fff ]; then
      tmux new -s $1;
    else
      local res=$(tmux list-session|grep $1 |fzf --reverse --prompt='tmux attach session: '|cut -d: -f1 | xargs echo)
      if [ -z $res ]; then return; else tmux attach-session -t $res; fi
    fi
  fi

}
