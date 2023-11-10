function fish_user_key_bindings
  fish_vi_key_bindings

  if test "$__fish_active_key_bindings" = "fish_vi_key_bindings"
    bind -M insert -m default jk backward-char force-repaint
    bind -m default L end-of-line
    bind -m default H beginning-of-line
  end

  bind -M insert \ek up-or-search
  bind -M insert \ej down-or-search
  bind -M insert \eh backward-char
  bind -M insert \el forward-char
end
