function cpwd --description 'Copy path to clipboard'
  command pwd | tr -d '\n' | pbcopy; and echo '✅ PWD Copied to clipboard';
end
