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


	" THEMES

	Plug 'cocopon/iceberg.vim', { 'as': 'iceberg'}

	" LSP progress.
	Plug 'j-hui/fidget.nvim'

	"CODING

	" LSP: ships the per-server defaults that vim.lsp.enable() reads.
	Plug 'neovim/nvim-lspconfig'

	"Code snippets
	Plug 'hrsh7th/nvim-cmp'
  	Plug 'hrsh7th/cmp-nvim-lsp'
  	Plug 'hrsh7th/cmp-vsnip'
  	Plug 'hrsh7th/vim-vsnip'
	Plug 'onsails/lspkind-nvim'


	" LINTING

	" Highlight yank
	Plug 'machakann/vim-highlightedyank'

	" Syntax
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

	" Renders markdown in the buffer
	Plug 'MeanderingProgrammer/render-markdown.nvim'

	" Elxir code highlighting
	Plug 'elixir-editors/vim-elixir'

	" LEARNING

	" Motion hints, drawn on the current line
	Plug 'tris203/precognition.nvim'

	" OTHERS

	" Vim multiple cursors
	Plug 'terryma/vim-multiple-cursors'

	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'airblade/vim-rooter'

	" Git
	Plug 'tpope/vim-fugitive'
	Plug 'lewis6991/gitsigns.nvim'

	" Debugging
	Plug 'mfussenegger/nvim-dap'
	Plug 'theHamsta/nvim-dap-virtual-text'
	Plug 'mfussenegger/nvim-dap-python'

call plug#end()
