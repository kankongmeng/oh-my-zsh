# Make dir and cd into it
#md() { mkdir -p "$@" && cd "$@"; }

# Update Gradle wrapper
ugw() {
    echo "task w(type:Wrapper){gradleVersion='$*'}" > build.gradle
    rm -f settings.gradle
    gradle w
    git checkout build.gradle
    git checkout settings.gradle
    sed -i '' "s/-bin\.zip/-all\.zip/g" gradle/wrapper/gradle-wrapper.properties
    git add gradle
    git commit -m"Update Gradle wrapper to $*"
}

# Update fastlane
ufl() {
    bundle update fastlane
    git add -u
    git commit -m"Update fastlane to $*"
}

# Update Android Gradle plugin
uagp() {
    sed -i '' "s#.build:gradle:[[:digit:]].[[:digit:]].[[:digit:]]#.build:gradle:$*#g" build.gradle
    git add build.gradle
    git commit -m"Update Android Gradle plugin to $*"
}

# fastlane wrapper
fastlane_wrapper() {
    if [ -f Gemfile ]; then
        bundle exec fastlane $*
    else
        fastlane $*
    fi
}

check_git_tags() {
    git show-ref -d --tags       |
    cut -b 42-                   | # to remove the commit-id
    sort                         |
    sed 's/\^{}//'               | # remove ^{} markings
    uniq -c                      | # count identical lines
    sed 's/2\ refs\/tags\// a /' | # 2 identicals = annotated
    sed 's/1\ refs\/tags\//lw /'
}

# Express init
expinit() {
    express --git $1 && cd $1
    git init
    git add .
    git commit -m"Initial commit"
    npm version minor
    npm update
}

jenkins() {
    java -jar ~/bin/jenkins-cli-2.86.jar -s http://localhost:8080/ $*
}

show-version() { zsh --version; zle accept-line }

debugsign() {
    jarsigner -verbose -keystore ~/.android/debug.keystore -storepass android -keypass android "$1" androiddebugkey
}

dexinfo() {
    if [ "$#" -eq 0 ]; then
        echo "Usage: dexinfo app1.apk [app2.apk ...]"
    fi
    for file
    do
        if jar xvf "$file" classes.dex > /dev/null 2>&1; then
            echo "File name: "$(basename "$file")
            hexdump -s 32 -n 4 -e '1/4 "File size: %d\n"' classes.dex
            hexdump -s 56 -n 4 -e '1/4 "Strings:   %d\n"' classes.dex
            hexdump -s 80 -n 4 -e '1/4 "Fields:    %d\n"' classes.dex
            hexdump -s 88 -n 4 -e '1/4 "Methods:   %d\n"' classes.dex
            rm classes.dex
        else
            echo "Unable to open '$file' and/or extract classes.dex"
        fi
    done
}

# git clone wrapper
gcl() {
    local ORG_DEFAULT="friederbluemle"
    local DIR_DEFAULT=$HOME/github
    if [ $# -gt 0 ]; then
        local ORG_NAME=`dirname $1`
        local REPO_NAME=`basename $1`

        if [ $ORG_NAME = "." ]; then
            ORG_NAME=$ORG_DEFAULT
        fi

        local DIR_NAME="$DIR_DEFAULT/$ORG_NAME/$REPO_NAME"

        if [[ ! -d $DIR_NAME ]]; then
            git clone $1 $DIR_NAME
        fi

        if [[ -d $DIR_NAME ]]; then
            cd $DIR_NAME
        fi
    else
        echo "Usage: gcl [org/]repo"
        echo ""
        echo "Clones a GitHub repo to $DIR_DEFAULT/<org>/<repo>"
        echo "If no org is specified, defaults to $ORG_DEFAULT"
    fi
}

n() {
  nohup mousepad $1 </dev/null &>/dev/null &
}

replacelines() {
  ack "$1" -l --print0 | xargs -0 -n 1 gsed -i "s/$1/$2/g";
}

deletelines() {
  ack "$1" -l --print0 | xargs -0 -n 1 gsed -i "/$1/d";
}

git_branch_color() {
  if [[ "$(command git config --get oh-my-zsh.hide-status)" != "1" ]]; then
    local SUBMODULE_SYNTAX=''
    local GIT_STATUS=''
    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
          SUBMODULE_SYNTAX="--ignore-submodules=dirty"
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
        GIT_STATUS=$(command git status -s ${SUBMODULE_SYNTAX} -uno 2> /dev/null | tail -n1)
    else
        GIT_STATUS=$(command git status -s ${SUBMODULE_SYNTAX} 2> /dev/null | tail -n1)
    fi
    if [[ -n $GIT_STATUS ]]; then
      echo "%{$fg[red]%}"
    else
      echo "%{$fg[green]%}"
    fi
  else
    echo "%{$fg[green]%}"
  fi
}

git_branch_info() {
  branch=$(command git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ $? -eq 0 ]; then
    echo -ne "%{$reset_color%}:"
    git_status=$(command git status --untracked-files=no --ignore-submodules=dirty --porcelain 2>/dev/null)
    if [[ $? -eq 128 ]]; then
      echo -ne "%{$fg[magenta]%}GIT_DIR!"
    else
      if [[ -z $git_status ]]; then
        echo -ne "%{$fg[green]%}${branch}"
      else
        echo -ne "%{$fg[red]%}${branch}"
      fi
      git config --get branch.$branch.remote >/dev/null 2>&1
      if [[ $? -eq 0 ]]; then
        diverged=$(command git log @{u}... --oneline | wc -l | tr -d ' ')
        if [[ $diverged -ne 0 ]]; then
          echo -ne "%{$fg_bold[yellow]%}"
          ahead=$(command git log @{u}.. --oneline | wc -l | tr -d ' ')
          if [[ $ahead -eq $diverged ]]; then
            echo -ne "↑ $ahead"
          else
            behind=$(command git log ..@{u} --oneline | wc -l | tr -d ' ')
            if [[ $behind -eq $diverged ]]; then
              echo -ne "↓ $behind"
            else
              echo -ne "↕ ↑ $ahead↓ $behind"
            fi
          fi
        fi
      fi
    fi
  else
    return 0
  fi
}

ssh_status() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo -ne "%{$reset_color%}:%{$fg[magenta]%}SSH!"
  fi
}
