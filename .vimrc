" Plugins {{{
" Init vim-plug {{{
set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
"}}}

" Sane defaults {{{
Plug 'tpope/vim-sensible'
Plug 'svermeulen/vim-easyclip'
"}}}
" Colors {{{
Plug 'altercation/vim-colors-solarized'
"}}}


" Languages {{{
" Indent {{{
Plug 'tweekmonster/braceless.vim', { 'for': [ 'python', 'ruby' ] }
"}}}
" HTML {{{
Plug 'tmhedberg/matchit', { 'for': 'html' }
Plug 'othree/html5.vim', { 'for': 'html' }
"}}}
" Templates {{{
Plug 'lepture/vim-jinja', { 'for': 'jinja' }
Plug 'tpope/vim-liquid', { 'for': 'liquid' }
"}}}
" CSS {{{
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
"}}}
" Javascript {{{
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': ['json', 'javascript'] }
"}}}
" Python {{{
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
"}}}
" Ruby {{{
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
"}}}
" Go {{{
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"}}}
" sh,bash,zsh {{{
Plug 'vitalk/vim-shebang' ", { 'for': ['sh', 'zsh', 'csh', 'ash', 'dash', 'ksh', 'pdksh', 'mksh', 'tcsh'] }
"}}}
" Docker {{{
" Plug 'ekalinin/Dockerfile.vim'
Plug 'tianon/vim-docker', { 'for': 'dockerfile' }
"}}}
" Markdown {{{
Plug 'godlygeek/tabular', { 'for': 'markdown' }  " plasticboy dependency
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
"}}}
" Nginx {{{
Plug 'fatih/vim-nginx', { 'for': 'nginx' }
"}}}
Plug 'pearofducks/ansible-vim'
"}}}
"}}}

" Everything else {{{
Plug 'Chiel92/vim-autoformat'
Plug 'bkad/CamelCaseMotion'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-dispatch'
Plug 'henrik/vim-indexed-search'
Plug 'Konfekt/FastFold'
Plug 'wincent/ferret'
Plug 'Valloric/ListToggle'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'xolox/vim-misc' | Plug 'xolox/vim-easytags'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'rizzatti/dash.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'ntpeters/vim-better-whitespace'
Plug 'farmergreg/vim-lastplace'
"}}}

function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !python install.py --gocode-completer --tern-completer
        " !python install.py --gocode-completer --tern-completer --clang-completer --system-libclang
    endif
endfunction
" load YCM on first insert command
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif
"}}}

" Finish Init vim-plug {{{
call plug#end()
filetype plugin indent on
" "}}}
" "}}}
" " Options {{{
" " Colors {{{
" " Uncomment the next line if your terminal is not configured for solarized
" "let g:solarized_termcolors=256
set background=dark
colorscheme solarized
" "}}}
" " Spaces {{{
set expandtab tabstop=4 softtabstop=4 shiftwidth=4
" "}}}
" " Status Line {{{
set shortmess=atI
set noshowmode
" "}}}
" " Ignored {{{
set wildignore+=*.swp,.git/,*.jpg,*.jpeg,*.png,*.gif,*.psd,*.pdf,\.DS_Store,\.empty
set wildignore+=*.pyc,*.pyo,*.egg,*.egg-info
set wildignore+=*.a,*.o,*.so
set wildignore+=*.class
"}}}
" " Keys {{{
let mapleader=","
cabbrev vhelp vert help
"
inoremap jk <Esc>
inoremap jj <Esc>
"
nnoremap j gj
nnoremap k gk
"
nnoremap <silent> <C-j> <C-W>j
nnoremap <silent> <C-k> <C-W>k
nnoremap <silent> <C-h> <C-W>h
nnoremap <silent> <C-l> <C-W>l
"
nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>"
" }}}
" }}}
" Searching {{{
set smartcase
set ignorecase
set gdefault
set wildmode=list:longest
if exists('&wildignorecase') | set wildignorecase | endif
"}}}
" Format {{{
set nowrap
set linebreak
set textwidth=79
set relativenumber
set number
set matchtime=3
set nolist
set nosmartindent
set cindent
syntax sync minlines=256
set lazyredraw
set ttyfast
" directorys
function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        " To specify a different directory in which to place the vimbackup,
        " vimviews, vimundo, and vimswap files/directories, add the following to
        " your .vimrc.before.local file:
            let common_dir = parent . '/.' . prefix


        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
"
"
augroup Format-Options
    autocmd!
    autocmd BufEnter * setlocal formatoptions=crqn2l1j
augroup END

" Set color column per file type.
function! ColorColumnPerFileType()
    call clearmatches()
    let langs = ["python","ruby"]
    if index(langs, &filetype) >= 0 | call matchadd('ColorColumn', printf('\%%%dv', &textwidth+1), -1) | endif
endfunc

" Set new/old regexp engine per file type.
function! RegExpEnginePerFileType()
    call clearmatches()
    let langs = ["go"]
    if index(langs, &filetype) >= 0 | set regexpengine=1 | else | set regexpengine=0 | endif
endfunc

" Set maximum syntax color column.
function! SynMaxColPerFileType()
    let langs = ["go"]
    if index(langs, &filetype) >= 0 | set synmaxcol=1000 | else | set synmaxcol=3000 | endif
endfunc
"}}}

" Folding {{{
set foldenable
if &diff | set foldmethod=diff | else | set foldmethod=syntax | endif
set foldlevel=0
set foldopen=block,hor,tag,percent,mark,quickfix
let g:SimpylFold_docstring_preview=1
nnoremap <Space> za
function! FoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2)
    let fillcharcount = windowwidth - len(line)

    return line . repeat(" ", fillcharcount)
endfunction " }}}
set foldtext=FoldText()
"}}}

" Bells {{{
set novisualbell
"}}}
" Misc. {{{
set nostartofline
set splitbelow splitright
set hidden
set title
set ruler
set encoding=utf8
highlight ColorColumn ctermbg=235 guibg=#2c2d27"
let &colorcolumn="80,".join(range(120,999),",")
"fix keys "
 command! -bang -nargs=* -complete=file E e<bang> <args>
 command! -bang -nargs=* -complete=file W w<bang> <args>
 command! -bang -nargs=* -complete=file Wq wq<bang> <args>
 command! -bang -nargs=* -complete=file WQ wq<bang> <args>
 command! -bang Wa wa<bang>
 command! -bang WA wa<bang>
 command! -bang Q q<bang>
 command! -bang QA qa<bang>
 command! -bang Qa qa<bang>
"}}}
" Languages {{{
" sh,bash,zsh {{{
let g:sh_fold_enabled = 3
let g:zsh_fold_enable = 1
let g:is_bash=1
"}}}
"}}}
"}}}


" Plugin configurations {{{
" Airline {{{
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
"let g:airline_symbols_ascii = 1
let g:airline_detect_modified = 1
"let g:airline#extensions#branch#displayed_head_limit = 15
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"}}}
" Autoformat {{{
nmap <Leader>f :Autoformat<CR>
let g:formatters_go = "goimports"
" "}}}
" }}}

" Braceless {{{
let g:braceless_line_continuation = 0
"}}}
" Buffergator {{{
let g:buffergator_suppress_keymaps = 1
noremap <silent> <Leader>b :BuffergatorToggle<CR>
let g:buffergator_viewport_split_policy = 'B'
let g:buffergator_hsplit_size = 5
let g:buffergator_sort_regime = 'mru'
"}}}
" Camelcase motion {{{
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
"}}}
"
" EasyAlign {{{
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
" "}}}
" }}}
" EasyClip {{{
set clipboard=unnamed
let g:EasyClipShareYanks = 1
let g:EasyClipShareYanksDirectory = '$HOME/.vim'
nmap M <Plug>MoveMotionEndOfLinePlug
" "}}}
" }}}
" EasyTags {{{
set cpoptions+=d
let g:easytags_file = '~/.vim/.vimtags'
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_dynamic_files = 2
let g:easytags_async = 1
let g:easytags_resolve_links = 1
let g:easytags_suppress_report = 1
" }}}
" Ferret {{{
let g:FerretMap = 0
nmap <leader>sr  <Plug>(FerretAckWord)
" "}}}
" }}}
" Vim-Go {{{
let g:go_template_autocreate = 0
" let g:go_list_height = 10
let g:go_dispatch_enabled = 1
let g:go_guru_tags = 'integration'
let g:go_def_reuse_buffer = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 0
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']

let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 0
augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>bg :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
" let g:go_highlight_types = 1
"}}}
" ListToggle {{{
let g:lt_height = 10
"}}}
" NERDTree {{{
let NERDChristmasTree = 1
let NERDTreeShowHidden = 1
let NERDTreeChDirMode = 0
let NERDTreeShowFiles = 1
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = [
            \ '.DS_Store', '\.swp$', '\~$', '.empty',
            \ '\.jpg$', '\.jpeg$', '\.png$', '\.gif$', '\.pdf$',
            \ '\.class$',
            \ '\.a$', '\.o$', '\.so$',
            \ '\.pyc$', '\.pyo$',
            \ '\.tags$'
            \ ]

noremap <silent> <Leader>n :NERDTreeToggle<CR>
"}}}
" Python {{{
let python_slow_sync = 1
let python_highlight_indent_errors = 0
let python_highlight_space_errors = 0
let python_highlight_all = 1
"}}}
" Repeat {{{
silent! call repeat#set("\<Plug>.", v:count)
"}}}
" Signify {{{
let g:signify_vcs_list = [ 'git' ]
"}}}
" Sneak {{{
highlight link SneakPluginTarget Visual

map ; <Plug>SneakNext

nmap <leader>s <Plug>Sneak_s
nmap <leader>S <Plug>Sneak_S
xmap <leader>s <Plug>Sneak_s
xmap <leader>S <Plug>Sneak_S
omap <leader>s <Plug>Sneak_s
omap <leader>S <Plug>Sneak_S

nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T
"}}}
" Syntastic {{{
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:syntastic_filetype_map = {
            \ 'jinja': 'html',
            \ 'liquid': 'html',
            \ 'stylus': 'css',
            \ 'scss': 'css',
            \ 'less': 'css'
            \ }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_id_checkers = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1

let g:syntastic_error_symbol = "✗"
let g:syntastic_style_error_symbol = "✗="
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "⚠="
highlight link SyntasticStyleErrorSign Todo
let g:syntastic_aggregate_errors = 1

let g:syntastic_python_checkers = ['pylint', 'pycodestyle', 'pydocstyle','pep8', 'pep257']
let g:syntastic_html_checkers = ['tidy', 'jshint']
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

let g:syntastic_c_compiler_options = '-ansi -Wall -Wextra'
let g:syntastic_cpp_compiler_options = '-Wall -Wextra -Weffc++'
let g:syntastic_c_include_dirs = [ 'includes', 'include', 'inc',  'headers' ]
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_cpp_check_header = g:syntastic_c_check_header
let g:syntastic_cpp_include_dirs = g:syntastic_c_include_dirs
let g:syntastic_cpp_auto_refresh_includes = g:syntastic_c_auto_refresh_includes
let g:syntastic_cpp_remove_include_errors = g:syntastic_c_remove_include_errors
"}}}
" Tagbar {{{
nnoremap <silent> <leader>tt :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1

let g:tagbar_type_javascript = { 'ctagsbin' : 'jsctags' }
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : 'markdown2ctags',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
"}}}
" Tern {{{
let g:tern#command = ['tern', '--no-port-file']
let g:tern_show_signature_in_pum = 1
let g:tern_show_argument_hints = 'on_move'
"}}}
" YouCompleteMe - YCM {{{
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_python_binary_path = 'python'  " support virtualenv
nmap <leader>ac :Ack<space>
" Call YCM/Go/js GoTo depending on file type.
function! GoToDef()
    if &ft == 'go'
        execute 'GoDef'
    elseif &ft == 'javascript'
        execute 'TernDef'
    else
        execute 'YcmCompleter GoTo'
    endif
endfunction
nnoremap <leader>] :call GoToDef()<CR>
"}}}

" Autocmds {{{
" BufWinEnter {{{
augroup Buf-Win-Enter
    autocmd!
    autocmd BufWinEnter * call ColorColumnPerFileType() | call RegExpEnginePerFileType() | call SynMaxColPerFileType()
    autocmd BufWinEnter *.less setfiletype less
    autocmd BufWinEnter *.sql setfiletype mysql
    autocmd BufWinEnter *.tfstate setfiletype json
    autocmd BufWinEnter *.zsh-theme setfiletype zsh
    autocmd BufWinEnter *.rules setfiletype conf
    autocmd BufWinEnter .jshintrc setfiletype javascript
    autocmd BufWinEnter .tern-config,.tern-project setfiletype json
augroup END
"}}}
" BufWrite {{{
augroup AutoFormat
    autocmd BufWrite *.go :Autoformat
    " don't format json if filetype is jinja
    " autocmd BufWrite *.json if &ft !~? 'jinja' | :Autoformat | endif
augroup END
"}}}
" FileType {{{
augroup MiscSettings
    autocmd!
    autocmd FileType * set tags=./.tags;,~/.vim/.vimtags
    autocmd FileType python,ruby BracelessEnable +indent
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType go |
                \ nmap <leader>c <Plug>(go-test-compile) |
                \ nmap <leader>m <Plug>(go-metalinter)
    autocmd FileType html,json,xml,jinja,liquid,css,scss,less,stylus,ruby,yaml,gitcommit,nginx,hcl setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType html,xml,jinja,liquid runtime! macros/matchit.vim
    autocmd FileType qf setlocal wrap
    autocmd FileType scss,less,stylus setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType tex setlocal number norelativenumber
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup CommentStrings
    autocmd FileType conf setlocal commentstring=#\ %s
    autocmd FileType jinja setlocal commentstring={#\ %s\ #}
    autocmd FileType xdefaults setlocal commentstring=!\ %s
    autocmd FileType gohtmltmpl setlocal commentstring={{/*\ %s\ */}}
    autocmd FileType nginx setlocal commentstring=#\ %s
augroup END
"}}}
"}}}
"}}}
" GitGutter {{{
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

set statusline+=%{fugitive#statusline()} " Git Hotness
"}}}
