PYTHONPATH=/usr/lib/python2.7
export TERM=xterm-256color
export EDITOR=vim
export SVN_EDITOR=vim
export SVNRD=/home/blake/repos
export SVN_DIFF_EDITOR=vimdiff
function setdsm() {
  export PYTHONPATH=$PYTHONPATH:$PWD/..
  export PYTHONPATH=$PYTHONPATH:$PWD
  if [ -z "$1" ]; then
    x=${PWD/\/[^\/]*\/}
    export DJANGO_SETTINGS_MODULE=$x.settings
  else
    export DJANGO_SETTINGS_MODULE=$1
  fi

  echo "DJANGO_SETTINGS_MODULE set to $DJANGO_SETTINGS_MODULE"
}
