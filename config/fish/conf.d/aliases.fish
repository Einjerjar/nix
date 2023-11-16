alias qq='exit'
alias hs='home-manager switch'

alias pb='pocketbase'

alias d='docker'
alias de='docker exec'
alias dc='docker compose'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dce='docker compose exec'
alias dcl='docker compose logs -f'
alias dcr='docker compose restart'
alias dps='/usr/bin/env grc docker ps --format=\'table {{.Names}}\t{{.Status}}\t[{{.Networks}}]\t{{.ID}}\t{{if .Ports}}{{with $p := split .Ports ", "}}{{range $i, $v := $p}}{{if $i}}\t\t\t\t{{end}}{{println $v}}{{end}}{{end}}{{else}}{{println "No Ports"}}{{end}}\''

alias cat='bat'
alias ls='lsd -l'
alias ll='lsd -l'
alias la='lsd -la'

alias lso='/usr/bin/ls'
alias cato='/usr/bin/cat'

alias gbn='basename (git rev-parse --show-toplevel)'

alias v='nvim'

alias e.='/mnt/c/Windows/explorer.exe .'
alias ssh='TERM=xterm-256color /usr/bin/env ssh'
