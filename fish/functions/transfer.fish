function transfer --description 'Transfer a file.'
  set tmpfile (mktemp -t transferXXX )
  curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename $1) >> $tmpfile;
  cat $tmpfile;
  rm -f $tmpfile;
end
