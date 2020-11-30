
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	" Package Manager
	Plugin 'VundleVim/Vundle.vim'
	" UltiSnips Engine
	Plugin 'SirVer/ultisnips'
	" Extend Conceal Future of Vim for LaTex
	Plugin 'KeitaNakamura/tex-conceal.vim'
	" Async Syntax Check
	Plugin 'dense-analysis/ale'
	" Status Line
	Plugin 'itchyny/lightline.vim'
	" Function to provide name of git branch
	Plugin 'itchyny/vim-gitbranch' 
	" Highlights matching tags
	Plugin 'gregsexton/MatchTag'
	" Indent guides
	Plugin 'nathanaelkane/vim-indent-guides'
	" Vim colorscheme
	Plugin 'rafi/awesome-vim-colorschemes'
	" JS highlight
	Plugin 'yuezk/vim-js'
	" JSX higlight
	Plugin 'maxmellon/vim-jsx-pretty'
call vundle#end()

" Config ultisnips 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:tex_flavor="latex"
let g:UltiSnipsSnippetDirectories=["mysnippets"]

" Config tex-conceal
set conceallevel=0
let g:tex_conceal='abdmg'
" hi Conceal ctermbg=Green	

" Config ale
let g:ale_fix_on_save=0
let g:ale_sign_error='❌'
let g:ale_sign_warning='⚠️'
let g:ale_linters={
\	'javascript': ['eslint', 'prettier'],
\	'latex': ['chktex']
\}
let g:ale_set_highlights=1
" highlight ALEWarning ctermbg=0
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" Config lightline
set laststatus=2 
let g:lightline={
\	'colorscheme': 'PaperColor',
\	 'active': {
\ 		'left': [ [ 'mode', 'paste' ],
\			  [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\ 	},
\	'component_function': {
\		'gitbranch': 'gitbranch#name'
\	},
\}

" Config JSX highlight
let g:vim_jsx_pretty_colorful_config = 1

" Colorscheme
colorscheme PaperColor
set background=light

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=white guibg=white
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=gray guibg=gray

" General Vim Options
syntax on
set nu
set colorcolumn=80
set cursorline
filetype plugin on
filetype indent off 
highlight ColorColumn ctermbg=darkcyan
highlight LineNr ctermfg=172 ctermbg=darkgray
set noshowmode
set shortmess+=F
set backspace=indent,eol,start
set wildmenu
set hlsearch
set scrolloff=5
set linebreak
set tabstop=2
set shiftwidth=2
set autoindent
set textwidth=80

" Netrw options
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 3

" Set the title of the Terminal to the currently open file
function! SetTerminalTitle()
    let titleString = expand('%:t')
    if len(titleString) > 0
        let &titlestring = expand('%:t')
        " this is the format iTerm2 expects when setting the window title
        let args = "\033];".&titlestring."\007"
        let cmd = 'silent !echo -e "'.args.'"'
        execute cmd
        redraw!
    endif
endfunction
autocmd BufEnter * call SetTerminalTitle()

" Treat ejs files html
autocmd BufNewFile,BufRead *.ejs set filetype=html

