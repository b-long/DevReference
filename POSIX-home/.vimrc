"------ My ~/.vimrc file ------"
set backspace=indent,eol,start
set history=700
set autoread

syntax on
colorscheme darkblue

"------ Console UI & Text display ------"
set number 	" Automatically turn on line numbers

" Tell Vim to highlight Vagrantfile(s)
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
