"----------------------------------------------
" Plugin management
"
" Download vim-plug from the URL below and follow the installation
" instructions:
" https://github.com/junegunn/vim-plug
"----------------------------------------------
call plug#begin()

" General plugins
"Plug 'Shougo/deoplete.nvim', {'do': ': UpdateRemotePlugins', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html', 'c', 'cpp', 'objc', 'python']} 
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'SirVer/ultisnips' " Ultisnips Track the engine.
Plug 'honza/vim-snippets' " Ultisnips Snippets are separated from the engine. Add this if you want them

Plug 'dyng/ctrlsf.vim'      " better text search

Plug 'terryma/vim-expand-region' " change visual selection by using '+' / '-'
Plug 'andymass/vim-matchup' " extends vim's % key to language-specific words instead of just single characters

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree' , { 'on': 'NERDTreeToggle' }

" Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy search file
Plug 'junegunn/fzf.vim'
"
"Plug 'fatih/vim-go' , { 'for': 'go', 'do': ':GoUpdateBinaries' } " GOLANG support
"Plug 'deoplete-plugins/deoplete-go', { 'do': 'make', 'for': 'go'} "GOLANG support
"
"" Syntax Highlighting And Indentation For 100+ Languages
Plug 'sheerun/vim-polyglot'
"
"Plug 'zchee/deoplete-jedi' , { 'for': 'python' } " автокомплет для Python

"Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx']}
"Plug 'carlitux/deoplete-ternjs' , { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'neomake/neomake' , { 'on': 'Neomake', 'for': ['javascript', 'javascript.jsx'] }
"
Plug 'prettier/vim-prettier', {'do': 'npm install','for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

"color preview for vim
Plug 'gko/vim-coloresque',{'for': ['javascript', 'typescript', 'css', 'less', 'scss',  'markdown', 'vue', 'html'] }

"Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp', 'objc'] }
"Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp', 'objc'] }
"
" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

"showing different levels of parentheses in different color
Plug 'luochen1990/rainbow'

" Colorschemes
Plug 'chriskempson/base16-vim'

"Plug 'ryanoasis/vim-devicons'

call plug#end()

"----------------------------------------------
" General settings
"----------------------------------------------
"
set number                        " show number ruler
set cursorline                    " highlight the current line for the cursor
"set nospell                       " disable spelling
set spelllang=en,ru
set guioptions-=T
"let g:pymode_python = 'python3'
set clipboard+=unnamedplus
"Удалим задержку при переключении режимов редактора:
set timeoutlen=1000 ttimeoutlen=0
"ramap russian simbols
set keymap=russian-jcukenwin
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set fileencodings=utf-8,cp1251,koi8-r,cp866
" Press F12 to switch to UTF-8 encoding
nnoremap <F12> :e ++enc=utf-8<CR>
set iminsert=0
set imsearch=0  "Чтобы английский в Insert и в Search был по умолчанию, а не заменился русским
"Установим настройки сворачивания блоков кода:
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set autochdir " change dir to current file's dir

" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
"set completeopt+=noselect

" Enable mouse if possible
if has('mouse')
    set mouse=a
endif

" delete without yanking
nnoremap D "_D
nnoremap <leader>d "_d
vnoremap <leader>d "_d
nnoremap <leader>dd "_dd

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

" change without yanking
nnoremap C "_C
nnoremap c "_c
vnoremap c "_c
nnoremap cc "_cc

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <F3> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"----------------------------------------------
" Colors
"----------------------------------------------

"let base16colorspace=256
colorscheme base16-default-dark
"colorscheme base16-default-light
"colorscheme base16-gruvbox-light-soft

set termguicolors
"highlight lCursor guifg=NONE guibg=Cyan
"highlight Cursor guifg=white guibg=black
highlight iCursor guifg=red guibg=black
set guicursor=n-v-c:block-Cursor
"set guicursor+=i:ver50-Cursor
"set guicursor+=n-v-c:blinkon0
"set guicursor+=i:blinkon10

nnoremap <F8> :colorscheme base16-gruvbox-light-soft<CR>
nnoremap <Leader><F8> :colorscheme base16-default-dark<CR>

"----------------------------------------------
" Plugin: Shougo/deoplete.nvim
"----------------------------------------------
 " Enable deoplete on startup
"let g:deoplete#enable_at_startup = 1

" Disable deoplete when in multi cursor mode
"function! Multiple_cursors_before()
    "let b:deoplete_disable_auto_complete = 1
"endfunction
"function! Multiple_cursors_after()
    "let b:deoplete_disable_auto_complete = 0
"endfunction
       "function g:Multiple_cursors_before()
         "call deoplete#custom#buffer_option('auto_complete', v:false)
       "endfunction
       "function g:Multiple_cursors_after()
         "call deoplete#custom#buffer_option('auto_complete', v:true)
       "endfunction

    "call deoplete#custom#option({
    "\ 'check_stderr' : v:false,
    "\ })

"----------------------------------------------
" Plugin: zchee/deoplete-go
"----------------------------------------------
" deoplete-go settings
"let g:deoplete#sources#go#gocode_binary = '/home/mad/Dropbox/projects/go/bin/gocode'
"let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" Automatically insert dot after package name
"let g:deoplete#sources#go#package_dot = 1
"let g:deoplete#sources#go#cgo = 1
" Enable completing of go pointers
"let g:deoplete#sources#go#pointer = 1

"call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

"----------------------------------------------
" Plugin: zchee/deoplete-clang
"----------------------------------------------
"let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
"----------------------------------------------
" Plugin: zchee/deoplete-clang
"----------------------------------------------
"let g:clang_format#style_options = {
            "\ "AccessModifierOffset" : -4,
            "\ "AllowShortIfStatementsOnASingleLine" : "true",
            "\ "AlwaysBreakTemplateDeclarations" : "true",
            "\ "Standard" : "C++11"}

"" map to <Leader>cf in C++ code
"autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
"autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
""autocmd FileType c,cpp,objc ClangFormatAutoEnable

"----------------------------------------------
" Plugin: zchee/deoplete-js
"----------------------------------------------
""" Set bin if you have many instalations
""let g:deoplete#sources#ternjs#tern_bin = '/lib/node_modules/tern/bin/tern'
""let g:deoplete#sources#ternjs#timeout = 1
"" Whether to include the types of the completions in the result data. Default: 0
"let g:deoplete#sources#ternjs#types = 1
"" Whether to use a case-insensitive compare between the current word and 
"" potential completions. Default 0
"let g:deoplete#sources#ternjs#case_insensitive = 1
""
""" Whether to include JavaScript keywords when completing something that is not 
"" a property. Default: 0
"let g:deoplete#sources#ternjs#include_keywords = 1
""Add extra filetypes
""let g:deoplete#sources#ternjs#filetypes = [
		""\ 'jsx',
		""\ 'javascript.jsx',
		""\ 'vue'
		""\ ]

""let g:deoplete#enable_ignore_case = 1
""let g:deoplete#enable_smart_case = 1
""let g:deoplete#enable_camel_case = 1
""let g:deoplete#enable_refresh_always = 1
""let g:deoplete#max_abbr_width = 0
""let g:deoplete#max_menu_width = 0
""let g:deoplete#omni#input_patterns = get(g:,’deoplete#omni#input_patterns’,{})

""let g:tern_request_timeout = 1
""let g:tern_request_timeout = 6000
"let g:tern#command = ["tern"]
"let g:tern#arguments = ["--persistent"]
"----------------------------------------------
" Plugin: neomake/neomake
"----------------------------------------------
"let g:neomake_javascript_enabled_makers = ['eslint']

"----------------------------------------------
" Language: Golang
"----------------------------------------------
"  https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt
"
"let g:go_info_mode = 'guru'
"
"Automatically discards/add import path based on the code
let g:go_imports_autosave = 1

" Enable syntax highlighting per default
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1

let g:go_term_enabled = 1

"" Fix for location list when vim-go is used together with Syntastic
let g:go_list_type = "quickfix"

"" Set whether the JSON tags should be snakecase or camelcase.
let g:go_addtags_transform = "camelcase"

"" Show type information
let g:go_auto_type_info = 1

 "Highlight variable uses
"let g:go_auto_sameids = 1

"----------------------------------------------
" vim-go Mappings
"----------------------------------------------
"  https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt
augroup vg
au FileType go nmap <Leader>gb :GoBuild<CR>
" au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
au FileType go nmap <Leader>cr :GoCallers<CR>
au FileType go nmap <Leader>ce :GoCallees<CR>
au FileType go nmap <Leader>? :GoCoverageToggle<CR>
"au FileType go nmap <Leader>D :GoDefPop<CR>
au FileType go nmap <Leader>i :GoInstall<CR>
"au FileType go nmap <Leader>p :GoPlay<CR>
au FileType go nmap <Leader>' :GoDocBrowser<CR>
"au FileType go nmap <leader>gt :GoDeclsDir<cr>
"au FileType go nmap <Leader>b :GoToggleBreakpoint<CR>
au FileType go nmap <Leader>db :GoDebug<CR>
au FileType go nmap <Leader>e :Refactor extract
au FileType go nmap <Leader>rt <Plug>(go-run-tab)
au FileType go nmap <Leader>rs <Plug>(go-run-split)
au FileType go nmap <Leader>rv <Plug>(go-run-vertical)

" synced with emacs
au FileType go nmap <Leader>,, :GoAlternate<CR>
au FileType go nmap <Leader>T :GoTestFunc
au FileType go nmap <Leader>t :GoTest
"au FileType go nmap <Leader>r :GoReferrers<CR>
au FileType go nmap <Leader>cp :GoChannelPeers<CR>
"au FileType go nmap <Leader>d :GoDef<CR>
au FileType go nmap <Leader>k :GoInfo<CR>
au FileType go nmap <C-n> :cnext<CR>
au FileType go nmap <C-m> :cprevious<CR>
au FileType go nmap <Leader>j :GoAddTags json<CR>:GoAddTags json,omitempty<CR>
au FileType go nmap <Leader>b :GoAddTags bson<CR>:GoAddTags bson,omitempty<CR>
au FileType go nmap <Leader>gf :GoFillStruct<CR>

augroup END


" jump to next/prev vim-go error:
" nnoremap <C-j> :cn<CR>
" nnoremap <C-k> :cp<CR>

"nnoremap <Leader>. :TagbarToggle<CR>

"----------------------------------------------
" Language: Python
"----------------------------------------------
"" Path to python interpreter for neovim
"let g:python3_host_prog = '/usr/bin/python'

"let g:deoplete#sources#jedi#show_docstring = 1
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4


"----------------------------------------------
" Status line start
"----------------------------------------------
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

hi User1 guifg=#eea040 guibg=#222222
hi User2 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222
" statusline end


"----------------------------------------------
" Plugin: scrooloose/nerdtree
"----------------------------------------------
nnoremap <F2> :NERDTreeToggle<cr>

" Files to ignore
let NERDTreeIgnore = [
    \ '\~$',
    \ '\.pyc$',
    \ '^\.DS_Store$',
    \ '^node_modules$',
    \ '^.ropeproject$',
    \ '^__pycache__$'
\]

" Close vim if NERDTree is the only opened window.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show hidden files by default.
let NERDTreeShowHidden = 1

" Allow NERDTree to change session root.
let g:NERDTreeChDirMode = 2


"----------------------------------------------
" Plugin: 'junegunn/fzf.vim'
"----------------------------------------------
nnoremap <c-p> :FZF<cr>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

"----------------------------------------------
" Navigation
"----------------------------------------------

" Move between buffers with Shift + arrow key...
nnoremap <S-Left> :bprevious<cr>
nnoremap <S-Right> :bnext<cr>
"
" Switching tabs quickly
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

nnoremap <C-left> :tabprevious<CR>
nnoremap <C-right> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <leader>w :tabclose<CR>

"----------------------------------------------
" search with CtrlSF
"----------------------------------------------
nnoremap <C-f> "_:CtrlSF 
let g:ctrlsf_winsize = '100'
let g:ctrlsf_case_sensitive = 'no'
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_ignore_dir = ['node_modules', '.git', 'deps']
if executable('rg')
  let g:ctrlsf_ackprg = 'rg' " use ripgrep
  let g:ctrlsf_extra_backend_args = {
    \ 'rg': '--hidden'
    \ }
endif

let g:ctrlsf_auto_close = {
    \ "normal" : 0,
    \ "compact": 0
    \}
let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }

"----------------------------------------------
" Plugin: Ultisnips
"----------------------------------------------
let g:UltiSnipsListSnippets="<A-tab>"


" -------------------------------------------------------------------------------------------------
" Plugin: coc.nvim default settings
" -------------------------------------------------------------------------------------------------
"  https://github.com/neoclide/coc.nvim/tree/d5fdd2438119f2a82f6bda681642f246af2f0361
"

"" if hidden is not set, TextEdit might fail.
"set hidden
"" Better display for messages
"set cmdheight=2
"" Smaller updatetime for CursorHold & CursorHoldI
"set updatetime=300
"" don't give |ins-completion-menu| messages.
"set shortmess+=c
"" always show signcolumns
"set signcolumn=yes

"" Use tab for trigger completion with characters ahead and navigate.
"" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()

"" Use `[c` and `]c` to navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)

"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gt <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)

"" Use U to show documentation in preview window
"nnoremap <silent> U :call <SID>show_documentation()<CR>
"function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  "else
    "call CocAction('doHover')
  "endif
"endfunction


"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

""" Add (Neo)Vim's native statusline support.
""" NOTE: Please see `:h coc-status` for integrations with external plugins that
""" provide custom statusline: lightline.vim, vim-airline.
""set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


"" Remap for format selected region
"vmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>f  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" -------------------------------------------------------------------------------------------------
" Plugin: Prettier https://github.com/prettier/vim-prettier
" -------------------------------------------------------------------------------------------------
"nmap <Leader>py <Plug>(Prettier)
" Max line length that prettier will wrap on: a number or 'auto' (use
" textwidth).
" default: 'auto'
let g:prettier#config#print_width = 'auto'

" number of spaces per indentation level: a number or 'auto' (use
" softtabstop)
" default: 'auto'
let g:prettier#config#tab_width = 2

" use tabs instead of spaces: true, false, or auto (use the expandtab setting).
" default: 'auto'
let g:prettier#config#use_tabs = 'false'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown or empty string
" (let prettier choose).
" default: ''
let g:prettier#config#parser = ''

" cli-override|file-override|prefer-file
" default: 'file-override'
let g:prettier#config#config_precedence = 'file-override'

" always|never|preserve
" default: 'preserve'
let g:prettier#config#prose_wrap = 'preserve'

" css|strict|ignore
" default: 'css'
let g:prettier#config#html_whitespace_sensitivity = 'css'

" false|true
" default: 'false'
let g:prettier#config#require_pragma = 'false'

" #SIGNIFY {{{
" Check for only Git
let g:signify_vcs_list = [ 'git' ]
" }}}

" RAINBOW {{{
let g:rainbow_active = 1
" }}}
