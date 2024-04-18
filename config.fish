export PATH="/Users/louis.demetz/.nvm/versions/node/v16.20.0/bin:/Users/louis.demetz/miniforge3/condabin:/Library/Frameworks/Python.framework/Versions/3.10/bin:/Library/Frameworks/Python.framework/Versions/3.11/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/Library/Frameworks/Python.framework/Versions/3.6/bin:/Library/Frameworks/Python.framework/Versions/3.8/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/Apple/usr/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:/Users/louis.demetz/.spicetify"


neofetch
alias v='nvim'
alias lg='lazygit'
alias fzd='cd $(fd --type directory | fzf)'
alias gs='git status'
alias gfs='git fetch && git status'
zoxide init fish | source
function z; cd $(zoxide query $argv); end
function zi; cd $(zoxide query -i $argv); end
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
