# Configuring Our Prompt
# ======================
  # if you install git via homebrew, or install the bash autocompletion via homebrew, you get __git_ps1 which you can use in the PS1
  # to display the git branch.  it's supposedly a bit faster and cleaner than manually parsing through sed. i dont' know if you care
  # enough to change it

  # This function is called in your prompt to output your active git branch.
  function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }

  # This function builds your prompt. It is called below
  function prompt {
    # Define some local colors
    local         RED="\[\033[0;31m\]" # This syntax is some weird bash color thing I never
    local   LIGHT_RED="\[\033[1;31m\]" # really understood
    local        CHAR="♥"
    local   BLUE="\[\e[0;49;34m\]"

    # ♥ ☆ - Keeping some cool ASCII Characters for reference

    # Here is where we actually export the PS1 Variable which stores the text for your prompt
    export PS1="\[\e]2;\u@\h\a[\[\e[37;44;1m\]\t\[\e[0m\]]$RED\$(parse_git_branch) \[\e[32m\]\W\[\e[0m\]\n\[\e[0;31m\]$BLUE// 👾  \[\e[0m\]"
      PS2='> '
      PS4='+ '
    }

  # Finally call the function and our prompt is all pretty
  prompt

  # For more prompt coolness, check out Halloween Bash:
  # http://xta.github.io/HalloweenBash/

  # If you break your prompt, just delete the last thing you did.
  # And that's why it's good to keep your dotfiles in git too.

# Environment Variables
# =====================
  # Library Paths
  # These variables tell your shell where they can find certain
  # required libraries so other programs can reliably call the variable name
  # instead of a hardcoded path.

    # NODE_PATH
    # Node Path from Homebrew I believe
    export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

    # Those NODE & Python Paths won't break anything even if you
    # don't have NODE or Python installed. Eventually you will and
    # then you don't have to update your bash_profile

  # Configurations

    # GIT_MERGE_AUTO_EDIT
    # This variable configures git to not require a message when you merge.
    export GIT_MERGE_AUTOEDIT='no'

    # Editors
    # Tells your shell that when a program requires various editors, use sublime.
    # The -w flag tells your shell to wait until sublime exits
    export VISUAL="vim"
    export SVN_EDITOR="vim"
    export GIT_EDITOR="vim"
    export EDITOR="vim"

    # Version
    # What version of the Flatiron School bash profile this is
    export FLATIRON_VERSION='1.1'
  # Paths

    # The USR_PATHS variable will just store all relevant /usr paths for easier usage
    # Each path is seperate via a : and we always use absolute paths.

    # A bit about the /usr directory
    # The /usr directory is a convention from linux that creates a common place to put
    # files and executables that the entire system needs access too. It tries to be user
    # independent, so whichever user is logged in should have permissions to the /usr directory.
    # We call that /usr/local. Within /usr/local, there is a bin directory for actually
    # storing the binaries (programs) that our system would want.
    # Also, Homebrew adopts this convetion so things installed via Homebrew
    # get symlinked into /usr/local
    export PATH="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/local/opt/sqlite/bin:$PATH"
    export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin"
    # Hint: You can interpolate a variable into a string by using the $VARIABLE notation as below.

    # We build our final PATH by combining the variables defined above
    # along with any previous values in the PATH variable.

    # Our PATH variable is special and very important. Whenever we type a command into our shell,
    # it will try to find that command within a directory that is defined in our PATH.
    # Read http://blog.seldomatt.com/blog/2012/10/08/bash-and-the-one-true-path/ for more on that.

    # If you go into your shell and type: echo $PATH you will see the output of your current path.
    # For example, mine is:
    # /Users/avi/.rvm/gems/ruby-1.9.3-p392/bin:/Users/avi/.rvm/gems/ruby-1.9.3-p392@global/bin:/Users/avi/.rvm/rubies/ruby-1.9.3-p392/bin:/Users/avi/.rvm/bin:/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/local/mysql/bin:/usr/local/share/python:/bin:/usr/sbin:/sbin:

    # Android-Development
    export ANDROID_HOME="/Users/sjoli/Library/Android/sdk"
    export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

# Helpful Functions
# =====================

# A function to CD into the desktop from anywhere
# so you just type desktop.
# HINT: It uses the built in USER variable to know your OS X username

# USE: desktop
#      desktop subfolder
function desktop {
  cd /Users/$USER/Desktop/$@
}

function dev {
  cd /Users/$USER/Development/$@
}

function wrk {
  cd /Users/$USER/Development/workspace$@
}

function reg {
  cd /Users/$USER/Development/workspace/Registry$@
}

function personal {
  cd /Users/$USER/Development/personal$@
}

function dotfiles {
  cd ~/dotfiles
}

function api {
  cd /Users/$USER/Development/workspace/the-bash-api$@
}

function plugin {
  cd /Users/$USER/Development/workspace/hapi-bash-api$@
}

function web {
  cd /Users/$USER/Development/workspace/the-bash-web$@
}

function admin {
  cd /Users/$USER/Development/workspace/the-bash-admin$@
}

function hub {
  cd /Users/$USER/Development/workspace/the-bash-data-hub$@
}

function oss {
  cd /Users/$USER/Development/opensource$@
}

function xo {
  cd /Users/$USER/Development/xo
}

function mp {
  cd /Users/$USER/Development/xo/Planning/Marketplace/$@
}

function inbox {
  cd /Users/$USER/Development/Planning/inbox$@
}

function lp {
  cd /Users/$USER/Development/LocalPartners/$@
}

function tkp {
  cd /Users/$USER/Development/Experimentation/TheKnotPro-ios/TheKnotProMessenger/$@
}

function cafe {
  cd /Users/sjoli/Development/Experimentation/Cafe-195/Cafe195/$@
}

function plugins {
  cd /Users/sjoli/Development/xo/Local/Plugins/$@
}

function helpers {
  cd /Users/sjoli/Development/xo/Local/Helpers/$@
}

function services {
  cd /Users/sjoli/Development/xo/Local/Services/$@
}

function xo-helpers {
  cd /Users/sjoli/Development/Local/Marketplace_API/Helpers/$@
}
# A function to easily grep for a matching process
# USE: psg postgres
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}

# A function to extract correctly any archive based on extension
# USE: extract imazip.zip
#      extract imatar.tar
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      rar x $1        ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function docker-clean {
    echo "Removing docker images"
    docker ps -aq | xargs docker rm -f
    docker images -f "dangling=true" -q | xargs docker rmi
}

# Aliases
# =====================
  # LS
  alias l='ls -lah'
  alias oa="open -a"
  alias osa="osascript -e"

  # Docker
  alias awsauth='docker run --rm -ti -e AWS_ACCOUNT=$AWS_ACCOUNT -e'

  # Git
  alias gcl="git clone"
  alias gst="git status"
  alias gl="git pull"
  alias gp="git push"
  alias gd="git diff | mate"
  alias gc="git commit -v"
  alias gca="git commit -v -a"
  alias gb="git branch"
  alias gba="git branch -a"
  alias gcam="git commit -am"
  alias gbb="git branch -b"
  alias gcm="git commit -m"
  alias gco="git checkout"
  alias gclean="git branch --merged master | grep -v '^\*\|  master' | xargs -n 1 git branch -d"

  # SQL
  alias sql="sqlite3"

  # Apps
  alias of="open -a omnifocus"
  alias en="open -a Evernote"
  alias chrome="open -a 'Google Chrome'"
  alias itunes="open -a Itunes"
  alias day1="open -a 'Day One'"
  alias spotify="open -a Spotify"
  alias notes="open -a Notes"
  alias slack="open -a Slack"
  alias imess="open -a messages"
  alias slack="open -a slack"
  alias join="open -a join.me"
  alias safari="open -a safari"

  # Browser
  alias email="open 'https://mail.google.com/mail/u/0/#inbox'"
  alias gcal="open 'https://calendar.google.com'"
  alias gdrive="open 'https://www.drive.google.com'"

  # Hapi
  alias hapi="makemehapi"

  # Npm
  alias npm_all="npm list -g --depth 0"

  # Marketplace app
  alias rs="rails s -p3333 webrick"
  alias ber="bundle exec rspec"

  # Tmux
  # alias tmux="TERM=screen-256color-bce tmux"

  # Tree
  alias t="tree"

# Case-Insensitive Auto Completion
  bind "set completion-ignore-case on"

# Postgres
# export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

# Final Configurations and Plugins
# =====================
  # Git Bash Completion
  # Will activate bash git completion if installed
  # via homebrew
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi

  source $HOME/.bashrc
  # source the colors needed for gruvbox
  source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh"

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
