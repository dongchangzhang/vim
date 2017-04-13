!#/bin/bash


# print log
print_log() {
    echo -e  "\033[0;31;1m INSTALL-LOGS: $1  \033[0m"
    echo LOGS: $1 >> $LOG
}
backup() {
        # for .vimrc
    if [ -f "$HOME/.vimrc" ]; then 
        print_log "mv $HOME/.vimrc to $HOME/.vimrc.bak"
        mv $HOME/.vimrc $HOME/.vimrc.bak
    fi
    # for .vim
    if [  -d "$HOME/.vim" ]; then  
        print_log "mv $HOME/.vim to $HOME/.vim.bak"
        mv $HOME/.vim $HOME/.vim.bak
    fi
}
# do config
full() {
    cp full-version/.vimrc $HOME/
    cp full-version/.ycm_extra_conf.py $HOME/
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    cp -r colors ~/.vim/
    vim +PluginInstall +qall
    print_log 'config youcompleteme'
    $HOME/.vim/bundle/YouCompleteMe/install.sh  --clang-completer --system-libclang
    print_log "done"
}
light() {

    cp light-version/.vimrc $HOME/
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    cp -r colors ~/.vim/
    vim +PluginInstall +qall
}
