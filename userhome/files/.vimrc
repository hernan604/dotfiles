set nomodeline

" set wfh --  window fixed height


" ####### https://github.com/gmarik/Vundle.vim ########### BEGIN
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
" Plugin vim-syntax-extra
Plugin 'https://github.com/justinmk/vim-syntax-extra.git'

Plugin 'pangloss/vim-javascript'

Plugin 'airblade/vim-gitgutter'
Plugin 'sjl/gundo.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'xolox/vim-misc'
Plugin 'mattn/emmet-vim'

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_cmd = 'CtrlP :pwd'

":Bundle 'wakatime/vim-wakatime'
 
:hi CustomPink ctermbg=205 guibg=hotpink guifg=black ctermfg=black
:hi CustomRed ctermbg=124 guibg=hotpink guifg=black ctermfg=black
:hi CustomYellow ctermbg=50 guibg=hotpink guifg=black ctermfg=black
:call matchadd('CustomPink', '\<undefined\>')
:call matchadd('CustomPink', 'TODO')
:call matchadd('CustomPink', 'FROM')
:call matchadd('CustomPink', 'SELECT')
:call matchadd('CustomRed', '\t')
:call matchadd('CustomYellow', '\s\+$')

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ####### https://github.com/gmarik/Vundle.vim ########### END


" Wakatime

" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'

:syntax on
:set softtabstop=4
:set shiftwidth=4
:set tabstop=4
:set expandtab
:set ruler
:set showmatch
:set pastetoggle=<f5>

":set foldmethod=syntax
"SOMETHING IS BUGGED WITH :set number ... when opening a fold, gives seg fault
:set number

:set cursorline
:set cursorcolumn
:set backspace=2
":autocmd BufWritePre * :%s/\s\+$//e
":autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe 'normal g"\'' | endif





:set hls
:set nomodeline
"colorscheme elflord
"colorscheme sea
let perl_want_scope_in_variables=1
let perl_extended_vars=1
let perl_include_pod=1
let perl_fold=1
"hi Folded ctermfg=red
set smartindent
set wildmenu
"perlsupport
filetype plugin on
let g:Perl_AuthorName      = 'Name'
let g:Perl_AuthorRef       = 'NAME'
let g:Perl_Email           = 'email@mail.com'
let g:Perl_Company         = 'Company Name'

"freebsd set nocp
:set nocp
:set statusline=%<%f\ %y[%{&ff}]%m%r%w%a\ %=%l/%L,%c%V\ %P


"restarta o vimrc
autocmd! bufwritepost .vimrc source %
"IDENTACAO VERTICAL
":set list
":set listchars=tab:|
"VIM MINI BUFFER
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"CTAGS - RELOAD abbreviations without restart vim, just type: :source $MYVIMRC

":map <F2> :echo 'Current time is ' . ls<CR>
":map <F2> "zyiw:exe "vs ".@z.""<CR>
":map <F3> "zyiw:exe "! ls -all ".@z.""<CR>
" digitar uma palavra, posicionar o cursor e apertar F3. isso vai dar um ls -la na palavra em baixo do cursor

":map <F4> "zyiw:exe "! perl /home/hernan/p/caniuse/caniuse.pl ".@z.""<CR>
:map <F4> "zyiw:exe "! caniuse ".@z.""<CR>

" lalal
:map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

" js_beautify = cpanm JavaScript::Beautifier
:map <leader>jb  <Esc>:%!js_beautify.pl %:p<CR>


""""""""""""""""""""
" vim get the name of current files:
" http://vim.wikia.com/wiki/Get_the_name_of_the_current_file
" :echo @%   def/my.txt  directory/name of file
" :echo expand('%:t')     my.txt  name of file ('tail')
" :echo expand('%:p')     /abc/def/my.txt     full path
" :echo expand('%:p:h')   /abc/def    directory containing file ('head') 

let g:netrw_liststyle=3


":colorscheme hernan604-no-contrast

"set term=xterm


"TYPE \tt1
:map <leader>tt1  <Esc>:%!perl -e 'my $i=0; while (<STDIN>) {print (($i++).$_)}' %:p<CR>
"TYPE \tt2
:map <leader>tt2  <Esc>:%!perl -e 'my $text = join "", <STDIN>; print "TXT$text"' %:p<CR>

":command Cani :%!caniuse &&getcmdline()

set nomodeline



":r !caniuse 
command! -nargs=+ Caniuse !caniuse <args>

"Example of command using: :Lss -la /
command! -nargs=+ Lss !ls <args>

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline_powerline_fonts = 1
" let g:airline_theme = 'papercolor' 

set laststatus=2

:set background=dark
:colorscheme kalahari_dark_MOD

:set mouse-=a

:set encoding=utf-8
:set fileencoding=utf-8


:map <F2>:source $MYVIMRC<CR>
:map <F3> :set invcursorline<CR>:set invcursorcolumn<CR>:set invnumber<CR>
