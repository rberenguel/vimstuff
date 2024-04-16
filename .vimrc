if hostname() !~# "Mac-mini"
  autocmd VimEnter * call ForceWorkingFont()
endif
autocmd BufEnter *.txt if &filetype == 'help' | wincmd T | endif

set backspace=indent,eol,start

set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

function ForceWorkingFont()
    ifont set 'Victor Mono' -s 20
endfunction

set number relativenumber
set splitbelow
set splitright
set hlsearch
set incsearch
set laststatus=2
set ruler
set history=100
set autoindent

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
set ttimeout
set ttimeoutlen=1
set ttyfast

syntax on
if hostname() !~# "Mac-mini"
  colorscheme PaperColor "solarized cyberduck ayu
else
  highlight Normal guibg=black
endif
nnoremap ` :UndotreeToggle<CR>

" Window management plugins
let g:win_ext_command_map = {"\<cr>": 'Win#exit'}
nmap <C-Return> <Plug>DWMFocus
nmap <C-e> <Plug>DWMGrowMaster
nmap <C-h> <Plug>DWMShrinkMaster

" Buffer and window jumping
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <Leader>t :CtrlPBuffer<Cr>
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" Tab stuff
ca tn tabnew
ca th tabp
ca tl tabn

" Nananananana
let mapleader = "\<Space>" 

" Visual niceties
set background=dark
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
let g:airline_powerline_fonts = 1
let g:limelight_conceal_guifg = '#555555'
let g:goyo_width = 60
let g:indent_guides_enable_on_vim_startup = 1
let g:rainbow#max_level = 16

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"augroup rainbows
"  autocmd!
"  autocmd FileType * RainbowParenthesesActivate
"augroup END
"
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight! | AirlineRefresh
nmap <C-g> :Goyo 60<CR>

"""" Completion stuff
set complete=k,.

"set dictionary=~/misc/english-words.95
let s:path = expand('<sfile>:p:h')
let s:p5 = 'v/d/p5'
let s:glsl = 'v/d/glsl'

autocmd FileType javascript let &l:dictionary = s:p5
autocmd FileType glsl let &l:dictionary = s:glsl

" Minimalist-AutoCompletePop-Plugin

" Omit autocompletion not found messages
set shortmess+=c
set completeopt+=menuone
set completeopt+=noselect
set completeopt+=noinsert
set completeopt-=preview

autocmd InsertCharPre * call AutoComplete()
fun! AutoComplete()
    if v:char =~ '\K'
        \ && getline('.')[col('.') - 4] !~ '\K'
        \ && getline('.')[col('.') - 3] =~ '\K'
        \ && getline('.')[col('.') - 2] =~ '\K' " last char
        \ && getline('.')[col('.') - 1] !~ '\K'

        call feedkeys("\<C-P>", 'n')
    end
endfun
"

" Markdown stuff
let g:vim_markdown_folding_disabled = 1
"let g:vim_markdown_conceal = 0
"set conceallevel=0
let g:markdown_mapping_switch_status = 'C-d'


filetype plugin on       " may already be in your .vimrc

" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1
