source /etc/xdg/nvim/sysinit.vim

"Plugin dir
call plug#begin('~/.locale/share/nvim/plugged')
 	
	"A light and configurable statusline/tabline
	Plug 'itchyny/lightline.vim'

	" Theme
	Plug 'joshdick/onedark.vim'

	"File explorer
	Plug 'scrooloose/nerdtree'

	"Git wrapper
	Plug 'tpope/vim-fugitive'
	
	"go
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


call plug#end()

"THEME
let g:onedark_termcolors=16
let g:airline_theme='onedark'
colorscheme onedark "Activate onedark theme

"NERDTREE
let g:NERDTreeChDirMode = 2  " Change directory to actual node parent
" Open/Close NERDTree with F2
map <F2> :NERDTreeToggle<CR>

"LIGTHLINE
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
\ }
