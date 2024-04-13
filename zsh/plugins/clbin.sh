#!/usr/bin/env bash
# Upload text/images to clbin.com from the command line
# License: ISC http://www.isc.org/downloads/software-support-policy/isc-license/

clip() {
    if command -v xclip &> /dev/null; then
        xclip -selection clip <<< "$@"
    elif command -v xsel &> /dev/null; then
        xsel -b -i <<< "$@"
    fi
}

if [[ $# != 0 ]]; then
    if [[ $@ == "-h" || $@ == "--help" ]]; then
        echo "Usage:"
        echo "  clbin <file>"
        echo "  <command> | clbin"
        echo "  'clbin' alone reads STDIN till ^D is pressed"
        echo "Supported files: text files and png/jpg/jpeg/gif images"
        exit 1;
    fi
    [[ ! -e $@ ]] && echo "File not found." && exit 2;
    mime="$(file --mime-type "$@")"
    mime="${mime##* }"
    case "$mime" in
        image/png|image/jpg|image/jpeg|image/gif)
            resp="$(curl -sfF "clbin=@$@" https://clbin.com)"
            ;;
        text/*)
            resp="$(cat "$@" | curl -sfF "clbin=<-" https://clbin.com)"
            ;;
        *)
            echo "Unsupported file type: $mime"
            exit 3;;
    esac
    if [[ "$?" != 0 ]]; then
        echo "An error has occured. curl exit code: $?"
        exit 4
    fi
else
    resp="$(cat "$@" | curl -sfF "clbin=<-" https://clbin.com)"
fi

echo "$resp"
clip "$resp"
