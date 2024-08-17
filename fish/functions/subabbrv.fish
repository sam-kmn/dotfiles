function subabbr
  set -l cmd    "$argv[1]"
  set -l short  "$argv[2]"
  set -l long   "$argv[3]"

  # Check that these strings are safe, since we're going to eval. 👺
  if not string match --regex --quiet '^[a-z]*$' "$short"
    or not string match --regex --quiet '^[a-z- ]*$' "$long"
    echo "Scary unsupported alias or expansion $short $long"; exit 1;
  end

  set -l abbr_temp_fn_name (string join "_" "abbr" "$cmd" "$short")
  set -l abbr_temp_fn "
  function $abbr_temp_fn_name
    set --local tokens (commandline --tokenize)
    if test \$tokens[1] = \"$cmd\"
      echo $long
    else
      echo $short
    end;
  end;
  abbr --add $short --position anywhere --function $abbr_temp_fn_name"
  eval "$abbr_temp_fn"
end
