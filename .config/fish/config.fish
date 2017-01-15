### Aliases

# Open specified files in Sublime Text
# "s ." will open the current directory in Sublime
alias s='open -a "Sublime Text"'

# Open specified files in Atom
# "a ." will open the current directory in Sublime
alias a='atom .'

# Color LS
set colorflag "-G"
alias ls="command ls $colorflag"
alias l="ls -lF $colorflag" # all files, in long format
alias la="ls -laF $colorflag" # all files inc dotfiles, in long format
alias lsd='ls -lF $colorflag | grep "^d"' # only directories

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Colored up cat!
# You must install Pygments first - "sudo easy_install Pygments"
alias c='pygmentize -O style=monokai -f console256 -g'

# Environment variables
set -g -x MAMP_LIBRARY /Applications/MAMP/Library/bin
set -g -x MAMP_PHP /Applications/MAMP/bin/php/php7.0.0/bin
set -g -x PATH $MAMP_LIBRARY $MAMP_PHP $PATH
set -g -x PATH /usr/local/git/bin $PATH
set -g -x PATH /opt/local/bin /opt/local/sbin $PATH
set -g -x PATH $HOME/npm/bin $PATH
set -g -x PATH $HOME/.composer/vendor/bin $PATH
set -g -x PATH $HOME/bin $PATH
set -g -x JAVA_HOME /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home

# Fish Config
set -g fish_prompt_pwd_dir_length 0
set -g -x fish_greeting ''

# Git branch details
function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo $branch'*'
  else
    echo $branch
  end
end

# Prompt
function fish_prompt
  set -l git_dir (git rev-parse --git-dir 2> /dev/null)
  
  if test -n "$git_dir"
    echo -ne (set_color red)(whoami) (set_color reset)'in' (set_color blue)(prompt_pwd) (set_color reset)'on' (set_color yellow)(parse_git_branch) (set_color reset)'\n⚡  '
  else
    echo -ne (set_color red)(whoami) (set_color reset)'in' (set_color blue)(prompt_pwd) (set_color reset)'\n⚡  '
  end
end