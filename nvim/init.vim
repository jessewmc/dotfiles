" tabs -> spaces
set expandtab
" allow us to scroll so last line of file is anywhere in viewport
set scrolloff=999
" show line numbers
set number
" disable mouse reporting
set mouse=
" make the gutter width for line numbers 5 digits
set numberwidth=5
" show trailing things and other bad whitespace
set list
set listchars="tab:»·,nbsp:+,trail:·"
" make sure << and >> commands indent to multiple of shiftwidth
set shiftround
" visual ruler at 100 columns wide
set colorcolumn=100
" hard wrap length
set textwidth=100
" t auto wrap using text width c auto wrap comments q allow formatting
" comments w gq
set formatoptions=tcq
" case insensitive / search
set ignorecase

" solarized setup
" 24 bit colors required
set termguicolors
colorscheme NeoSolarized
" dark version
set background=dark

lua require('plugins')
