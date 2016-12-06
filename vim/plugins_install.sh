cd ~
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# airline installation
mkdir -p ~/.vim/bundle
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

#Taglist
git clone https://github.com/vim-scripts/taglist.vim.git ~/.vim
