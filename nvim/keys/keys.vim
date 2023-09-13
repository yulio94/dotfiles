" CONFIGURATIONS

" Number
set number relativenumber

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" HighlightedyankRegion
hi HighlightedyankRegion cterm=reverse gui=reverse

" set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000

" Auto checker
let g:neomake_python_enabled_makers = ['flake8']

" NerdTree
nnoremap <F2> :NERDTreeToggle<Enter>

" Buffers
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>

