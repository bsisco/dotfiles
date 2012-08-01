# Prompt
# for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done  
c_lg="\[\033[38;5;141m\]" # lines command ok
c_lf="\[\033[38;5;196m\]" # lines command fail
c_us="\[\033[38;5;106m\]" # user
c_at="\[\033[38;5;111m\]" # at symbol @
c_ho="\[\033[38;5;167m\]" # host
c_wd="\[\033[38;5;220m\]" # working directory
c_ru="\[\033[38;5;118m\]" # regular user
c_su="\[\033[38;5;196m\]" # root user
c_xx="\[\e[0m\]"          # reset

# truncated working directory
twd() {
    local dynamic="`whoami`$HOSTNAME"
    local len_extra_chars=3 # length of misc characters and spaces on first line
    local len_term=${COLUMNS:-80} # if no variable $COLUMNS use 80
    local len_max_wd=$((len_term-$len_extra_chars-${#dynamic}))
    local trim_range=90 # limit position of trims to a percentage of $len_max_wd
    local wd=${PWD/$HOME/\~}
    # no need to continue if truncation unnecessary
    if [ ${#wd} -lt $len_max_wd ]
    then
        echo $wd
        return
    fi
    local old_ifs=$IFS
    local IFS="/"
    local longest=''
    local pos_longest=0
    local index=0
    # find position of longest dir in wd (within restricted range)
    for x in ${wd:0:$((len_max_wd*$trim_range/100))}
    do
        if [ ${#x} -gt ${#longest} ]
        then
            longest=$x
            pos_longest=$index
        fi
        index=$((index + ${#x} + 1))
    done
    local IFS=$old_ifs
    local difference=$((${#wd} - $len_max_wd))
    echo ${wd:0:$((pos_longest+3))}...${wd:$((pos_longest+6+$difference))}
}

get_ps1() {
    [ $? -eq 0 ] && c_ln="${c_lg}" || c_ln="${c_lf}"
    [ $EUID -eq 0 ] && chr_usr="${c_su}#" || chr_usr="${c_ru}"
    PS1="${c_ln}╭${c_us}\u${c_at}@${c_ho}\h${c_at}∙${c_wd}$(twd)\n${c_ln}╰${chr_usr}\$${c_xx} "
}

PROMPT_COMMAND=get_ps1
