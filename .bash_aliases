########################################## 
#             _ _                        #
#       /\   | (_)                       #
#      /  \  | |_  __ _ ___  ___  ___    #
#     / /\ \ | | |/ _` / __|/ _ \/ __|   #
#    / ____ \| | | (_| \__ \  __/\__ \   #
#   /_/    \_\_|_|\__,_|___/\___||___/   #
#                                        #
##########################################

##############
#Meta Aliases#
##############
alias editaliases='subl ~/.bash_aliases'
alias resetbash='. ~/.bashrc'
alias findaliases='alias | grep'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

############
#ls aliases#
############
alias ll='clear;ls -alF'
alias lx='clear;ls -alFX'
alias la='clear;ls -A'
alias l='ls -CF'
alias le='ls -CFR' #Recursive listings of files
alias lt='echo "-----Newest-----" && ls -t1 && echo "-----Oldest-----"'
alias ltr='echo "-----Oldest-----" && ls -rt1 && echo "-----Newest-----"'
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

alias c='clear'
alias cls='clear'

#########################
#history alias/functions#
#########################
alias hg='history | grep' #allows searching through command history

tophist() {
    history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
}

histtop(){
    history|awk '{print $2}'|sort|uniq -c|sort -rn|head -30|awk '!max{max=$1;}{r="";i=s=100*$1/max;while(i-->0)r=r"#";printf "%50s %5d %s %s",$2,$1,r,"\n";}'
}


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

############
#cd aliases#
############
##################
#Quick cd aliases#
##################
alias ..='cd ..'
alias ....='cd ../..'
alias cd..='cd ..'

up(){
    local d=""
    limit=$1
    for ((i=1 ; i <= limit ; i++))
        do
            d=$d/..
        done
    d=$(echo $d | sed 's/^\///')
    if [ -z "$d" ]; then
        d=..
    fi
    cd $d
}

mkcd() {
    mkdir $1 && cd $1
}


################
# Common Paths #
################
##############
#Main folders#
##############
alias home='cd'
alias down='cd ~/Downloads'
alias doc='cd ~/Documents'
alias desk='cd ~/Desktop'
alias stuff='cd ~/stuff'
alias viv='cd ~/Desktop/viv'
# alias work='cd ~/Desktop/work'

alias portfolio='cd ~/stuff/portfolio'
alias pa='cd ~/stuff/pa'
alias school='cd ~/stuff/class'
alias class='cd ~/stuff/class/currentCourses'
alias past='cd ~/stuff/class/pastCourses'
alias ta='cd ~/stuff/ta/cis1500/F17'
alias readings='cd ~/stuff/readings'
alias other='cd ~/stuff/other'
alias testing='cd ~/stuff/other/test'
alias random='cd ~/stuff/other/random'
alias work='cd ~/stuff/work'
alias mission='cd ~/stuff/other/random/brother'
alias ontology='cd ~/stuff/work/cwrc/ontology'
alias tools='cd ~/stuff/work/cwrc/docgen/specgenMarkII'
alias docgen='cd ~/stuff/work/cwrc/docgen/documentationGenerator'

#################
#Current Courses#
#################
alias soft='cd ~/stuff/class/currentCourses/softDesign/cis3260'
alias syst='cd ~/stuff/class/currentCourses/systAn/cis3750'
alias calc='cd ~/stuff/class/currentCourses/calc/math2200'
alias diffy='cd ~/stuff/class/currentCourses/diffies/math2270'
alias oper='cd ~/stuff/class/currentCourses/operations/math3240'

#################
#Typical Folders#
#################
alias notes='cd notes'
alias ass='cd assignments'
alias labs='cd labs'

##################
#Current projects#
##################
# most current project directory
# alias cdd='cd ~/blah/blah'
# experimentalVersion/  reOrganizedVersion/  updatedVersion/

alias ctower='cd ~/stuff/portfolio/reverseTowerDefenceGame/classVersion/towerOffence'
alias etower='cd ~/stuff/portfolio/reverseTowerDefenceGame/experimentalVersion/towerOffence'
alias rtower='cd ~/stuff/portfolio/reverseTowerDefenceGame/reOrganizedVersion/towerOffence'
alias utower='cd ~/stuff/portfolio/reverseTowerDefenceGame/updatedVersion/towerOffence'

##################
#assorted aliases#
##################
count () {
    echo -ne "Lines:\t"  &&  wc -l < $1
    echo -ne "Words:\t"  &&  wc -w < $1
    echo -ne "Chars:\t"  &&  wc -m < $1
    echo -ne "Bytes:\t"  &&  wc -c < $1
    echo -ne "MaxLen:\t"  &&  wc -L < $1
}
# alias count="echo 'Lines Words Bytes' && wc"

#######################################
#Software updates/installation aliases#
#######################################
alias fuck='sudo $(fc -ln -1)'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias aptinstall='sudo apt-get install'
alias aremove='sudo apt-get autoremove'
alias aclean='sudo apt-get autoclean'
alias fixwifi='sudo systemctl restart network-manager.service'
alias fixaudio='alsactl restore'

#############
#git aliases#
#############
alias uncommit='git reset HEAD^'
alias gst='git status'
alias gpl='git pull'
alias gd='git diff'
alias gch='git status -s | grep "??" -v'
alias gmod='git status | grep "modified:"'

########################
#Applications shortcuts#
########################
alias go='gvfs-open'
alias tl='tldr'
alias o='okular'
alias ppt2pdf='unoconv -f pdf'
alias compile='gcc -Wall -std=c99'
alias rap='rapper'
#############
#Cool things#
#############
alias starwars='telnet towel.blinkenlights.nl '

##################
#Quick references#
##################
alias ascii='man ascii'
alias units='man units'

#############
#ssh thingss#
#############
alias sshlinux='ssh alliyya@linux.socs.uoguelph.ca'
alias sshport='ssh alliyya@portkey.socs.uoguelph.ca'
alias sshgen='ssh alliyya@general.uoguelph.ca'
alias sshstat='ssh alliyya@stats.uoguelph.ca'
alias sshlong='ssh alliyya@longbottom.socs.uoguelph.ca'
alias sshgrang='ssh alliyya@granger.socs.uoguelph.ca'
alias sshangel='ssh alliyya@cis2750.socs.uoguelph.ca'
alias sshwebangel='ssh alliyya@2750web.socs.uoguelph.ca'
alias sshserver='ssh -t alliyya@portkey.socs.uoguelph.ca "ssh alliyya@2750web.socs.uoguelph.ca"'
alias sshcwrc='ssh ubuntu@sparql.cwrc.ca'


#!/usr/bin/expect -f
# testscp() {
#     scp -r $1 alliyya@portkey.socs.uoguelph.ca:~$2
# }

skeleton() {
    echo "#include <stdio.h>"
    echo "int main(void)"
    echo "{"
    echo "    return 0;" 
    echo "}"

}

comprun() {
    rm ./a.out
    gcc $1 -Wall -std=c99 && ./a.out
}

printlines(){
    for ((i=1; i<=$2; i++)); do
        echo $1
    done
}


