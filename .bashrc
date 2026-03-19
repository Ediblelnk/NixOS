PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[91;1m\]󰉋 \W\[\e[0m\]  \[\e[92m\] $? \[\e[93m\]󱞡 ${SHLVL}\[\e[0m\] \[\e[2;3m\] \[\e[94m\]󰘬 ${PS1_CMD1}\n\[\e[0m\] '

alias icat="kitty +kitten icat"

# only fetch for base shell
if [ $SHLVL -eq 1 ]; then
  fastfetch
  echo
fi
