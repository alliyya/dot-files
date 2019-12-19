########################################## 
#             _ _                        #
#       /\   | (_)                       #
#      /  \  | |_  __ _ ___  ___  ___    #
#     / /\ \ | | |/ _` / __|/ _ \/ __|   #
#    / ____ \| | | (_| \__ \  __/\__ \   #
#   /_/    \_\_|_|\__,_|___/\___||___/   #
#                                        #
##########################################

# TODO:
# Test aliases for compatiblity on OS's, less dependent on builtins

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
# alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

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


# randomText() {
#     info bash -o -|shuf -n$1|sed 's/  */ /g;s/^ //'|fmt -w 90
# }

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
# alias viv='cd ~/Desktop/viv'
# alias work='cd ~/Desktop/work'

# mes amis
alias bhav='cd ~/stuff/other/random/bhav/'
alias bro='cd ~/stuff/other/random/brother'
alias tamara='cd ~/stuff/other/random/tamara/'
alias viv='cd ~/stuff/other/random/viv/'

alias pa='cd ~/stuff/pa'
alias playground='cd ~/stuff/other/playground'

alias school='cd ~/stuff/class'
alias class='cd ~/stuff/class/currentCourses'
alias past='cd ~/stuff/class/pastCourses'
alias repo='cd ~/stuff/ta/cis1500/repo/cis1500_labs'
alias ta='cd ~/stuff/ta/cis1500/F19'

alias other='cd ~/stuff/other'
alias random='cd ~/stuff/other/random'
alias rtesting='cd ~/stuff/other/test'
alias portfolio='cd ~/stuff/portfolio'
alias aoc='cd ~/stuff/practice/adventofcode'

alias readings='cd ~/stuff/readings'


alias work='cd ~/stuff/work'
alias ontology='cd ~/stuff/work/cwrc/ontology'
alias oscripts='cd ~/stuff/work/cwrc/ontology/scripts'
alias tdata='cd ~/stuff/work/cwrc/testData'
alias extraction='cd ~/stuff/work/cwrc/RDF-extraction'
alias tools='cd ~/stuff/work/cwrc/docgen/specgenMarkII'
alias docgen='cd ~/stuff/work/cwrc/docgen/specgenMarkII/documentationGenerator'
alias gccode='cd ~/stuff/other/random/gcc'

#################
#Current Courses#
#################
#

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
alias gco='git checkout'
alias gpl='git pull'
alias gd='git diff'
alias gcoma='git commit -am'
alias gch='git status -s | grep "??" -v'
alias gmod='git status | grep "modified:"'
alias matchHead='git checkout @ -- '

########################
#Applications shortcuts#
########################
alias go='gvfs-open'
alias tl='tldr'
alias o='okular'
alias ppt2pdf='unoconv -f pdf'
alias compile='gcc -Wall -std=c99'
alias rap='rapper'
alias turtle='rapper -i turtle'
alias android='~/Desktop/android-studio/bin/studio.sh'

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
alias sshgen='ssh alliyya@general.uoguelph.ca'
alias sshstat='ssh alliyya@stats.uoguelph.ca'
alias sshport='ssh alliyya@portkey.socs.uoguelph.ca'
alias sshlong='ssh alliyya@longbottom.socs.uoguelph.ca'
alias sshgrang='ssh alliyya@granger.socs.uoguelph.ca'

alias sshcwrc='ssh ubuntu@sparql.cwrc.ca'
# alias sshta='ssh cis1500@linux.socs.uoguelph.ca'
# alias sshgrading="ssh -t cis1500@portkey.socs.uoguelph.ca \"ssh -t cis1500@linux.socs.uoguelph.ca 'cd Fall18/grading/A1/ ; bash'\""
# alias sshangel='ssh alliyya@cis2750.socs.uoguelph.ca'
# alias sshwebangel='ssh alliyya@2750web.socs.uoguelph.ca'
# alias sshserver='ssh -t alliyya@portkey.socs.uoguelph.ca "ssh alliyya@2750web.socs.uoguelph.ca"'
# alias sshta='ssh -t cis1500@portkey.socs.uoguelph.ca "ssh cis1500@linux.socs.uoguelph.ca"'

alias xclip='xclip -selection c'


skeleton() {
    echo "#include <stdio.h>
int main(void)
{
    return 0;
}
"

}

pyskeleton() {
    echo "#!/usr/bin/python3

def main():
    pass


if __name__ == '__main__':
    main()
    "

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

checkport() {
	sudo lsof -i :$1
}

# TODO make these into functions
# list out files, cat each file, confirm deletion

# Delete files of a certain size
# find . -name "*.txt" -size -352c -delete

# Delete empty directories
# find . -type d -empty -delete

