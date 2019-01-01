function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !python install.py --clang-completer --go-completer --ts-completer
    endif
endfunction


Plug 'tpope/vim-sensible'
Plug  'scrooloose/nerdtree',{'on_cmd': 'NERDTreeToggle'}
Plug  'altercation/vim-colors-solarized'
Plug  'vim-airline/vim-airline'
Plug  'vim-airline/vim-airline-themes'
Plug  'tpope/vim-fugitive' | Plug 'junegunn/gv.vim'
Plug  'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'vim-syntastic/syntastic'
Plug  'sheerun/vim-polyglot'
Plug 'majutsushi/tagbar'
Plug 'fatih/vim-go'
Plug 'airblade/vim-gitgutter'
Plug'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'SirVer/ultisnips'| Plug 'honza/vim-snippets'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-startify'
Plug 'w0rp/ale'
Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tenfyzhong/CompleteParameter.vim'

"YcmCompleter

autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_python_binary_path = 'python'  " support virtualenv


" Syntastic 
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
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 2

let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = 'E'
let g:syntastic_warning_symbol = 'W'
let g:syntastic_style_warning_symbol = 'SW'
let g:syntastic_style_error_symbol = 'SE'
highlight link SyntasticStyleErrorSign Todo

let g:syntastic_python_checkers = ['pylint', 'pycodestyle', 'pydocstyle']
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



" NERDTree 
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

" Tagbar
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
noremap <silent> <Leader>uu :UndotreeToggle<CR>

""" rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
""indent line
"let g:indentLine_leadingSpaceChar='_'
"let g:indentLine_leadingSpaceEnabled=1
let g:indent_guides_start_level = 2


"""CompleteParameter
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>