# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#
alias c='cd'
alias h='cd ~'
alias o='cd ~-'
alias p='cd ..'
alias pp='cd ../..'
alias ppp='cd ../../..'

alias md='take'

alias a='sack'
alias e='ranger'
alias j='jobs'
alias t='tree -'
alias s='subl3'
alias v='vim'
alias x='cdiff'
alias xs='cdiff -s'

alias as='studio'
alias ws='webstorm'
alias release='./gradlew assembleRelease'

alias ea='vim ~/.config/awesome/rc.lua'
alias ei='vim ~/.config/i3/config'
alias eib='vim ~/.i3blocks.conf'
alias et='vim ~/.config/termite/config'
alias ez='vim ~/.oh-my-zsh/custom/example.zsh'
alias ezf='vim ~/.oh-my-zsh/custom/functions.zsh'
alias ezz='vim ~/.zshrc'
alias eb='vim ~/.bash_profile'
alias sb='source ~/.bash_profile'
alias sz='source ~/.oh-my-zsh/custom/example.zsh'
alias szz='source ~/.zshrc'
alias sl='source liberate_sh.sh'
alias sls='source liberate-stop_sh.sh'

[ -x "$(command -v xdg-open)" ] && ! [ -x "$(command -v open)" ] && alias open='xdg-open'
alias st='open'

alias lsn="ls -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"

alias gw='./gradlew'
alias gwc='./gradlew clean'
alias gwb='./gradlew build'
alias gwl='./gradlew lint'
alias gwu='./gradlew testDebug'
alias gwt='./gradlew tasks'
alias gwv='./gradlew --version'
alias gwcb='./gradlew clean build'
alias gwad='./gradlew assembleDebug'
alias gwp='./gradlew spotlessApply'

alias fl='fastlane_wrapper'
alias fla='fl actions'
alias flv='fl --version'

alias pc='pidcat'

alias adbi='adb shell input text'
alias adbicc='adb shell input text 6013500601499859'
alias adbf='adb -e emu finger touch 1'

alias gjf='google-java-format'
alias gjff='google-java-format -i --aosp'
alias lc='adb shell input text 5264714450037326'
alias lg='adb shell input tap 200 345 && adb shell input text hellotesting123@yopmail.com && adb shell input keyevent 61 && adb shell input text qwerty && adb shell input tap 200 722'
alias lg1='adb shell input tap 925 450 && adb shell input tap 110 675 && adb shell input text spdqaacct+sppoolmssl@gmail.com && adb shell input keyevent 61 && adb shell input text Special2 && adb shell input tap 800 1120'
alias lg2='adb shell input tap 925 450 && adb shell input tap 110 675 && adb shell input text spdqaacct+nccami@gmail.com && adb shell input keyevent 61 && adb shell input text Password2 && adb shell input tap 800 1110'
alias lg3='adb shell input tap 925 450 && adb shell input tap 110 675 && adb shell input text briankkm@spgroup.com.sg && adb shell input keyevent 61 && adb shell input text SP12india12! && adb shell input tap 800 1120'

# git
[ -x "$(command -v hub)" ] && alias git=hub
DEVELOP_BRANCH="develop"

alias gad='git add .'
alias gaa='git add -A'
alias gar="git add . && git rebase --continue"
alias gac='git add . && git commit'
alias gacp='git add . && git commit --amend --no-edit && git pull --rebase origin master && git push -f bk'
alias gbm='git branch -m'
alias gs='git status -sb'
alias gsi='git status -sb --ignored'
alias gsh='git stash'
alias gd='git diff'
alias gdc='git diff --cached'
alias gds='git diff --summary --stat'
alias gdcs='git diff --summary --stat --cached'
alias gdchk='git diff --check 4b825dc642cb6eb9a060e54bf8d69288fbee4904'
alias gca='git commit --amend'
alias gcan='git add . && git commit --amend --no-edit'
alias gcic='git commit -m"Initial commit"'
alias gcir='git init && git add . && gcic'
alias gce='git commit --allow-empty -m"[empty commit `date +%s | tail -c 5`]"'
alias gf='git fetch'
alias gfa='gf --all --prune'
alias gb='git branch -vv'
alias gfo='git fork && git remote rename briankan bk'
alias ggp='git grep -I -n --heading --break'
alias gm='git merge --ff-only'
alias gst='git -c commit.gpgsign=false stash'
alias gstrq='git stash && GIT_SEQUENCE_EDITOR=: git rebase --autosquash -i origin/master && git stash pop'
alias grq='GIT_SEQUENCE_EDITOR=: git rebase --autosquash -i origin/master'
alias grc='git rebase --continue'
alias grs='git reset --soft HEAD~'
alias grm='git rebase $DEVELOP_BRANCH'
alias grim='git rebase -i origin/$DEVELOP_BRANCH'
alias gpb='git push bk'
alias gpfb='git push -f bk'
alias gpo='git push origin HEAD'
alias gpof='git push origin HEAD -f'
alias gpl='git pull origin $DEVELOP_BRANCH'
alias gpr='git pull-request'
alias gprr='git pull --rebase origin $DEVELOP_BRANCH'
alias gprrp='git pull --rebase origin master && git push -f bk'
alias grh1='git reset --hard HEAD~1'
alias grh2='git reset --hard HEAD~2'
alias grh3='git reset --hard HEAD~3'
alias grh4='git reset --hard HEAD~4'
alias grht='git reset --hard `git rev-parse --abbrev-ref --symbolic-full-name @{u}`'
alias gsp='git stash pop'
alias gcm='git checkout $DEVELOP_BRANCH'
alias gcd='git checkout'
alias gg='git checkout'
alias gco='git checkout -'
alias gcb='git checkout -b'
alias gl='git log'
alias glg='git log --graph --full-history --color --date=short --pretty=format:"%x1b[31m%h%x09%x1b[30;1m%ad%x1b[0m%x1b[32m%d%x1b[0m%x20%s%x20%x1b[34;1m[%aE]"'
alias gll='git log --format=fuller'
alias gl1='gll -1 --show-signature --parents'
alias gs1='git show HEAD'
alias gs2='git show HEAD~1'
alias gs3='git show HEAD~2'
alias gs4='git show HEAD~3'
alias gcp='git cherry-pick'
alias gr='git reset'
alias gr1='gr -10'
alias gra='gr --all'
alias grt='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'
if [ -x "$(command -v hub)" ]; then
    alias gh='hub browse'
else
    alias gh="git remote -v | grep --color=never origin | head -n 1 | grep --color=never -o 'github.*' | sed 's/.git\ .*//' | sed 's/\:/\//' | sed 's/^/https:\/\//' | xargs open"
fi

alias ackandsdk="ack -i 'com\.android\.tools\.build|buildtools|build\-tools|compilesdk|targetsdk|target=|android-'"
alias aackandsdk="a -i 'com\.android\.tools\.build|buildtools|build\-tools|compilesdk|targetsdk|target=|android-'"
alias cpsshpub="xclip -sel clip < ~/.ssh/id_rsa.pub"
alias aa="a -1 '<<<' && F 1"
alias alint="android-lint-summary -g '**/lint-result*.xml' | less -FRSX"
alias olint="find . -iname 'lint-*.html' -print0 | xargs -0 open"
