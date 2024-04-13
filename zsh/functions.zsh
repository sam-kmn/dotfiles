notify () {
  osascript -e 'display notification \"Connected to hotspot $1\" with title \"$2\"'
}

zldir () {
  z $1 && exa --tree --icons --level="1" --sort="type"
}

git_branch() {
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo $branch
  fi
}

archive_branch() {
  local branch_name="$1"

  if [[ -z "$branch_name" ]]; then
    echo "Please provide a branch name as an argument."
    return 1
  fi

  git tag "archive/$branch_name" "$branch_name"
  if [ $? -eq 0 ]; then
    git branch -d "$branch_name"
  else
    echo "Error creating the tag. Check if the branch name exists."
  fi
}

restore_branch() {
  local branch_name="$1"

  if [[ -z "$branch_name" ]]; then
    echo "Please provide a branch name as an argument."
    return 1
  fi

  git checkout -b "$branch_name" "archive/$branch_name"
}

getip() {
  wired=$(ipconfig getifaddr en1)
  wireless=$(ipconfig getifaddr en0)
  [[ ! -z "$wired" ]] && echo "local: $wired"
  [[ ! -z "$wireless" ]] && echo "local: $wireless"
  echo "public: $(curl -s ifconfig.me)"
}

git_commit() {
  # local message=${1:-"✨ new feature"}
  git commit -m $1
  echo -e "\n\e[33m Remember to lint and format your code before pushing\e[0m\n"
}

clear_downloads() {
  detected_files=$(find ~/Downloads -type f -mtime +30 -exec echo \; | wc -l)

  if [ $detected_files -gt 0 ]; then
    find ~/Downloads -type f -mtime +30 -exec trash {} \; |
    echo "\n ♻️  $detected_files files deleted"
  fi
}

inbg() { "$@" &>/dev/null & }

push() {
  branch=$(git branch --show-current)
  git push origin $branch
}

pull() {
  branch=$(git branch --show-current)
  git pull origin $branch
}

confirm() {
    echo -n "Continue? y or n? "
    read REPLY
    case $REPLY in
    [Yy]) echo 'yup y' ;; # you can change what you do here for instance
    [Nn]) echo 'nope n' ;;
    # Here are a few optional options to choose between
    # Any other answer:

    # 1. Repeat the question
    *) confirm ;;

    # 2. ignore
    # *) ;;

    # 3. Exit terminal
    # *) exit ;;

    esac
    # REPLY=''
}

ssh-select() {

    echo -n "\nSelect SSH Key:\n samkmn \n dornach"
    read REPLY

    case $REPLY in
    [Yy]) echo 'yup y'
      # git config user.email "superman@example.com"
      # git config user.name  "Super Man"
    ;; # you can change what you do here for instance
    [Nn]) echo 'nope n' ;;
    # Here are a few optional options to choose between
    # Any other answer:

    # 1. Repeat the question
    *) confirm ;;

    # 2. ignore
    # *) ;;

    # 3. Exit terminal
    # *) exit ;;

    esac
    # REPLY=''
}
