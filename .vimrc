" Gotta be first
set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.vimrc
endif
call plug#begin('~/.vim/plugged')

" plugins will go here (see next step)
" (be sure to replace 'Plugin' with 'Plug')
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" ----- Vim as a programmer's text editor -----------------------------
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/syntastic'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'vim-scripts/a.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'Raimondi/delimitMate'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug 'rizzatti/dash.vim'
" Highlight and strip trailing whitespace
Plug 'ntpeters/vim-better-whitespace'
Plug 'Valloric/YouCompleteMe'
autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-sensible'
Plug 'tweekmonster/braceless.vim', { 'for': [ 'python', 'ruby' ] }
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vitalk/vim-shebang' ", { 'for': ['sh', 'zsh', 'csh', 'ash', 'dash', 'ksh', 'pdksh', 'mksh', 'tcsh'] }
Plug 'tianon/vim-docker', { 'for': 'dockerfile' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'fatih/vim-nginx', { 'for': 'nginx' }
Plug 'dietsche/vim-lastplace'
Plug 'mileszs/ack.vim'
Plug 'pearofducks/ansible-vim'
"Plug 'kana/vim-fakeclip'
Plug 'xolox/vim-notes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'myusuf3/numbers.vim'
Plug 'yaroot/vissort'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'sjl/gundo.vim'
Plug 'vim-scripts/Conque-GDB'
Plug 'tpope/vim-dispatch'
call plug#end()


" --- General settings ---
nnoremap gm m
let mapleader = ','
set backspace=indent,eol,start
set ruler
set spell
set relativenumber
set showcmd
set incsearch
set hlsearch
set ignorecase  " Case insensitive search
set smartcase   " Case sensitive when uc present
set number
highlight clear LineNr
set clipboard=unnamed
set autoread  " reload files when changed on disk, i.e. via `git checkout`
set expandtab tabstop=4 softtabstop=4 shiftwidth=4
set encoding=utf-8
syntax on
set autowrite
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
highlight ColorColumn ctermbg=235 guibg=#2c2d27"
let &colorcolumn="80,".join(range(120,999),",")
"set mouse=a
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
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
" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
set background=dark

" Uncomment the next line if your terminal is not configured for solarized
"let g:solarized_termcolors=256

" Set the colorscheme
colorscheme solarized


" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2


" ----- Airline -----
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#branch#displayed_head_limit = 15
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_paste=1
let g:airline_powerline_fonts = 1



" ----- jistr/vim-nerdtree-tabs -----

" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.tags$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
nmap <F2> :NERDTreeTabsToggle<CR>

" ----- scrooloose/syntastic settings -----
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol = "✗"
let g:syntastic_style_error_symbol = "✗="
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "⚠="
let g:syntastic_aggregate_errors = 1
highlight link SyntasticStyleErrorSign Todo
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:syntastic_filetype_map = {
            \ 'jinja': 'html',
            \ 'liquid': 'html',
            \ 'stylus': 'css',
            \ 'scss': 'css',
            \ 'less': 'css'
            \ }

let g:syntastic_id_checkers = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 2



let g:syntastic_python_checkers = ['pylint', 'pep8', 'pydocstyle', 'pep257']
let g:syntastic_html_checkers = ['tidy', 'jshint']
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_go_checkers = ['go', 'golint', 'govet']
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

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" ----- Tagbar -----
nnoremap <silent> <leader>tt :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_type_javascript = { 'ctagsbin' : 'jsctags' }

" ----- xolox/vim-easytags settings -----
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- ctrlp -----
let g:ctrlp_lazy_update = 0

" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

set statusline+=%{fugitive#statusline()} " Git Hotness

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
   au!
   au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
   au FileType tex let b:delimitMate_quotes = ""
   au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
   au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
 augroup END

" ----- AutoFormat -----
nmap <Leader>f ;Autoformat<CR>
augroup AutoFormat
    autocmd BufWrite *.go,*.html :Autoformat
augroup END

" ----- YCM -----
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_python_binary_path = 'python'  " support virtualenv
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_complete_in_comments = 1 " Completion in comments

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

" ------- Ctrlp ---------
let g:ctrlp_working_path_mode = 'ra'
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\.git$\|\.hg$\|\.svn$',
			\ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
let s:ctrlp_fallback = 'ag %s --nocolor -l -g'
let g:ctrlp_user_command = {
			\ 'types': {
			\ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
			\ 2: ['.hg', 'hg --cwd %s locate -I .'],
			\ },
			\ 'fallback': s:ctrlp_fallback
			\ }
nmap <leader>p :CtrlPBuffer<CR>
nmap <Leader>; :CtrlP<CR>
let g:ctrlp_extensions = ['funky']
" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

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
" ------- Ack ------
let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
nmap <leader>a :Ack<space>

" ------- Vim Notes ------
let g:notes_directories = ['~/Dropbox/vim-notes']

"------- Numbers----------"
nnoremap <F3> :NumbersToggle<CR>
"==============================Functions========================================
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
