st(){
  dir_color=$'\033[31;1m'
  color_end=$'\033[0m'
  cd ~/_releases

  for dir in */; do
    if [[ $dir == app-* ]]; then
      cd $dir
      BRANCH=$(svn info | grep 'URL')
      if [[ $(svn st) ]]; then
        CHANGES=$(svn st)
        CHANGEDATE=$(svn info | grep 'Last Changed Date')
      else
        CHANGES='none'
        CHANGEDATE='n/a'
      fi
      printf "%s%s%s\n Branch %s\n Changes: %s\n %s\n" "$dir_color" "$dir" "$color_end" "$BRANCH" "$CHANGES" "$CHANGEDATE"
      cd ../
    fi;
  done;
}
