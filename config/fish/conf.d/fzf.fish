set -Ux FZF_MOVEMENT "\
--bind ctrl-i:up \
--bind ctrl-u:down \
--bind ctrl-p:toggle \
--bind ctrl-y:preview-up \
--bind ctrl-e:preview-down \
"

set -Ux FZF_WINOPTS "\
--border \
--margin 1 \
--padding 1 \
--reverse \
--cycle \
--ansi \
"

set -Ux FZF_PROMPT "\
--prompt '→ ' \
--pointer '→' \
--marker '→' \
--header '' \
--separator '' \
"

set -Ux FZF_COLORS "\
--color 'bg+:-1,\
fg:gray,\
fg+:white,\
border:black,\
spinner:0,\
hl:yellow,\
header:blue,\
info:green,\
pointer:red,\
marker:blue,\
prompt:gray,\
hl+:red' \
"

set -Ux FZF_PREVIEW "\
"

set -Ux FZF_DEFAULT_OPTS "$FZF_MOVEMENT $FZF_WINOPTS $FZF_PREVIEW $FZF_PROMPT $FZF_COLORS"

set -Ux FZF_TMUX_OPTS '-p'

alias ff="fzf-tmux -p --info hidden"
alias fh="fzf-tmux -p"
