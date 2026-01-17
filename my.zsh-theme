# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html

PROMPT='%F{cyan}%B%~%f%b %F{magenta}%(!.#.>)%f'
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7f7f7f"
