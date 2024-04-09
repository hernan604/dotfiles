set nomodeline


" ####### https://github.com/gmarik/Vundle.vim ########### BEGIN
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
"Plugin 'tpope/vim-fugitive'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'https://github.com/justinmk/vim-syntax-extra.git'
"Plugin 'pangloss/vim-javascript'
Plugin 'airblade/vim-gitgutter'
Plugin 'catppuccin/nvim'
"Plugin 'sjl/gundo.vim'
"Plugin 'jlanzarotta/bufexplorer'
"Plugin 'xolox/vim-colorscheme-switcher'
"Plugin 'xolox/vim-misc'
Plugin 'mattn/emmet-vim'
call vundle#end()



"filetype plugin indent on    " required

:syntax on
:set softtabstop=2
:set shiftwidth=2
:set tabstop=2
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




:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

:set hls
set smartindent
set wildmenu
:set nocp "freebsd set nocp
:set statusline=%<%f\ %y[%{&ff}]%m%r%w%a\ %=%l/%L,%c%V\ %P

autocmd! bufwritepost .vimrc source % "autorestart vim settings when vimrc is changed

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
:map <leader>jb  <Esc>:%!js_beautify.pl %:p<CR>
let g:netrw_liststyle=3

set nomodeline
set laststatus=2
:set background=dark
set backspace=2
:colorscheme kalahari_dark_MOD
:set mouse-=a
:set encoding=utf-8
:set fileencoding=utf-8


:map <F2>:source $MYVIMRC<CR>
:map <F3> :set invcursorline<CR>:set invcursorcolumn<CR>:set invnumber<CR>

highlight ColorColumn ctermbg=255
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=3
    autocmd WinLeave * set colorcolumn=0
augroup END
:set noautoread

" uses F2 to reload vimrc
:map <F5>:source $MYVIMRC<CR>

" uses F3 to toggle: cursorline cursorcolumn and number
:map <F3> :set invcursorline<CR>:set invcursorcolumn<CR>

:map <s-F6> :set norelativenumber<CR>:set nonumber<CR>
:map <F6> :set relativenumber<CR>:set number<CR>


:hi CustomPink ctermbg=205 guibg=hotpink guifg=black ctermfg=black
:hi CustomRed ctermbg=124 guibg=hotpink guifg=black ctermfg=black
:hi CustomYellow ctermbg=50 guibg=hotpink guifg=black ctermfg=black
:hi CustomBold cterm=bold ctermfg=200

:call matchadd('CustomPink', '\<undefined\>')
:call matchadd('CustomPink', 'TODO')
:call matchadd('CustomPink', 'FROM')
:call matchadd('CustomPink', 'SELECT')
:call matchadd('CustomRed', '\t')

" this is to highlight filenames under __DATA__  (get_data_section)
:call matchadd('CustomYellow', '^@@ .\+')
:call matchadd('CustomYellow', '__DATA__\|__FILE__\|__PACKAGE__\|__END__')
:call matchadd('CustomBold', ']\|[\|''\|"\|,\|{\|}\|||\|!\|++\|==\|/\|\.\|;\|=>\|->\|::\|--\|\\\|(\|)')

":call matchadd('CustomRed', '   ')
:call matchadd('CustomYellow', '\s\+$')

:map <F4> :if exists("g:syntax_on") <Bar>
   \   syntax off <Bar>
   \ else <Bar>
   \   syntax enable <Bar>
   \ endif <CR>

set term=xterm-256color

