# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export FPATH="/opt/homebrew/bin/eza/completions/zsh:$FPATH"
export FZF_CTRL_T_OPTS="
   --style full
   --walker-skip .git,node_modules,target
   --preview 'bat -n --color=always {}'
   --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

export PATH="/Users/marconi/.local/state/fnm_multishells/63172_1780621705930/bin":$PATH
export FNM_MULTISHELL_PATH="/Users/marconi/.local/state/fnm_multishells/63172_1780621705930"
export FNM_VERSION_FILE_STRATEGY="local"
export FNM_DIR="/Users/marconi/.local/share/fnm"
export FNM_LOGLEVEL="info"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_COREPACK_ENABLED="false"
export FNM_RESOLVE_ENGINES="true"
export FNM_ARCH="arm64"

eval "$(starship init zsh)"
# eval "$(fnm env --use-on-cd)"

# ---

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="miloshadzic"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git starship)

source $ZSH/oh-my-zsh.sh

# bun completions
[ -s "/Users/marconi/.bun/_bun" ] && source "/Users/marconi/.bun/_bun"

# terraform autocompletion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zsc="nvim ~/.zshrc"
alias src="source ~/.zshrc"
# alias npmpls="rm -rf node_modules/ npm-lock.json pnpm-lock.yaml yarn.lock && yarn"
# alias ll="exa -l -g --icons --octal-permissions --no-permissions --no-user -s type --time-style long-iso"
# alias lla="ll -a"
alias nq="networkQuality"
alias cat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub)"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions -a"
alias cd="z"

gtwt() {
  local main_worktree
  main_worktree=$(git worktree list 2>/dev/null | head -1 | awk '{print $1}')
  if [[ -z "$main_worktree" ]]; then
    echo "gtwt: not in a git repo" >&2
    return 1
  fi
  if [[ -z "$1" ]]; then
    builtin cd "$main_worktree"
  else
    local project_name
    project_name=$(basename "$main_worktree")
    builtin cd "$HOME/dev/worktrees/$project_name/$1"
  fi
}

unalias gwta 2>/dev/null
gwta() {
  if [[ -z "$1" ]]; then
    echo "gwta: worktree name required" >&2
    return 1
  fi
  local main_worktree
  main_worktree=$(git worktree list 2>/dev/null | head -1 | awk '{print $1}')
  if [[ -z "$main_worktree" ]]; then
    echo "gwta: not in a git repo" >&2
    return 1
  fi
  local project_name worktree_path
  project_name=$(basename "$main_worktree")
  worktree_path="$HOME/dev/worktrees/$project_name/$1"
  git worktree add -b "$1" "$worktree_path" && builtin cd "$worktree_path"
}

source <(fzf --zsh)
eval "$(zoxide init zsh)"

# Created by `pipx` on 2026-05-31 22:35:16
export PATH="$PATH:/Users/marconi/.local/bin"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/marconi/.lmstudio/bin"
# End of LM Studio CLI section


# pnpm
export PNPM_HOME="/Users/marconi/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
