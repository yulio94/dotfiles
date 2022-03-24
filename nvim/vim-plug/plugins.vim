  " auto-install vim-plug
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "autocmd VimEnter * PlugInstall
    "autocmd VimEnter * PlugInstall | source $MYVIMRC
  endif

call plug#begin(stdpath('config') . '/plugged')

	"VISUAL & STYLING

	" Better whitespaces
	Plug 'ntpeters/vim-better-whitespace'

	" Airline status bar
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" Numbertoggle
	Plug 'jeffkreeftmeijer/vim-numbertoggle'

	" Autopairs
	Plug 'jiangmiao/auto-pairs'

	" Comment plugin
	Plug 'scrooloose/nerdcommenter'

	" NerdTree
	Plug 'scrooloose/nerdtree'|
            \ Plug 'Xuyuanp/nerdtree-git-plugin'|
	    \ Plug 'ryanoasis/vim-devicons'

	" Emmet
	Plug 'mattn/emmet-vim'

	" Dracula
	Plug 'dracula/vim', { 'as': 'dracula' }

	"CODING

	" COC
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	"" LINTING

	" Highlight yank
	Plug 'machakann/vim-highlightedyank'

	" Autoformat
	Plug 'sbdchd/neoformat'

	" Code checker
	Plug 'neomake/neomake'

	" Elxir code highlighting
	Plug 'elixir-editors/vim-elixir'

	" OTHERS

	" Vim multiple cursors
	Plug 'terryma/vim-multiple-cursors'

	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'airblade/vim-rooter'

	" Git
	Plug 'tpope/vim-fugitive'

call plug#end()

