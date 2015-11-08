# Path to your oh-my-zsh installation.
if [ "$TMUX" = "" ]; then tmux; fi
export ZSH=/Users/bparafina/.oh-my-zsh
alias vim=/usr/local/Cellar/macvim/HEAD/bin/vim
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="sonicradish"
ZSH_THEME="wedisagree-atsjj"
#ZSH_THEME="steeef"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autopep8 aws command-not-found dirhistory docker gem git-extras git-flow history node npm pip python repo ruby rvm ssh-agent sudo supervisor tmux vagrant virtualenvwrapper extract bower common-aliases jira jsontools last-working-dir screen sprunge sudo taskwarrior web-search wd autojump zsh-syntax-highlighting zsh-completions)
autoload -U compinit && compinit

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/cellar/nmap/"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"
qfc_quick_command 'cd' '\C-b' 'cd $0'
qfc_quick_command 'vim' '\C-p' 'vim $0'
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ===== General Purpose Exports =====
# Sets your JAVA_HOME to whatever JDK you have installed as current.
export JAVA_HOME="$(/usr/libexec/java_home)"

# ===== General Purpose Aliases =====
alias grep='grep --color=auto '
alias fgrep='fgrep --color=auto '
alias egrep='egrep --color=auto '
alias ll='ls -alhFG '
alias la='ls -AG '
alias edbp='emacs ~/.bash_profile; source ~/.bash_profile; echo ~/.bash_profile refreshed'
alias srcbp='source ~/.bash_profile; echo ~/.bash_profile refreshed'
alias vimbrc='vim ~/.bashrc; source ~/.bashrc; echo ~/.bashrc refreshed'
alias edbrc='source ~/.bashrc; echo ~/.bashrc refreshed'
alias tailf='tail -f -n500 '
alias findn='find 2>/dev/null '
alias cls="osascript -e 'if application \"Terminal\" is frontmost or application \"iTerm\" is frontmost then tell application \"System Events\" to keystroke \"k\" using command down'"
# ===== Path additions. =====
export PATH="$PATH:/opt/local/lib/mysql56/bin"

# Enables running Multiple Nodes in Local Development.
export HZ_TCP_ENABLED=true
alias hzcTcpOn='export HZ_TCP_ENABLED=true;sdprops'
alias hzcTcpOff='export HZ_TCP_ENABLED=false;sdprops'

export EVOLUTIONS_ENABLED=true
alias evolutionsOn='export EVOLUTIONS_ENABLED=true;sdprops'
alias evolutionsOff='export EVOLUTIONS_ENABLED=false;sdprops'

# Lets the user figure out at a command which database the platform will use.
alias whichdb='set | grep DB_DEFAULT_URL='

# These alliases allow the user to change the database to use with a single command. You can add or remove these to match your setup.
export DB_DEFAULT_URL=jdbc:mysql://localhost:3306/victiv_local
alias dbhotfix='export DB_DEFAULT_URL=jdbc:mysql://localhost:3306/victiv_hotfix ;sdprops'
alias dbvictiv='export DB_DEFAULT_URL=jdbc:mysql://localhost:3306/victiv_local ;sdprops'
alias dblivecopy='export DB_DEFAULT_URL=jdbc:mysql://localhost:3306/victiv_live_copy ;sdprops'

# Common Play Node options
export VICTIV_OPTS="-J-Xms2048M -J-Xmx8048m -J-XX:+UnlockCommercialFeatures -J-XX:+FlightRecorder -Dcom.sun.management.jmxremote -Dhazelcast.jmx=true -Dcom.sun.management.jmxremote.authenticate=false"

# These aliases allow the invocation of the system in two different nodes and set up the run to be enabled for JMC and Hazelcast JMX.
alias playNode1='activator/activator -Dhttps.port=9443 -Dhttp.port=9000 -jvm-debug 9997 $VICTIV_OPTS'
alias playNode2='activator/activator -Dhttps.port=9444 -Dhttp.port=9001 -jvm-debug 9998 $VICTIV_OPTS'
alias playNode3='activator/activator -Dhttps.port=9445 -Dhttp.port=9002 -jvm-debug 9999 $VICTIV_OPTS'

# Show all StarsDraft properties
alias sdprops='set | grep -e HZ_TCP_ENABLED= -e EVOLUTIONS_ENABLED= -e VICTIV_OPTS= -e DB_DEFAULT_URL='

# ===== Tells Apple's Launch Control to use your path =====
export PATH="/opt/local/bin:/opt/local/sbin:$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:/opt/bin"
launchctl setenv PATH $PATH

setopt NOCLOBBER
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

zstyle -e ':completion::*:hosts' hosts 'reply=($(sed -e "/^#/d" -e "s/ .*\$//" -e "s/,/ /g" /etc/ssh_known_hosts(N) ~/.ssh/known_hosts(N) 2>/dev/null | xargs) $(grep \^Host ~/.ssh/config(N) | cut -f2 -d\  2>/dev/null | xargs))'
autoload -U colors && colors
wd() {
  . /Users/bparafina/bin/wd/wd.sh
}

## Autojump
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh

## autosuggestions
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#add zsh-autosuggestions.
source ~/.zsh/zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically.
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

bindkey "^I" expand-or-complete


# pro cd function
pd() {
  local projDir=$(pro search $1)
  cd ${projDir}
}
