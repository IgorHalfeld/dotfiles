" Auto install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"# All plugins
call plug#begin()

" Interface
Plug 'eemed/sitruuna.vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'cseelus/vim-colors-lucid'
Plug 'ayu-theme/ayu-vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" NERDTree
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'scrooloose/nerdcommenter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', {'on': 'NERDTreeToggle'}

" Languages
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml'] }
Plug 'pangloss/vim-javascript'
Plug 'ruanyl/vim-fixmyjs'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'ap/vim-css-color', {'for': ['css', 'scss']}
Plug 'jparise/vim-graphql'
Plug 'evanleck/vim-svelte'


" Other
"Plug 'easymotion/vim-easymotion'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"# Plugin configs
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-vetur',
      \ 'coc-json',
      "\ 'coc-flutter',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-yaml',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-jest',
      \ 'coc-pairs'
      \ ]

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_def_mode='godef'

let g:NERDTreeShowHidden = 1
let g:NERDTreeQuitOnOpen = 0

let g:palenight_terminal_italics=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint']
let g:ale_fix_on_save = 1

" Dart configs
let g:lsc_auto_map = v:true
let dart_html_in_string = v:true
let g:dart_format_on_save = 1
let g:dart_style_guide = 2

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_fmt_autosave = 1

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--vimgrep --smart-case', <bang>0)
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"# Mappings
let mapleader="\<space>"

"map <Leader> <Plug>(easymotion-prefix)
noremap <c-b> :NERDTreeToggle<cr>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

noremap <leader>f :Fixmyjs<cr>
noremap <leader>p :Files<cr>
noremap <leader>b :Buffers<cr>
noremap <leader><S-p> :Ag<cr>

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position
" Coc only does snippet and additional edit on confirm
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Emmet
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
  \  'javascript' : {
  \      'extends' : 'jsx',
  \  },
  \  'typescript' : {
  \      'extends' : 'jsx',
  \  },
  \}

let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

"# Vim configs

set background=dark
set termguicolors
"set t_Co=256
"set t_ut=
"colorscheme palenight 
"colorscheme gruvbox
"colorscheme lucid
colorscheme material

let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'

hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi htmlArg gui=italic
hi Comment gui=italic
hi Type    gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic
hi Special  cterm=italic
hi ErrorMsg  cterm=italic
"colorscheme lucid
"colorscheme nord
"colorscheme atom-dark
"colorscheme gruvbox

"let g:gruvbox_italic=1
"let g:gruvbox_bold=1

autocmd BufEnter * call ncm2#enable_for_buffer()
command! CleanReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

set nocompatible
set ttyfast
set lazyredraw

set norelativenumber
set title
set mouse=a
set clipboard+=unnamedplus
set path+=$(pwd)/**
set encoding=UTF-8
set sts=2
set ts=2
set smartindent
set autoindent
set splitbelow
set splitright
set sw=2
set ignorecase
set smartcase
set ruler
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set completeopt=noinsert,menuone,noselect
set expandtab
set tabstop=2
set shiftwidth=2
set title
set list
set listchars=eol:¬,tab:▸-
set cursorline
set nowrap
set hidden
set number
set inccommand=split
set foldmethod=indent " Use decent folding
set foldlevelstart=50 " Files open expanded
set autoread
set updatetime=300
set t_ZH=^[[3m
set t_ZR=^[[23m
