set nocompatible
let mapleader=","
" Init vim-plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
"}}}

"  Plugs {{{
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Chiel92/vim-autoformat'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'luochen1990/rainbow'
Plug 'terryma/vim-multiple-cursors'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  ['NERDTreeToggle', 'NERDTreeTabsToggle'] }
Plug 'cohama/agit.vim'
Plug 'mhinz/vim-signify'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-dispatch'
Plug 'Shougo/vimproc.vim', {'do' : 'make'} " needed by vim-vebugger
Plug 'idanarye/vim-vebugger'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'altercation/vim-colors-solarized'
Plug 'WolfgangMehner/bash-support'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/c.vim'
Plug 'vim-scripts/a.vim'
Plug 'peterhoeg/vim-qml'
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'
Plug 'hail2u/vim-css3-syntax'
Plug 'wavded/vim-stylus'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeTabsToggle'] }
Plug 'jistr/vim-nerdtree-tabs', { 'on':  ['NERDTreeToggle', 'NERDTreeTabsToggle'] }
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'tpope/vim-repeat'
Plug 'simeji/winresizer'
Plug 'wesQ3/vim-windowswap'
Plug 'Konfekt/FastFold'
Plug 'rhysd/conflict-marker.vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
Plug 'vim-scripts/sessionman.vim'
Plug 'tmhedberg/matchit'
Plug 'jlanzarotta/bufexplorer'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'osyo-manga/vim-over'
Plug 'kien/tabman.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'osyo-manga/vim-over'
Plug 'kien/tabman.vim'
Plug 'Yggdroot/indentLine'
Plug 'farmergreg/vim-lastplace'
Plug 'yuttie/comfortable-motion.vim'
Plug 'tpope/vim-abolish'
Plug 'jamessan/vim-gnupg'
Plug 'osyo-manga/vim-over'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'gcmt/wildfire.vim'
Plug 'ap/vim-css-color'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'
Plug 'digitaltoad/vim-pug'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim'
Plug 'briancollins/vim-jst'
Plug 'kchmck/vim-coffee-script'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'ElmCast/elm-vim'
Plug 'flowtype/vim-flow'
Plug 'python-mode/python-mode', {'branch': 'develop'}
Plug 'yssource/python.vim'
Plug 'vim-scripts/python_match.vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'plasticboy/vim-markdown' ", {'for': 'markdown'}
Plug 'cespare/vim-toml'
Plug 'vimwiki/vimwiki'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-textobj-quote'
Plug 'reedes/vim-wordy'
Plug 'tyru/open-browser.vim'
Plug 'kannokanno/previm'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'sotte/presenting.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py  --tern-completer' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


Plug 'christoomey/vim-tmux-navigator'
Plug 'rizzatti/dash.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tianon/vim-docker', { 'for': 'dockerfile' }
Plug 'pearofducks/ansible-vim'
Plug 'xolox/vim-misc' | Plug 'xolox/vim-easytags'
Plug 'wincent/ferret'
Plug 'tpope/vim-unimpaired'
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'
" }}}
" Finish Init vim-plug {{{
call plug#end()
"}}}


set nocompatible
filetype plugin indent on 
syntax on
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set clipboard=unnamed
" Setting up the directories {
    set backup                  " Backups are nice ...
    if has('persistent_undo')
        set undofile                " So is persistent undo ...
        set undolevels=1000         " Maximum number of changes that can be undone
        set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
    endif
" }s
" " Colors {{{
" " Uncomment the next line if your terminal is not configured for solarized
" "let g:solarized_termcolors=256
set background=dark
colorscheme solarized
let g:airline_theme="solarized"
let g:airline#extensions#tabline#enabled = 1
" "}}}

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
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set pastetoggle=<F12>           "  pastetoggle (sane indentation on pastes)
set autoread                    " Automatically reload if file is changed externally
set nostartofline
set title
set ruler
set showmatch
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
highlight ColorColumn ctermbg=235 guibg=#2c2d27"
let &colorcolumn="80,".join(range(120,999),",")
set laststatus=2
" }}}



" " Keys {{{
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
vnoremap <c-]> g<c-]>
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>

 let g:C_MapLeader = '\'
" }}}
" }}}

"Devicon {{{
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeLimitedSyntax = 1
"    }}}

"startify {{{
let g:startify_files_number = 10
    let g:startify_list_order = [
                \ ['   [MRU] Most Recently Used files:'],
                \ 'files',
                \ ['   [MRU] in current directory:'],
                \ 'dir',
                \ ['   [CMD] Common Commands:'],
                \ 'commands',
                \ ['   Sessions:'],
                \ 'sessions',
                \ ['   Bookmarks:'],
                \ 'bookmarks',
                \ ]
"}}}
" Folding {{{
set foldenable
if &diff | set foldmethod=diff | else | set foldmethod=syntax | endif
set foldlevel=0
set foldopen=block,hor,tag,percent,mark,quickfix
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
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zfs
"}}}
"FZF" {{{
    " fzf drop down
    let g:fzf_layout = { 'down': '~40%' }

    " fzf mappings
    nnoremap <Leader>.f :Files<CR>
    nnoremap <Leader>.l :Lines<CR>
    nnoremap <Leader>.t :Tags<CR>
    nnoremap <Leader>.b :Buffers<CR>
    nnoremap <Leader>.c :Commands<CR>
    nnoremap <Leader>.w :Windows<CR>
    nnoremap <Leader>.a :Ag<CR>
    nnoremap <Leader>.g :GitFiles<CR>
    nnoremap <Leader>.o :Locate<Space>
    nnoremap <Leader>.m :Maps<CR>
    nnoremap <Leader>.h :History<CR>
    nnoremap <Leader>.s :Snippets<CR>
    nnoremap <Leader>.i :Commits<CR>
    nnoremap <Leader>.r :Colors<CR>
    nnoremap <Leader>.e :Helptags<CR>
    nnoremap <Leader>..c :BCommits<CR>
    nnoremap <Leader>..t :BTags<CR>
    nnoremap <Leader>..l :BLines<CR>

    " CtrlP compatibility
    nnoremap <C-P> :Files<CR>

    nmap <Leader>z <Leader>.

    
    " Command override (with preview)
    command! -bang -nargs=? -complete=dir Files
                \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
    command! -bang -nargs=* Ag
                \ call fzf#vim#ag(<q-args>,
                \                 <bang>0 ? fzf#vim#with_preview('up:60%')
                \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
                \                 <bang>0)


"}}}
"VimWiki {{{
let g:vimwiki_folding = 'syntax'
nmap <Leader>vww <Plug>VimwikiIndex
nmap <Leader>vwti <Plug>VimwikiTabIndex
nmap <Leader>vws <Plug>VimwikiUISelect
nmap <Leader>vwi <Plug>VimwikiDiaryIndex
nmap <Leader>vwd <Plug>VimwikiMakeDiaryNote
nmap <Leader>vwtd <Plug>VimwikiTabMakeDiaryNote
nmap <Leader>vwyd <Plug>VimwikiMakeYesterdayDiaryNote
nmap <Leader>vwg <Plug>VimwikiDiaryGenerateLinks
map <Leader>vwe :Vimwiki2HTML<CR>
map <Leader>vwb :Vimwiki2HTMLBrowse<CR>
"}}}
augroup NoSimultaneousEdits
    autocmd!
    autocmd SwapExists * let v:swapchoice = 'o'
    autocmd SwapExists * echohl ErrorMsg
    autocmd SwapExists * echo 'EverVim: Duplicate session, opening read-only ...'
    autocmd SwapExists * echohl None
    autocmd SwapExists * sleep 2
augroup END


" Initialize directories {{{
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
    "   let g:evervim_consolidated_directory = <full path to desired directory>
    "   eg: let g:evervim_consolidated_directory = $HOME . '/.vim/'
    if exists('g:evervim_consolidated_directory')
        let common_dir = g:evervim_consolidated_directory . prefix
    else
        let common_dir = parent . '/.' . prefix
    endif

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
" }}}

" Initialize NERDTree as needed {{{
function! NERDTreeInitAsNeeded()
    redir => bufoutput
    buffers!
    redir END
    let idx = stridx(bufoutput, "NERD_tree")
    if idx > -1
        NERDTreeMirror
        NERDTreeFind
        wincmd l
    endif
endfunction
" }}}
"{{{
let g:NERDShutUp=1
" map <C-e> <plug>NERDTreeTabsToggle<CR>
map <F3> :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeToggle<CR>
let g:NERDTreeWinSize=30
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
if !exists('g:evervim_nerdtree_tabs_sync')
    let g:nerdtree_tabs_open_on_new_tab=0
    let g:nerdtree_tabs_synchronize_view=0
endif
let NERDTreeMapOpenRecursively='<C-O>'

" NerdTree git integration
let g:NERDTreeIndicatorMapCustom = {
                \ "Modified"  : "±",
                \ "Staged"    : "⊕",
                \ "Untracked" : "⊱",
                \ "Renamed"   : "➜",
                \ "Unmerged"  : "═",
                \ "Deleted"   : "⋈",
                \ "Dirty"     : "✗",
                \ "Clean"     : "✓",
                \ 'Ignored'   : '∅',
                \ "Unknown"   : "?"
                \ }
let g:NERDTreeShowIgnoredStatus = 1
""}}}
"{{{vim-go
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_fmt_command = "goimports"
    let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
    au FileType go nmap <Leader>ls <Plug>(go-implements)
    au FileType go nmap <Leader>ln <Plug>(go-info)
    au FileType go nmap <Leader>li <Plug>(go-install)
    au FileType go nmap <Leader>le <Plug>(go-rename)
    au FileType go nmap <leader>lr <Plug>(go-run)
    au FileType go nmap <leader>lb <Plug>(go-build)
    au FileType go nmap <leader>lt <Plug>(go-test)
    au FileType go nmap <Leader>ld <Plug>(go-doc)
    au FileType go nmap <leader>lc <Plug>(go-coverage)
"}}}
"{{{synntastic
    let g:syntastic_python_checkers = ['pylint', 'pycodestyle', 'pydocstyle','pep8', 'pep257']
    let g:syntastic_javascript_checkers = ['jshint']
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
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go']  }

    let g:go_template_autocreate = 0
    let g:go_list_height = 10
    let g:go_dispatch_enabled = 1
    let g:go_guru_tags = 'integration'
    let g:go_def_reuse_buffer = 1
    let g:go_fmt_command = "goimports"
    let g:go_fmt_autosave = 0
    let g:go_autodetect_gopath = 1
    let g:go_list_type = "quickfix"
    "
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

""}}}
"{{{Tabular
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :T, { 'on':  ['NERDTreeToggle', 'NERDTreeTabsToggle'] }abularize /&<CR>
    nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    nmap <Leader>a=> :Tabularize /=><CR>
    vmap <Leader>a=> :Tabularize /=><CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a,, :Tabularize /,\zs<CR>
    vmap <Leader>a,, :Tabularize /,\zs<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

"}}}
"{{{fugitive
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gr :Gread<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>ge :Gedit<CR>
    " Mnemonic _i_nteractive
    nnoremap <silent> <leader>gi :Git add -p %<CR>
    nnoremap <silent> <leader>gg :SignifyToggle<CR>
    set statusline+=%{fugitive#statusline()} " Git Hotness
""}}}
"{{{python

let g:pymode_trim_whitespaces = 0
let g:pymode_options = 0
let python_slow_sync = 1
let python_highlight_indent_errors = 0
let python_highlight_space_errors = 0
let python_highlight_all = 1
let g:pymode_rope = 0

""}}}
""{{{ tern
"enable keyboard shortcuts
let g:tern_map_keys=1
""show argument hints
let g:tern_show_argument_hints='on_hold'"
""}}}
""{{{ycm
    let g:acp_enableAtStartup = 0

    " enable completion from tags
    let g:ycm_collect_identifiers_from_tags_files = 1

    " load ycm global config
    let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

    " YouCompleteMe keymap
    let g:ycm_key_detailed_diagnostics = '<leader>yd'

    " YcmCompleter GoTo keymap
    nnoremap <leader>ygd :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>ydc :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>ygt :YcmCompleter GoTo<CR>

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

    " Haskell post write lint and check with ghcmod
    " $ `cabal install ghcmod` if missing and ensure
    " ~/.cabal/bin is in your $PATH.
    if !executable("ghcmod")
        autocmd BufWritePost *.hs GhcModCheckAndLintAsync
    endif

    " For snippet_complete marker.
    if !exists("g:evervim_no_conceal")
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif
    endif

    " Disable the neosnippet preview candidate window
    " When enabled, there can be too much visual noise
    " especially when splits are used.
    set completeopt-=preview

    " Enable markdown autocomplete and snippet
    " by removing it from default blacklist
    let g:ycm_filetype_blacklist = {
                \ 'tagbar' : 1,
                \ 'qf' : 1,
                \ 'notes' : 1,
                \ 'unite' : 1,
                \ 'text' : 1,
                \ 'vimwiki' : 1,
                \ 'pandoc' : 1,
                \ 'infolog' : 1,
                \ 'mail' : 1
                \}

    let g:UltiSnipsEditSplit="vertical"

    " remap Ultisnips for compatibility for YCM
    let g:UltiSnipsExpandTrigger = "<Leader><Tab>"
    let g:UltiSnipsJumpForwardTrigger = "<Tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
""}}}
    " EasyTags {{{
    set cpoptions+=d
    let g:easytags_file = '~/.vim/.vimtags'
    let g:easytags_events = ['BufReadPost', 'BufWritePost']
    let g:easytags_dynamic_files = 2
    let g:easytags_async = 1
    let g:easytags_resolve_links = 1
    let g:easytags_suppress_report = 1
 "}}}"
"{{{ misc plugins
let g:signify_vcs_list = [ 'git', 'hg', 'svn', 'fossil' ]
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
nnoremap <leader>tt :TagbarToggle<CR>
let g:tagbar_width = 30
noremap <Leader>fm :Autoformat<CR>
nnoremap <leader>dd :Dispatch<CR>
nnoremap <leader>dm :Make<CR>
let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 2.0
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:over_command_line_prompt = "IncReplace > "
map <Leader>sr :OverCommandLine<CR>%s/
let b:match_ignorecase = 1
let g:tabman_toggle = '<leader>tm'
let g:tabman_focus  = '<leader>tf'
nnoremap <Leader>ut :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle=1
let g:undotree_WindowLayout=3
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
let g:lastplace_ignore_buftype = "quickfix"
nnoremap <silent> <leader>wsm :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>wsd :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>wss :call WindowSwap#EasyWindowSwap()<CR>
let g:winresizer_start_key = '<Leader>re'
nnoremap <Leader>ga :Agit<CR>
let g:agit_max_log_lines = 1000
autocmd filetype agit_diff setlocal nofoldenable
let g:indentLine_color_term = 156
let g:rainbow_active = 0 "1 if you want to enable it on vim sstart
nnoremap <Leader>rb :RainbowToggle<CR>
nmap <leader>sl :SessionList<CR>    
nmap <leader>ss :SessionSave<CR>
nmap <leader>sc :SessionClose<CR>
nmap <Leader>wg :Goyo<CR>
    augroup textobj_quote
        autocmd!
        autocmd FileType markdown call textobj#quote#init()
        autocmd FileType textile call textobj#quote#init()
        autocmd FileType text call textobj#quote#init({'educate': 0})
    augroup END
    augroup textobj_sentence
      autocmd!
      autocmd FileType markdown call textobj#sentence#init()
      autocmd FileType textile call textobj#sentence#init()
      autocmd FileType text call textobj#sentence#init()
    augroup END
    let g:vim_markdown_frontmatter = 1
    let g:vim_markdown_toml_frontmatter = 1
    let g:vim_markdown_math = 1
    let g:vim_markdown_toc_autofit = 1
    let g:vim_markdown_fenced_languages = ['csharp=cs', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'toml=toml']
    let g:vim_markdown_autowrite = 1
    let g:vim_markdown_no_extensions_in_markdown = 1
    let g:vim_markdown_conceal = 0
    let g:vim_markdown_folding_style_pythonic = 1
    nmap <leader>a <Plug>(FerretAckWord)
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    nnoremap <Leader>to :Tocv<CR>
    nmap <silent> ./ :nohlsearch<CR>

"}}}
