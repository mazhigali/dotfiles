call plug#begin()
"Plug 'fatih/vim-go' " Удивительное сочетание функций. GOLANG
"Plug 'godoctor/godoctor.vim' " Некоторые инструменты рефакторинга
Plug 'Shougo/deoplete.nvim', {'do': ': UpdateRemotePlugins'} 
"Plug 'zchee/deoplete-go', {' build ': {' unix ':' make '}} 
"Plug 'jodosha/vim-godebug' " Интеграция отладчика через delve 
"Plug 'ctrlpvim/ctrlp.vim'          " CtrlP is installed to support tag finding in vim-go
"Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
"Plug 'chriskempson/vim-tomorrow-theme'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
call plug#end()

" Get the defaults that most users want.
"
"let base16colorspace=256
colorscheme base16-default-dark
set termguicolors
set number                        " show number ruler
set cursorline                    " highlight the current line for the cursor
"set nospell                       " disable spelling
set spelllang=en,ru
"colorscheme desert
"colorscheme Tomorrow-Night
set guioptions-=T
"let g:pymode_python = 'python3'
set clipboard+=unnamedplus
"Удалим задержку при переключении режимов редактора:
set timeoutlen=1000 ttimeoutlen=0
"ramap russian simbols
set keymap=russian-jcukenwin
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set fileencodings=utf-8,cp1251,koi8-r,cp866
set iminsert=0
set imsearch=0  "Чтобы английский в Insert и в Search был по умолчанию, а не заменился русским
highlight lCursor guifg=NONE guibg=Cyan
"Установим настройки сворачивания блоков кода:
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set autochdir " change dir to current file's dir

" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

" Enable mouse if possible
if has('mouse')
    set mouse=a
endif

" change without yanking
nnoremap c "_c
vnoremap c "_c

"----------------------------------------------
" Plugin: zchee/deoplete-go
"----------------------------------------------
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#go#gocode_binary = '/home/mad/Dropbox/projects/go/bin/gocode'
"let g:deoplete#sources#go#package_dot = 1
"let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
"let g:deoplete#sources#go#cgo = 1

"inoremap _expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
"let g:completor_auto_trigger = 0
"let g:completor_gocode_binary = "/home/mad/Dropbox/projects/go/bin/gocode"

"----------------------------------------------
" Language: Golang
"----------------------------------------------
" Run goimports when running gofmt
"let g:go_fmt_command = "goimports"

" Enable syntax highlighting per default
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_types = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_fields = 1

"let g:go_term_enabled = 1

"" Fix for location list when vim-go is used together with Syntastic
"let g:go_list_type = "quickfix"

" Set whether the JSON tags should be snakecase or camelcase.
"let g:go_addtags_transform = "camelcase"

"" Show type information
"let g:go_auto_type_info = 1

"let g:go_info_mode = 'gocode'

"" Highlight variable uses
"let g:go_auto_sameids = 1

"----------------------------------------------
" vim-go keyv
"----------------------------------------------
augroup vg
"au FileType go nmap <Leader>b :GoBuild<CR>
"" au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
"au FileType go nmap <Leader>cr :GoCallers<CR>
"au FileType go nmap <Leader>ce :GoCallees<CR>
"au FileType go nmap <Leader>? :GoCoverageToggle<CR>
"au FileType go nmap <Leader>D :GoDefPop<CR>
"au FileType go nmap <Leader>v :GoImplements<CR>
"au FileType go nmap <Leader>I :GoImports<CR>
"au FileType go nmap <Leader>i :GoInstall<CR>
"au FileType go nmap <Leader>p :GoPlay<CR>
"au FileType go nmap <Leader>' :GoDocBrowser<CR>
"au FileType go nmap <leader>gt :GoDeclsDir<cr>
"au FileType go nmap <Leader>b :GoToggleBreakpoint<CR>
"au FileType go nmap <Leader>db :GoDebug<CR>
"au FileType go nmap <Leader>e :Refactor extract
"au FileType go nmap <Leader>rt <Plug>(go-run-tab)
"au FileType go nmap <Leader>rs <Plug>(go-run-split)
"au FileType go nmap <Leader>rv <Plug>(go-run-vertical)

"" synced with emacs
"au FileType go nmap <Leader>,, :GoAlternate<CR>
"au FileType go nmap <Leader>T :GoTestFunc
"au FileType go nmap <Leader>t :GoTest
"au FileType go nmap <Leader>r :GoReferrers<CR>
"au FileType go nmap <Leader>cp :GoChannelPeers<CR>
"au FileType go nmap <Leader>d :GoDef<CR>
"au FileType go nmap <Leader>k :GoInfo<CR>
"au FileType go nmap <C-n> :cnext<CR>
"au FileType go nmap <C-m> :cnext<CR>

augroup END


" jump to next/prev vim-go error:
" nnoremap <C-j> :cn<CR>
" nnoremap <C-k> :cp<CR>

nnoremap <Leader>. :TagbarToggle<CR>
nnoremap <Leader>d "_d

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
"nnoremap <leader>d :NERDTreeToggle<cr>
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


"----------------------------------------------
" Navigation
"----------------------------------------------

" Move between buffers with Shift + arrow key...
nnoremap <S-Left> :bprevious<cr>
nnoremap <S-Right> :bnext<cr>
