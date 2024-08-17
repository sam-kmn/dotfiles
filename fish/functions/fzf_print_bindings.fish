function fzf_print_bindings --description 'Print default fzf bindings.'
  echo "
  Ctrl+Alt  |  (F for file)      |  --directory
  Ctrl+Alt  |  (L for log)       |  --git_log
  Ctrl+Alt  |  (S for status)    |  --git_status
  Ctrl      |  (R for reverse)   |  --history
  Ctrl+Alt  |  (P for process)   |  --processes
  Ctrl      |  (V for variable)  |  --variables
  "
end
