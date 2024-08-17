function edit --description 'Open current path in default editor'
    if string-empty $argv
        $EDITOR $argv
    else
        $EDITOR $PWD
    end
end
