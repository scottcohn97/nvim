"{ Plugin installation
"{{ Vim-plug Install and related settings

" Auto-install vim-plug on different systems if it does not exist.
" For Windows, only Windows 10 with curl installed are supported (after
" Windows 10 build 17063, source: http://tinyurl.com/y23972tt).
" The following script to install vim-plug is adapted from vim-plug
" wiki: https://github.com/junegunn/vim-plug/wiki/tips#tips
let g:VIM_PLUG_PATH = expand(g:nvim_config_root . '/autoload/plug.vim')
if executable('curl')
    if empty(glob(g:VIM_PLUG_PATH))
        echomsg 'Installing Vim-plug on your system'
        silent execute '!curl -fLo ' . g:VIM_PLUG_PATH . ' --create-dirs '
            \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

        augroup plug_init
            autocmd!
            autocmd VimEnter * PlugInstall --sync | quit |source $MYVIMRC
        augroup END
    endif
else
    echoerr 'You have to install curl to install vim-plug, or install '
            \ . 'vim-plug by yourself.'
    finish
endif

" Set up directory to install the plugins based on whether you are installing
" neovim system wide or for personal use.
if g:nvim_system_wide
    let g:PLUGIN_HOME="/usr/local/share/nvim/site"
else
    let g:PLUGIN_HOME=expand(stdpath('data') . '/plugged')
endif
"}}

"{{ Autocompletion related plugins
call plug#begin(g:PLUGIN_HOME)
" Auto-completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Python source for deoplete
Plug 'zchee/deoplete-jedi'

" Vim source for deoplete
Plug 'Shougo/neco-vim', { 'for': 'vim' }

" Insert mode completion
Plug 'ervandew/supertab'

" ncm-R
Plug 'gaalcaras/ncm-R'

"}}

"{{ Python-related plugins
" Python completion, goto definition etc.
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

" Python syntax highlighting and more
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Python indent (follows the PEP8 style)
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
"}}

"{{ R-related plugins

" Nvim-R
Plug 'jalvesaq/Nvim-R', { 'for' : 'r' } 

" based on ultisnips
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2'

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

Plug 'roxma/nvim-yarp'

" linting 
Plug 'w0rp/ale'

"}}


"{{ Search related plugins
" Super fast movement with vim-sneak
Plug 'justinmk/vim-sneak'

" Improve vim incsearch, clear search highlight automatically
Plug 'haya14busa/is.vim'
Plug 'PeterRincker/vim-searchlight'

" Show match number for incsearch
Plug 'osyo-manga/vim-anzu'

" Stay after pressing * and search selected text
Plug 'haya14busa/vim-asterisk'

" File search, tag search and more
if g:is_win
    Plug 'Yggdroot/LeaderF'
else
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
endif

" Another similar plugin is command-t
" Plug 'wincent/command-t'

" Another grep tool (similar to Sublime Text Ctrl+Shift+F)
" Plug 'dyng/ctrlsf.vim'

" A greping tool
" Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

" install plugin :: using vim-plug
Plug 'rizzatti/dash.vim'

" fzf 
Plug 'junegunn/fzf'

"}}

"{{ UI: Color, theme etc.
" A list of colorscheme plugin
Plug 'lifepillar/vim-gruvbox8'
Plug 'srcery-colors/srcery-vim'
" Plug 'sjl/badwolf'
" Plug 'ajmwagar/vim-deus'
" Plug 'sainnhe/vim-color-desert-night'
" Plug 'YorickPeterse/happy_hacking.vim'
" Plug 'lifepillar/vim-solarized8'
" Plug 'sickill/vim-monokai'
" Plug 'whatyouhide/vim-gotham'
" Plug 'rakr/vim-one'
" Plug 'kaicataldo/material.vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'voronianski/oceanic-next-color-scheme'
" Plug 'mhartington/oceanic-next'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

if !exists('g:started_by_firenvim')
    " colorful status line and theme
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'mhinz/vim-startify'
endif
"}}

"{{ Plugin to deal with URL
" Highlight URLs inside vim
Plug 'itchyny/vim-highlighturl'

" For Windows and Mac, we can open an URL in the browser. For Linux, it may
" not be possible since we maybe in a server which disables GUI.
if g:is_win || g:is_mac
    " open URL in browser
    Plug 'tyru/open-browser.vim'
endif
"}}

"{{ Navigation and tags plugin
" File explorer for vim
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

" Only install these plugins if ctags are installed on the system
if executable('ctags')
    " plugin to manage your tags
    Plug 'ludovicchabant/vim-gutentags'
    " show file tags in vim window
    Plug 'majutsushi/tagbar', { 'on': ['TagbarToggle', 'TagbarOpen'] }
endif
"}}

"{{ File editting plugin
" Snippet engine and snippet template
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Automatic insertion and deletion of a pair of characters
Plug 'jiangmiao/auto-pairs'

" Comment plugin
Plug 'tpope/vim-commentary'

" Multiple cursor plugin like Sublime Text?
" Plug 'mg979/vim-visual-multi'

" Title character case
Plug 'christoomey/vim-titlecase'

" Autosave files on certain events
Plug '907th/vim-auto-save'

" graphcial undo history, see https://github.com/mbbill/undotree
Plug 'mbbill/undotree'

" another plugin to show undo history is: http://tinyurl.com/jlsgjy5
" Plug 'simnalamburt/vim-mundo'

" Manage your yank history
if g:is_win || g:is_mac
    Plug 'svermeulen/vim-yoink'
endif

" Show marks in sign column for quicker navigation
Plug 'kshenoy/vim-signature'

" Another good plugin to show signature
" Plug 'jeetsukumaran/vim-markology'

" Handy unix command inside Vim (Rename, Move etc.)
Plug 'tpope/vim-eunuch'

" Repeat vim motions
Plug 'tpope/vim-repeat'

" Show the content of register in preview window
" Plug 'junegunn/vim-peekaboo'

" IME toggle for Mac
if g:is_mac
    Plug 'rlue/vim-barbaric'
endif
"}}

"{{ Linting, formating
" Syntax check and make
" Plug 'neomake/neomake'

" Another linting plugin
Plug 'dense-analysis/ale'

" Auto format tools
Plug 'sbdchd/neoformat', { 'on': 'Neoformat' }
" Plug 'Chiel92/vim-autoformat'
"}}

"{{ Git related plugins
" Show git change (change, delete, add) signs in vim sign column
Plug 'mhinz/vim-signify'
" Another similar plugin
" Plug 'airblade/vim-gitgutter'

" Git command inside vim
Plug 'tpope/vim-fugitive', {'on': ['Gstatus']}

" Git commit browser
Plug 'junegunn/gv.vim', { 'on': 'GV' }
"}}

"{{ Plugins for markdown writing
" Distraction free writing
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

" Only light on your cursor line to help you focus
Plug 'junegunn/limelight.vim', {'for': 'markdown'}

" Markdown syntax highlighting
Plug 'vim-pandoc/vim-pandoc-syntax'

" Another markdown plugin
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Faster footnote generation
Plug 'vim-pandoc/vim-markdownfootnotes', { 'for': 'markdown' }

" Vim tabular plugin for manipulate tabular, required by markdown plugins
Plug 'godlygeek/tabular', {'on': 'Tabularize'}

" Markdown JSON header highlight plugin
Plug 'elzr/vim-json', { 'for': ['json', 'markdown'] }

" Markdown previewing (only for Mac and Windows)
if g:is_win || g:is_mac
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
endif

" RMarkdown support 'https://github.com/vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-rmarkdown'
" emoji
" Plug 'https://gitlab.com/gi1242/vim-emoji-ab'
Plug 'fszymanski/deoplete-emoji', {'for': 'markdown'}
"}}

"{{ Text object plugins
" Additional powerful text object for vim, this plugin should be studied
" carefully to use its full power
Plug 'wellle/targets.vim'

" Plugin to manipulate characer pairs quickly
Plug 'tpope/vim-surround'

" Add indent object for vim (useful for languages like Python)
Plug 'michaeljsmith/vim-indent-object'
"}}

"{{ LaTeX editting and previewing plugin
" Only use these plugin on Windows and Mac and when LaTeX is installed
if ( g:is_win || g:is_mac ) && executable('latex')
    " vimtex use autoload feature of Vim, so it is not necessary to use `for`
    " keyword of vim-plug to try to lazy-load it,
    " see http://tinyurl.com/y3ymc4qd
    Plug 'lervag/vimtex'
    Plug 'matze/vim-tex-fold', {'for': 'tex'}
    Plug 'Konfekt/FastFold'
    Plug 'KeitaNakamura/tex-conceal.vim', {'for' : 'tex'}
endif
"}}

"{{ Tmux related plugins
" Since tmux is only available on Linux and Mac, we only enable these plugins
" for Linux and Mac
if (g:is_linux || g:is_mac) && executable('tmux')
    " Let vim detect tmux focus event correctly, see
    " http://tinyurl.com/y4xd2w3r and http://tinyurl.com/y4878wwm
    Plug 'tmux-plugins/vim-tmux-focus-events'

    " .tmux.conf syntax highlighting and setting check
    Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
endif
"}}

"{{ HTML related
Plug 'mattn/emmet-vim'
"}}

"{{ Misc plugins
" Automatically toggle line number based on several conditions
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Highlight yanked region
Plug 'machakann/vim-highlightedyank'

" Modern matchit implementation
Plug 'andymass/vim-matchup'

" Simulating smooth scroll motions with physcis
Plug 'yuttie/comfortable-motion.vim'

Plug 'tpope/vim-scriptease'

" Asynchronous command execution
Plug 'skywind3000/asyncrun.vim'
" Another asynchronous plugin
" Plug 'tpope/vim-dispatch'
Plug 'cespare/vim-toml'

" Edit text area in browser using nvim
if g:is_mac || g:is_win
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
endif

" Debugger plugin
if g:is_mac || g:is_linux
    Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
endif
call plug#end()
"}}
"}

"{ Plugin settings
"{{ Vim-plug settings
" Use shortnames for common vim-plug command to reduce typing.
" To use these shortcut: first activate command line with `:`, then input the
" short alias, e.g., `pi`, then press <space>, the alias will be expanded
" to the full command automatically
call utils#Cabbrev('pi', 'PlugInstall')
call utils#Cabbrev('pud', 'PlugUpdate')
call utils#Cabbrev('pug', 'PlugUpgrade')
call utils#Cabbrev('ps', 'PlugStatus')
call utils#Cabbrev('pc', 'PlugClean')
"}}

"{{ Auto-completion related
"""""""""""""""""""""""""""" deoplete settings""""""""""""""""""""""""""
" Wheter to enable deoplete automatically after start nvim
let g:deoplete#enable_at_startup = 1

" Maximum candidate window width
call deoplete#custom#source('_', 'max_menu_width', 80)

" Minimum character length needed to activate auto-completion,
" see https://goo.gl/QP9am2
call deoplete#custom#source('_', 'min_pattern_length', 1)

" Whether to disable completion for certain syntax
" call deoplete#custom#source('_', {
"     \ 'filetype': ['vim'],
"     \ 'disabled_syntaxes': ['String']
"     \ })
call deoplete#custom#source('_', {
    \ 'filetype': ['python'],
    \ 'disabled_syntaxes': ['Comment']
    \ })

" Ignore certain sources, because they only cause nosie most of the time
call deoplete#custom#option('ignore_sources', {
   \ '_': ['around', 'buffer', 'tag']
   \ })

" Candidate list item number limit
call deoplete#custom#option('max_list', 30)

" The number of processes used for the deoplete parallel feature.
call deoplete#custom#option('num_processes', 16)

" The delay for completion after input, measured in milliseconds.
call deoplete#custom#option('auto_complete_delay', 100)

" Enable deoplete auto-completion
call deoplete#custom#option('auto_complete', v:true)

" Automatically close function preview windows after completion
" see https://goo.gl/Bn5n39
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Tab-complete, see https://goo.gl/LvwZZY
" inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"


"""""""""""""""""""""""""UltiSnips settings"""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use YouCompleteMe
let g:UltiSnipsExpandTrigger='<tab>'

" Shortcut to jump forward and backward in tabstop positions
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" Configuration for custom snippets directory, see
" https://jdhao.github.io/2019/04/17/neovim_snippet_s1/ for details.
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'my_snippets']

"""""""""""""""""""""""""supertab settings""""""""""""""""""""""""""
" Auto-close method preview window
let g:SuperTabClosePreviewOnPopupClose = 1

" Use the default top to bottom way for scroll, see https://goo.gl/APdo9V
let g:SuperTabDefaultCompletionType = '<c-n>'

" Shortcut to navigate forward and backward in completion menu,
" see https://is.gd/AoSv4m
let g:SuperTabMappingForward = '<tab>'
let g:SuperTabMappingBackward = '<s-tab>'

"}}

"{{ Python-related
""""""""""""""""""deoplete-jedi settings"""""""""""""""""""""""""""
" Whether to show doc string
let g:deoplete#sources#jedi#show_docstring = 0

" For large package, set autocomplete wait time longer
let g:deoplete#sources#jedi#server_timeout = 50

" Ignore jedi errors during completion
let g:deoplete#sources#jedi#ignore_errors = 1

""""""""""""""""""""""""jedi-vim settings"""""""""""""""""""
" Disable autocompletion, because I use deoplete for auto-completion
let g:jedi#completions_enabled = 0

" Whether to show function call signature
let g:jedi#show_call_signatures = '0'

"""""""""""""""""""""""""" semshi settings """""""""""""""""""""""""""""""
" Do not highlight for all occurances of variable under cursor
let g:semshi#mark_selected_nodes=0

" Do not show error sign since linting plugin is specicialized for that
let g:semshi#error_sign=v:false
"}}

"{{ R-related
" settings :: Nvim-R

" R output is highlight with current colorscheme
let g:rout_follow_colorscheme = 1

" R commands in R output are highlighted
let g:Rout_more_colors = 1

""""""""""""""""""""""""""" ncm2 settings """""""""""""""""""""""""""""""
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect


"}}
"{{ Search related

"""""""""""""""""""""""""""""Dash"""""""""""""""""""""""""""""""""""""
" remap search key
nmap <silent> <leader>d <Plug>DashSearch<CR>

"""""""""""""""""""""""""""""vim-sneak settings"""""""""""""""""""""""

" Use sneak label mode
let g:sneak#label = 1

nmap f <Plug>Sneak_s
xmap f <Plug>Sneak_s
onoremap <silent> f :call sneak#wrap(v:operator, 2, 0, 1, 1)<CR>
nmap F <Plug>Sneak_S
xmap F <Plug>Sneak_S
onoremap <silent> F :call sneak#wrap(v:operator, 2, 1, 1, 1)<CR>

" Immediately after entering sneak mode, you can press f and F to go to next
" or previous match
let g:sneak#s_next = 1

""""""""""""""""""""""""""""is.vim settings"""""""""""""""""""""""
" To make is.vim work together well with vim-anzu and put current match in
" the center of the window.
" `zz`: put cursor line in center of the window.
" `zv`: open a fold to reveal the text when cursor step into it.
nmap n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)zzzv
nmap N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)zzzv

"""""""""""""""""""""""""""""vim-anzu settings"""""""""""""""""""""""
" Do not show search index in statusline since it is shown on command line
let g:airline#extensions#anzu#enabled = 0

" Maximum number of words to search
let g:anzu_search_limit = 500000

"""""""""""""""""""""""""""""vim-asterisk settings"""""""""""""""""""""
nmap *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
nmap #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
nmap g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
nmap g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)

"""""""""""""""""""""""""""""LeaderF settings"""""""""""""""""""""
" Do not use cache file
let g:Lf_UseCache = 0

" Ignore certain files and directories when searching files
let g:Lf_WildIgnore = {
    \ 'dir': ['.git', '__pycache__', '.DS_Store'],
    \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
    \ '*.gif', '*.db', '*.tgz', '*.tar.gz', '*.gz', '*.zip', '*.bin', '*.pptx',
    \ '*.xlsx', '*.docx', '*.pdf', '*.tmp', '*.wmv', '*.mkv', '*.mp4',
    \ '*.rmvb']
    \}

" Search files in popup window
nnoremap <silent> <leader>f :Leaderf file --popup<CR>
"}}

"{{ URL related
""""""""""""""""""""""""""""open-browser.vim settings"""""""""""""""""""
if g:is_win || g:is_mac
    " Disable netrw's gx mapping.
    let g:netrw_nogx = 1

    " Use another mapping for the open URL method
    nmap ob <Plug>(openbrowser-smart-search)
    vmap ob <Plug>(openbrowser-smart-search)
endif
"}}

"{{ Navigation and tags
""""""""""""""""""""""" nerdtree settings """"""""""""""""""""""""""
" Toggle nerdtree window and keep cursor in file window,
" adapted from http://tinyurl.com/y2kt8cy9
nnoremap <silent> <Space>s :NERDTreeToggle<CR>:wincmd p<CR>

" Reveal currently editted file in nerdtree widnow,
" see https://goo.gl/kbxDVK
nnoremap <silent> <Space>f :NERDTreeFind<CR>

" Ignore certain files and folders
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']

" Automatically show nerdtree window on entering nvim,
" see https://github.com/scrooloose/nerdtree. But now the cursor
" is in nerdtree window, so we need to change it to the file window,
" extracted from https://goo.gl/vumpvo
" autocmd VimEnter * NERDTree | wincmd l

" Delete a file buffer when you have deleted it in nerdtree
let NERDTreeAutoDeleteBuffer = 1

" Show current root as realtive path from HOME in status bar,
" see https://github.com/scrooloose/nerdtree/issues/891
let NERDTreeStatusline="%{exists('b:NERDTree')?fnamemodify(b:NERDTree.root.path.str(), ':~'):''}"

" Disable bookmark and 'press ? for help' text
let NERDTreeMinimalUI=0

""""""""""""""""""""""""""" tagbar settings """"""""""""""""""""""""""""""""""
" Shortcut to toggle tagbar window
nnoremap <silent> <Space>t :TagbarToggle<CR>

" Add support for markdown files in tagbar.
if g:is_win
    let g:md_ctags_bin=fnamemodify(g:nvim_config_root."\\tools\\markdown2ctags.exe", ":p")
else
    let g:md_ctags_bin=fnamemodify(g:nvim_config_root."/tools/markdown2ctags.py", ":p")
endif

let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown.pandoc',
    \ 'ctagsbin' : g:md_ctags_bin,
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
"}}

"{{ File editting
""""""""""""""""""""""""""""vim-titlecase settings"""""""""""""""""""""""
" spell check
setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Do not use the default mapping provided
let g:titlecase_map_keys = 0

nmap <leader>gt <Plug>Titlecase
vmap <leader>gt <Plug>Titlecase
nmap <leader>gT <Plug>TitlecaseLine

""""""""""""""""""""""""vim-auto-save settings"""""""""""""""""""""""
" Enable autosave on nvim startup
let g:auto_save = 1

" A list of events to trigger autosave
let g:auto_save_events = ['InsertLeave', 'TextChanged']
" let g:auto_save_events = ['InsertLeave']

" Show autosave status on command line
let g:auto_save_silent = 0

""""""""""""""""""""""""""""vim-yoink settings"""""""""""""""""""""""""
if g:is_win || g:is_mac
    " ctrl-n and ctrl-p will not work if you add the TextChanged event to
    " vim-auto-save events
    " nmap <c-n> <plug>(YoinkPostPasteSwapBack)
    " nmap <c-p> <plug>(YoinkPostPasteSwapForward)

    nmap p <plug>(YoinkPaste_p)
    nmap P <plug>(YoinkPaste_P)

    " Cycle the yank stack with the following mappings
    nmap [y <plug>(YoinkRotateBack)
    nmap ]y <plug>(YoinkRotateForward)

    " Do not change the cursor position
    nmap y <plug>(YoinkYankPreserveCursorPosition)
    xmap y <plug>(YoinkYankPreserveCursorPosition)

    " Move cursor to end of paste after multiline paste
    let g:yoinkMoveCursorToEndOfPaste = 0

    " Record yanks in system clipboard
    let g:yoinkSyncSystemClipboardOnFocus = 1
endif

""""""""""""""""""""""""""""""vim-signature settings""""""""""""""""""""""""""
" Change mark highlight to be more visible
augroup signature_highlight
autocmd!
autocmd ColorScheme * highlight SignatureMarkText cterm=bold ctermbg=10
    \ gui=bold guifg=#aeee04
augroup END
"}}

"{{ Linting and formating
"""""""""""""""""""""""""""""" lintr """"""""""""""""""""""""""""""

" lintr
let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_r_checkers = ['lintr']

"""""""""""""""""""""""""""""" ale settings """""""""""""""""""""""
" linters for different filetypes
let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'vim': ['vint']
\}

" Only run linters in the g:ale_linters dictionary
let g:ale_linters_explicit = 1

" Linter signs
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '!'

"""""""""""""""""""""""""""""" neoformat settings """""""""""""""""""""""
let g:neoformat_enabled_python = ['black', 'yapf']
"}}

"{{ Git-related
"""""""""""""""""""""""""vim-signify settings""""""""""""""""""""""""""""""
" The VCS to use
let g:signify_vcs_list = [ 'git' ]

" Change the sign for certain operations
let g:signify_sign_change = '~'
"}}

"{{ Markdown writing
"""""""""""""""""""""""""goyo.vim settings""""""""""""""""""""""""""""""
" Make goyo and limelight work together automatically
augroup goyo_work_with_limelight
    autocmd!
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
augroup END

"""""""""""""""""""""""""vim-pandoc-syntax settings"""""""""""""""""""""""""
" Whether to conceal urls (seems does not work)
let g:pandoc#syntax#conceal#urls = 1

" Use pandoc-syntax for markdown files, it will disable conceal feature for
" links, use it at your own risk
augroup pandoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

"""""""""""""""""""""""""plasticboy/vim-markdown settings"""""""""""""""""""
" Disable header folding
let g:vim_markdown_folding_disabled = 1

" Whether to use conceal feature in markdown
let g:vim_markdown_conceal = 0

" Disable math tex conceal and syntax highlight
let g:tex_conceal = 1
let g:vim_markdown_math = 1

" Support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" Let the TOC window autofit so that it doesn't take too much space
let g:vim_markdown_toc_autofit = 1

"""""""""""""""""""""""""markdown-preview settings"""""""""""""""""""
" Only setting this for suitable platforms
if g:is_win || g:is_mac
    " Do not close the preview tab when switching to other buffers
    let g:mkdp_auto_close = 0

    " Shortcuts to start and stop markdown previewing
    nnoremap <silent> <M-m> :MarkdownPreview<CR>
    nnoremap <silent> <M-S-m> :MarkdownPreviewStop<CR>
endif

""""""""""""""""""""""""vim-markdownfootnotes settings""""""""""""""""""""""""
" Replace the default mappings provided by the plugin
imap ^^ <Plug>AddVimFootnote
nmap ^^ <Plug>AddVimFootnote
imap @@ <Plug>ReturnFromFootnote
nmap @@ <Plug>ReturnFromFootnote

""""""""""""""""""""""""deoplete-emoji settings""""""""""""""""""""""""""""
call deoplete#custom#source('emoji', 'converters', ['converter_emoji'])

""""""""""""""""""""""""vim-pandoc settings""""""""""""""""""""""""""""""""
" let g:rmd_syn_langs = ["r", "python"]
"}}

"{{ LaTeX editting
""""""""""""""""""""""""""""vimtex settings"""""""""""""""""""""""""""""
if ( g:is_win || g:is_mac ) && executable('latex')
    " Set up LaTeX flavor
    let g:tex_flavor = 'latex'

    " Deoplete configurations for autocompletion to work
    call deoplete#custom#var('omni', 'input_patterns', {
              \ 'tex': g:vimtex#re#deoplete
              \})

    let g:vimtex_compiler_latexmk = {
         \ 'build_dir' : 'build',
             \ 'options' : [
             \   '-pdf',
             \   '-pdflatex="xelatex --shell-escape %O %S"',
             \   '-verbose',
             \   '-file-line-error',
             \   '-synctex=1',
             \   '-interaction=nonstopmode',
             \ ]
             \}

    let g:vimtex_quickfix_mode = 0
    set conceallevel=1
    let g:tex_conceal = 'abdmg'

    " TOC settings
    let g:vimtex_toc_config = {
          \ 'name' : 'TOC',
          \ 'layers' : ['content', 'todo', 'include'],
          \ 'resize' : 1,
          \ 'split_width' : 30,
          \ 'todo_sorted' : 0,
          \ 'show_help' : 1,
          \ 'show_numbers' : 1,
          \ 'mode' : 2,
          \}

    " Viewer settings for different platforms
    if g:is_win
        let g:vimtex_view_general_viewer = 'SumatraPDF'
        let g:vimtex_view_general_options_latexmk = '-reuse-instance'
        let g:vimtex_view_general_options
            \ = '-reuse-instance -forward-search @tex @line @pdf'
    endif

    if g:is_mac
        " let g:vimtex_view_method = "skim"
        let g:vimtex_view_general_viewer
                \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
        let g:vimtex_view_general_options = '-r @line @pdf @tex'

        " This adds a callback hook that updates Skim after compilation
        let g:vimtex_compiler_callback_hooks = ['UpdateSkim']

        function! UpdateSkim(status)
            if !a:status | return | endif

            let l:out = b:vimtex.out()
            let l:tex = expand('%:p')
            let l:cmd = [g:vimtex_view_general_viewer, '-r']

            if !empty(system('pgrep Skim'))
                call extend(l:cmd, ['-g'])
            endif

            if has('nvim')
                call jobstart(l:cmd + [line('.'), l:out, l:tex])
            elseif has('job')
                call job_start(l:cmd + [line('.'), l:out, l:tex])
            else
                call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
            endif
        endfunction
    endif
endif
"}}

"{{ UI: Status line, look
"""""""""""""""""""""""""""vim-airline setting""""""""""""""""""""""""""""""
" Set airline theme to a random one if it exists
let s:candidate_airlinetheme = ['ayu_mirage', 'base16_flat',
    \ 'base16_grayscale', 'lucius', 'hybridline', 'ayu_dark',
    \ 'base16_adwaita', 'biogoo', 'distinguished', 'jellybeans',
    \ 'luna', 'raven', 'term', 'vice', 'zenburn']
let s:idx = utils#RandInt(0, len(s:candidate_airlinetheme)-1)
let s:theme = s:candidate_airlinetheme[s:idx]

if utils#HasAirlinetheme(s:theme)
    let g:airline_theme=s:theme
endif

" Tabline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Show buffer number for easier switching between buffer,
" see https://github.com/vim-airline/vim-airline/issues/1149
let g:airline#extensions#tabline#buffer_nr_show = 1

" Buffer number display format
let g:airline#extensions#tabline#buffer_nr_format = '%s. '

" Whether to show function or other tags on status line
let g:airline#extensions#tagbar#enabled = 1

" Skip empty sections if there are nothing to show,
" extracted from https://vi.stackexchange.com/a/9637/15292
let g:airline_skip_empty_sections = 1

" Whether to use powerline symbols, see https://goo.gl/XLY19H.
let g:airline_powerline_fonts = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'

" Only show git hunks which are non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" Speed up airline
let g:airline_highlighting_cache = 1
"}}

"{{ Misc plugin setting
""""""""""""""""""" vim-highlightedyank settings """"""""""""""
" Reverse the highlight color for yanked text for better visuals
highlight HighlightedyankRegion cterm=reverse gui=reverse

" Let highlight endures longer
let g:highlightedyank_highlight_duration = 1000

""""""""""""""""""""""""""""vim-matchup settings"""""""""""""""""""""""""""""
" Improve performance
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_timeout = 100
let g:matchup_matchparen_insert_timeout = 30

" Enhanced matching with matchup plugin
let g:matchup_override_vimtex = 1

" Whether to enable matching inside comment or string
let g:matchup_delim_noskips = 0

" Show offscreen match pair in popup window
let g:matchup_matchparen_offscreen = {'method': 'popup'}

" Change highlight color of matching bracket for better visual effects
augroup matchup_matchparen_highlight
  autocmd!
  autocmd ColorScheme * highlight MatchParen cterm=underline gui=underline
augroup END

" Show matching keyword as underlined text to reduce color clutter
augroup matchup_matchword_highlight
    autocmd!
    autocmd ColorScheme * hi MatchWord cterm=underline gui=underline
augroup END

""""""""""""""""""""""""comfortable-motion settings """"""""""""""""""""""
let g:comfortable_motion_scroll_down_key = 'j'
let g:comfortable_motion_scroll_up_key = 'k'

let g:comfortable_motion_no_default_key_mappings = 1
" scroll based on window height
nnoremap <silent> <C-d> :call comfortable_motion#flick(winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(winheight(0) * -2)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(winheight(0) * -4)<CR>

" Mouse settings
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(20)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-20)<CR>

"""""""""""""""""""""""""" asyncrun.vim settings """"""""""""""""""""""""""
" Automatically open quickfix window of 6 line tall after asyncrun starts
let g:asyncrun_open = 6
if has('win32')
    " Command output encoding for Windows
    let g:asyncrun_encs = 'gbk'
endif

""""""""""""""""""""""""""""""firenvim settings""""""""""""""""""""""""""""""
if exists('g:started_by_firenvim') && g:started_by_firenvim
    " general options
    set laststatus=0 nonumber noruler noshowcmd

    " general config for firenvim
    let g:firenvim_config = {
        \ 'globalSettings': {
            \ 'alt': 'all',
        \  },
        \ 'localSettings': {
            \ '.*': {
                \ 'cmdline': 'neovim',
                \ 'priority': 0,
                \ 'selector': 'textarea',
                \ 'takeover': 'never',
            \ },
        \ }
    \ }

    augroup firenvim
        autocmd!
        autocmd BufEnter *.txt setlocal filetype=markdown.pandoc
    augroup END
endif

""""""""""""""""""""""""""""""nvim-gdb settings""""""""""""""""""""""""""""""
nnoremap <leader>dp :GdbStartPDB python -m pdb %<CR>
"}}
"{{ Terminal
    Plug 'vimlab/split-term.vim'
    set splitright
    set splitbelow 

    let g:split_term_default_shell = "zsh"
"}}
"}
