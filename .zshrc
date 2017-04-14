# Path to your oh-my-zsh installation.
  export ZSH=/home/gblp074/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="zhann"

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
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(git virtualenvwrapper python)

# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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


# rblog
alias rblog='cd /home/gblp074/code/rblog/base'
alias rserver='rblog && python manage.py runserver 8001'
alias rshell='rblog && python manage.py shell'
alias rsandman='rblog && fab deploy_sandman'
alias rsandmanq='rblog && fab deploy_sandman_quick'
alias rcelery='rblog && celery -A celery_app worker -l DEBUG'
alias rredis='redis-server --port 6381'
alias rhoncho='rblog && honcho -f procfile start redis celery'

# ultron
alias ultron='cd /home/gblp074/code/rblog/jarvis'
alias userver='ultron && python manage.py runserver'
alias ushell='ultron && python manage.py shell'
alias ucelery='ultron && celery -A celery_app worker -l DEBUG'
alias uredis='redis-server --port 6379'
alias uhoncho='ultron && honcho -f procfile start redis node && ucelery'

# commom
alias common='cd /home/gblp074/code/rblog/common'
alias choncho='common && honcho -f procfile start celerydistcoverfox celerydistjarvis'

#make (rblog)
alias mb='make build'
alias mr='make run'
alias mp='make pre'

export GOPATH=~/gopath
export PATH=$PATH:$GOPATH/bin


#!/usr/bin/env zsh #adding this to force silly gist highlighting. REMOVE THIS

# ZSH standalone npm install autocompletion. Add this to ~/.zshrc file.
_npm_install_completion() {
	local si=$IFS

	# if 'install' or 'i ' is one of the subcommands, then...
	if [[ ${words} =~ 'install' ]] || [[ ${words} =~ 'i ' ]]; then

		# add the result of `ls ~/.npm` (npm cache) as completion options
		compadd -- $(COMP_CWORD=$((CURRENT-1)) \
			COMP_LINE=$BUFFER \
			COMP_POINT=0 \
			ls ~/.npm -- "${words[@]}" \
			2>/dev/null)
	fi

	IFS=$si
}

compdef _npm_install_completion 'npm'
## END ZSH npm install autocompletion


#npm/js
alias npmis='npm install -S'
alias wp='webpack'
alias jsw='cd static/js && webpack'

#git
alias gcm='git commit -m'
alias ga='git add .'
alias gclone='git clone '
alias gcp="git cherry-pick "
alias gd="git diff --color | diff-so-fancy"

function getBranchName(){
        git name-rev --name-only HEAD
}
function getSource(){
        b=`getBranchName`
        git config branch.$b.remote
}

function upull(){
        b=`getBranchName`;
        s=`getSource`;
        echo "Pulling $b from $s"
        `git pull $s $b`;
}

function upush(){
        b=`getBranchName`;
        s=`getSource`;
        if [ -z $s ]; then
                s="upsteam";
        fi
        echo "pushing $b to origin";
        `git push origin "$b"`;
        echo "pushing $b to $s";
        `git push $s $b`;
}


#yoututbe dl
alias youtube-dl-mp3='youtube-dl --extract-audio --audio-format mp3  --audio-quality  320'


export ANDROID_HOME=/home/gblp074/Android/Sdk
export PATH=$PATH:/home/gblp074/Android/Sdk/tools

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 

# ssh aliases
alias sandman="ssh ubuntu@139.59.13.108"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## Redshift screen filter
alias rshift-night="redshift -O 4000"
alias rshift-off="redshift -x"

PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
export PATH

# needed for virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh