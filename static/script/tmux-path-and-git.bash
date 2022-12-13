if git_status=$(cd $1 && git status 2>/dev/null ); then
  git_branch="$(echo $git_status| awk 'NR==1 {print $3}')"
  case $git_status in
    *Your\ branch\ is\ ahead\ of\ *by\ *commit* ) state="#[bg=#7aa2f7,fg=#15161E] + #[default]" ;;
    *Changes\ to\ be\ committed* ) state="#[bg=orange,fg=#15161E] ~ #[default]" ;; 
    *Changes\ not\ staged* ) state="#[bg=red,fg=#15161E] … #[fg=default]" ;;
    * ) state="#[bg=green,fg=#15161E] _ #[default]" ;;
  esac
  if [[ $git_branch = "master" || $git_branch = "main" ]]; then
    git_info="#[underscore]#[fg=#15161E,bg=#7aa2f7]  ${git_branch} #[default]${state}"
  else
    git_info="#[underscore]#[fg=#7aa2f7,bg=#3b4261]  ${git_branch} #[default]${state}"
  fi
else
  git_info=""
fi

directory="#[underscore]#[fg=#7aa2f7,bg=#3b4261] $1 #[default]"

echo "$git_info$directory"

