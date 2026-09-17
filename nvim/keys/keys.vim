" CONFIGURATIONS

" Number
set number relativenumber

" HighlightedyankRegion
hi HighlightedyankRegion cterm=reverse gui=reverse

" set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000

" vim-rooter echoes the cwd on every startup
let g:rooter_silent_chdir = 1

" NerdTree
nnoremap <F2> :NERDTreeToggle<Enter>

" Buffers
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>

" Review what changed, whole file against the index
nnoremap <leader>gd :Gvdiffsplit<CR>

" Learning
nnoremap <leader>pp :Precognition toggle<CR>
nnoremap <leader>vt :Tutor<CR>

" Markdown
nnoremap <leader>mr :RenderMarkdown toggle<CR>
