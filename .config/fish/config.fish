function fish_greeting
    fortune | cowsay | lolcat
end

set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx BAT_CONFIG_PATH "$XDG_CONFIG_HOME/bat.conf"

set -gx TERM xterm-256color

set -gx BIN "/usr/bin:/usr/local/bin"
set -gx HOMEBREW_BIN /opt/homebrew/bin
set -gx PNPM_HOME "$HOME/Library/pnpm"
set -gx CARGO_BIN "$HOME/.cargo/bin"
set -gx BUN_INSTALL "$HOME/.bun"

set -gx PATH "$HOMEBREW_BIN:$PATH:$BIN:$PNPM_HOME:$CARGO_BIN:$BUN_INSTALL/bin:$(gem environment gemdir)/bin:$(brew --prefix ruby)/bin"

# mkcert
set -gx CAROOT "$HOME/.certs"

# bitwarden
set -gx BW_SESSION ""

# Aliases
# exa
alias ll="exa -l -g --icons --git"
alias llt="exa -1 --icons --tree --git-ignore"
# fzf
alias search="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"

# Node.js
alias n="node"
alias p="pnpm"

# Update & clean Homebrew
alias b="brew update; brew upgrade; brew cleanup; brew cleanup -s; brew doctor; brew missing"
# Git
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gs="git status"
alias gaa="git add ."
alias gcm="git commit -m"
alias gcmnv="git commit --no-verify -m"
alias gcmnva="git commit --no-verify --amend"
alias gca="git commit --amend"
alias gp="git pull"
alias gpush="git push -u origin HEAD"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gfa="git fetch --all"
alias gpfa="git pull; git fetch --all"
alias gupa="git pull --rebase --autostash"
alias gupav="git pull --rebase --autostash --verbose"
# alias git-https="git remote set-url origin https://github.com/$(git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')"
# alias git-ssh=" git remote set-url origin git@github.com:$(git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')"
alias lg="lazygit"

# k8s hetzner
# https://github.com/kube-hetzner/terraform-hcloud-kube-hetzner
alias createkh='set tmp_script (mktemp); curl -sSL -o "{tmp_script}" https://raw.githubusercontent.com/kube-hetzner/terraform-hcloud-kube-hetzner/master/scripts/create.sh; chmod +x "{tmp_script}"; bash "{tmp_script}"; rm "{tmp_script}"'
alias cleanupkh='set tmp_script (mktemp) && curl -sSL -o "{tmp_script}" https://raw.githubusercontent.com/kube-hetzner/terraform-hcloud-kube-hetzner/master/scripts/cleanup.sh && chmod +x "{tmp_script}" && bash "{tmp_script}" && rm "{tmp_script}"'

# shell
set -gx SHELL (command -s fish)

# zoxide
zoxide init fish | source

# fnm
fnm env --use-on-cd | source
fnm completions --shell fish | source

# starship prompt
starship init fish | source

# pnpm
set -gx PNPM_HOME /Users/sami/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
