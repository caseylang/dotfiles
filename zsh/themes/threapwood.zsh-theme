# mix of sorin and super jarin

PROMPT='%{$fg[grey]%}%~%{$reset_color%}$(git_prompt_info)$(git_remote_status)%{$reset_color%} %{$fg[white]%}#%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} ✱"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg[yellow]%}⬇"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg[blue]%}⬆"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg[red]%}⤮"
