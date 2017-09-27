" Modeline and Notes {
"   EverVim is a modern & powerful vim distribution
"   Repo URL: https://github.com/LER0ever/EverVim
"   Made by [LER0ever](https://github.com/LER0ever)
"   Licensed under
"       * Apache License, Version 2.0, ([LICENSE-APACHE](LICENSE.md) or http://www.apache.org/licenses/LICENSE-2.0)
" }

" EverVim options {

    " EverVim Bundle Groups
    " Bundle Group name is just folders under ~/.EverVim/plugins
    " Below is the default config, uncomment and make your own
    let g:evervim_bundle_groups=['general', 'appearance', 'writing', 'youcompleteme', 'programming', 'python', 'javascript', 'typescript', 'html', 'css', 'misc', 'go','cpp','bash']

    " Color Theme
    " Use :Colors for a list of available colorschemes
    let g:evervim_color_theme="solarized"
    let g:evervim_airline_theme="solarized"
    "   let g:evervim_light_background = 1

    " Customize Patched Font
    " Pick one at https://github.com/ryanoasis/nerd-fonts
    " By default it's "Knack Nerd Font" on Unix and "Knack NF" on Windows
    "   let g:evervim_font="Knack Nerd Font"
    "   let g:evervim_font_size="12"

    " Disable Patched Font
    "   let g:evervim_no_patched_fonts = 1

    " Automatically changing to open file directory
    " May cause airline to misbehave
    "   let g:evervim_autochdir = 1

    " Default statusline is vim-airline
    " You can change to the more configurable lightline.vim by uncomment the following
    "   let g:evervim_use_lightline = 1

    " Header constants for generating and updating the comment header
    let g:header_field_author = 'Aviv Laufger'
    let g:header_field_author_email = 'aviv.laufer@gmail.com'

    " Leader keys
    "   let g:evervim_leader='\'
    "   let g:evervim_localleader='_'

    " Restore cursor
    " Automatically restore your cursor to the place you left
    " Disable by uncomment the following line.
    "   let g:evervim_no_restore_cursor = 1

    " Fuzzy Finder
    " By default, CtrlP is used on Windows and FZF.vim on Unix
    " Fall back to CtrlP by uncommenting the following line (Unix only)
    "   let g:evervim_use_ctrlp = 1

    " Enable smooth scrolling
    " Use physics-based smooth scrolling for half-page/full-page scrolling
    " Friction and air-drag can be override here
    let g:evervim_smooth_scrolling = 1

    " Disable easier moving in tabs and windows
    " only if you need <C-J> for jumping or other conflicting plugin
    " keybinding
    "   let g:evervim_no_easyWindows = 1

    " Disable wrap relative motion for start/end line motions
    "   let g:evervim_no_wrapRelMotion = 1

    " Disable fast tab navigation
    "   let g:evervim_no_fastTabs = 1

    " Enable NerdTree Sync across tabs
    " Synchronize view and focus between different tabs
    "   let g:evervim_nerdtree_tabs_sync = 1

    " Clear search highlighting
    "   let g:evervim_clear_search_highlight = 1

    " Disable neosnippet expansion
    " This maps over <C-k> and does some Supertab
    " emulation with snippets
    "   let g:evervim_no_neosnippet_expand = 1

    " Disable whitespace stripping
    "   let g:evervim_keep_trailing_whitespace = 1

    " vim files directory
    "   let g:evervim_consolidated_directory = <full path to desired directory>
    "   eg: let g:evervim_consolidated_directory = $HOME . '/.vim/'

    " This makes the completion popup strictly passive.
    " Keypresses acts normally. <ESC> takes you of insert mode, words don't
    " automatically complete, pressing <CR> inserts a newline, etc. Iff the
    " menu is open, tab will cycle through it. If a snippet is selected, <C-k>
    " expands it and jumps between fields.
    "   let g:evervim_noninvasive_completion = 1

    " Don't turn conceallevel or concealcursor
    "   let g:evervim_no_conceal = 1

    " For some colorschemes, autocolor will not work (eg: 'desert', 'ir_black')
    " Indent guides will attempt to set your colors smartly. If you
    " want to control them yourself, do it here.
    "   let g:indent_guides_auto_colors = 0
    "   autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121 ctermbg=233
    "   autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=234

    " Leave the default font and size in GVim
    " To set your own font, do it from ~/.vimrc.local
    "   let g:evervim_no_big_font = 1

    " Disable  omni complete
    "   let g:evervim_no_omni_complete = 1

    " Prefer indentguides
    "   let g:evervim_use_indentguides = 1

    " Prefer Neoformat
    "   let g:evervim_use_neoformat = 1

    " Disable autoformat
    " You can still use <Leader>fm to manually format the file
    "   let g:evervim_no_autoformat = 1

    " Hybrid Linenumber
    let g:evervim_hybrid_linenumber = 1

    " 80 Column Warning
    " Shows a magenta line at column 81 only for those lines that exceeds 80
    let g:evervim_80_column_warning = 1

    " Don't create default mappings for multicursors
    " See :help multiple-cursors-mappings
    "   let g:multi_cursor_use_default_mapping=0
    "   let g:multi_cursor_next_key='<C-n>'
    "   let g:multi_cursor_prev_key='<C-p>'
    "   let g:multi_cursor_skip_key='<C-x>'
    "   let g:multi_cursor_quit_key='<Esc>'
    " Require a special keypress to enter multiple cursors mode
    "   let g:multi_cursor_start_key='+'

    " Mappings for editing/applying evervim config
    "   let g:evervim_edit_config_mapping='<leader>ev'
    "   let g:evervim_apply_config_mapping='<leader>sv'
    autocmd FileType markdown set conceallevel=0
    nnoremap <Space> za
    let g:syntastic_python_checkers = ['pylint', 'pycodestyle', 'pydocstyle','pep8', 'pep257']
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
    nmap <leader>ack :<space>
    " EasyTags {{{
    set cpoptions+=d
    let g:easytags_file = '~/.vim/.vimtags'
    let g:easytags_events = ['BufReadPost', 'BufWritePost']
    let g:easytags_dynamic_files = 2
    let g:easytags_async = 1
    let g:easytags_resolve_links = 1
    let g:easytags_suppress_report = 1
    nmap <leader>ack <Plug>(FerretAckWord)
    " " }}}"
    " }}}

" }

