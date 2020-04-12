"{ UI-related settings
"{{ General settings about colors
" Enable true colors support. Do not use this option if your terminal does not
" support true colors! For a comprehensive list of terminals supporting true
" colors, see https://github.com/termstandard/colors and https://bit.ly/2InF97t.
if $TERM == "xterm-256color" || exists('g:started_by_firenvim')
    set termguicolors
endif
" Use dark background
set background=dark
"}}

"{{ Colorscheme settings
""""""""""""""""""""""""""""gruvbox settings"""""""""""""""""""""""""""
" We should check if theme exists before using it, otherwise you will get
" error message when starting Nvim
"if utils#HasColorscheme('gruvbox8')
    " Italic options should be put before colorscheme setting,
    " see https://goo.gl/8nXhcp
   " let g:gruvbox_italics=1
   " let g:gruvbox_italicize_strings=1
    "let g:gruvbox_filetype_hi_groups = 0
    "let g:gruvbox_plugin_hi_groups = 0
    "colorscheme gruvbox8_hard
"else
"    colorscheme desert
"endif
"""""""""""""""""""" Oceanic Next  settings""""""""""""""""""""""""""
if (has("termguicolors"))
    set termguicolors
endif

"syntax enable 
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext

""""""""""""""""""""""""""" Nord settings """""""""""""""""""""""""""""""

" colorscheme nord

""""""""""""""""""""""""""" deus settings"""""""""""""""""""""""""""""""""
" colorscheme deus

""""""""""""""""""""""""""" solarized8 settings"""""""""""""""""""""""""
" Solarized colorscheme without bullshit
" let g:solarized_term_italics=1
" let g:solarized_visibility="high"
" colorscheme solarized8_high

""""""""""""""""""""""""""" vim-one settings"""""""""""""""""""""""""""""
" let g:one_allow_italics = 1
" colorscheme one

"""""""""""""""""""""""""""material.vim settings""""""""""""""""""""""""""
" let g:material_terminal_italics = 1
"let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' |
"'darker'
"let g:material_theme_style = 'default'
" colorscheme material

""""""""""""""""""""""""""" badwolf settings """""""""""""""""""""""""""""
" let g:badwolf_darkgutter = 0
" " Make the tab line lighter than the background.
" let g:badwolf_tabline = 2
" colorscheme badwolf

""""""""""""""""""""""""""" onehalfdark settings"""""""""""""""""""""""""
"colorscheme onehalfdark
"let g:airline_theme='onehalfdark'

"""""""""""""""""""""""""""vim-colors-xcode settings""""""""""""""""""""

colorscheme xcodewwdc
" colorscheme xcodedark

let g:xcodewwdc_dim_punctuation = 1

" not available in xcodewwdc 
" let g:xcodedark_green_comments = 1

"}}

"{{ Cursor colors and shapes
" highlight groups for cursor color
highlight Cursor cterm=bold gui=bold guibg=cyan guifg=black
highlight Cursor2 guifg=red guibg=red

" Set up cursor color and shape in various mode, ref:
" https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20
"}}
"brew install --HEAD universal-ctags/universal-ctags/universal-ctags
"}
