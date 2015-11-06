# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

ANDROID_NDK_HOME=/home/terrylove/codebase/AndroidTool/android-ndk-r9
ADB_HOME=/home/terrylove/codebase/AndroidTool/adt-bundle-linux-x86_64-20130729/sdk/platform-tools
AAPT_HOME=/home/terrylove/codebase/AndroidTool/adt-bundle-linux-x86_64-20130729/sdk/build-tools/android-4.3
ECLIPSE_HOME=/home/terrylove/codebase/AndroidTool/adt-bundle-linux-x86_64-20130729/eclipse
JAVA_HOME=/usr/lib/jvm/jdk1.6.0_45
PATH=$JAVA_HOME:$AAPT_HOME:$ECLIPSE_HOME:$ANDROID_NDK_HOME:$ADB_HOME:$PATH


adb_permission() {
ADB_PATH=`which adb`
ls $ADB_PATH
sudo $ADB_PATH kill-server
sudo $ADB_PATH devices
}

jdk_6() {
sudo update-alternatives --set java /usr/lib/jvm/jdk1.6.0_45/bin/java 
sudo update-alternatives --set javac /usr/lib/jvm/jdk1.6.0_45/bin/javac
sudo update-alternatives --set javaws /usr/lib/jvm/jdk1.6.0_45/bin/javaws
sudo update-alternatives --set jar /usr/lib/jvm/jdk1.6.0_45/bin/jar
sudo update-alternatives --set javadoc /usr/lib/jvm/jdk1.6.0_45/bin/javadoc
sudo update-alternatives --set javah /usr/lib/jvm/jdk1.6.0_45/bin/javah
sudo update-alternatives --set keytool /usr/lib/jvm/jdk1.6.0_45/bin/keytool
sudo update-alternatives --set javap /usr/lib/jvm/jdk1.6.0_45/bin/javap
}

jdk_7() {
sudo update-alternatives --set java /usr/lib/jvm/jdk1.7.0_79/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/jdk1.7.0_79/bin/javac
sudo update-alternatives --set javaws /usr/lib/jvm/jdk1.7.0_79/bin/javaws
sudo update-alternatives --set jar /usr/lib/jvm/jdk1.7.0_79/bin/jar
sudo update-alternatives --set javadoc /usr/lib/jvm/jdk1.7.0_79/bin/javadoc
sudo update-alternatives --set javah /usr/lib/jvm/jdk1.7.0_79/bin/javah
sudo update-alternatives --set keytool /usr/lib/jvm/jdk1.7.0_79/bin/keytool
sudo update-alternatives --set javap /usr/lib/jvm/jdk1.7.0_79/bin/javap
}

shine_work() {
launch_workspace shine_eng $1
}

Q22_work() {
launch_workspace E60Q22 $1
}

Q32_work() {
launch_workspace E60Q32_NTX $1
}

Piper_work() {
launch_workspace Piper $1
}

Piper_eng_work() {
launch_workspace Piper_eng $1
} 

NBKK_work() {
launch_workspace NBKK $1
}

launch_workspace() {
CODEBASE=$1
if [[ -n $2 ]]; then
echo 11111111111111
TARGET_COMPORT=$2
else
echo 222222222222222
TARGET_COMPORT=0
fi

echo "CODEBASE = "$CODEBASE
echo "TARGET_COMPORT = "$TARGET_COMPORT
if [[ $CODEBASE == "E61"* || $CODEBASE == "E6E"* || $CODEBASE == "shine"* ]]; then
	echo "imx5 series !!"
PLATFORM=imx50
else
	echo "imx6 series !!"
PLATFORM=imx6
fi

DATE=`date +%Y%m%d%H%M%S`
echo "time : " $DATE
adb_permission

gnome-terminal --maximize \
--tab-with-profile=NoTitleChange -t "build $CODEBASE" --zoom=1.4 --working-directory=/home/terrylove/codebase/$PLATFORM/$CODEBASE \
--tab-with-profile=NoTitleChange -t "search $CODEBASE" --zoom=1.4 --working-directory=/home/terrylove/codebase/$PLATFORM/$CODEBASE \
--tab-with-profile=NoTitleChange -t "minicom(/home/terrylove/logs/minicom/minicom_$DATE.txt)" --zoom=1.4 -e "bash -c \"sudo minicom -c on -D/dev/ttyUSB$TARGET_COMPORT -b 115200 -C /home/terrylove/logs/minicom/minicom_$DATE.txt; exec bash -i\"" \
--tab-with-profile=NoTitleChange -t "adb logcat(/home/terrylove/logs/adb/adb_$DATE.txt)" --zoom=1.4 -e "bash -c \"adb logcat > /home/terrylove/logs/adb/adb_$DATE.txt; exec bash -i\"" \
--tab-with-profile=NoTitleChange -t "adb logcat show" --zoom=1.4 -e "bash -c \"adb logcat ; exec bash -i\""
}


#export CSCOPE_EDITOR=vim

