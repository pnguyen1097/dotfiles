" Set this here so that this file can be run separately to install the
" plugins.
set nocompatible

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'equalsraf/neovim-gui-shim'

" Airline

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Color scheme bundles
" Plug 'icymind/NeoSolarized'
Plug 'ishan9299/nvim-solarized-lua'
Plug 'RRethy/nvim-base16'

" Plug 'chriskempson/base16-vim'

" Utilities
Plug 'fidian/hexmode'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-unimpaired'
" Plug 'jiangmiao/auto-pairs'
" Plug 'easymotion/vim-easymotion'
Plug 'ggandor/lightspeed.nvim'
Plug 'takac/vim-hardtime'
Plug 'SirVer/ultisnips'
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-rooter'
Plug 'dhruvasagar/vim-table-mode'
Plug 'wincent/terminus'
Plug 'andymass/vim-matchup'
Plug 'kkoomen/vim-doge'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

" Plug 'junegunn/vim-peekaboo'

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'
Plug 'anyakichi/vim-textobj-subword'
Plug 'kana/vim-textobj-line'

" Misc language support.
" Plug 'sheerun/vim-polyglot'

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'RRethy/nvim-treesitter-textsubjects'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'windwp/nvim-autopairs'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Testing
Plug 'epeli/slimux'
Plug 'janko-m/vim-test'

" Language Server
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-pyright', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'antoinemadec/coc-fzf'

" Ruby
Plug 'vim-ruby/vim-ruby'

" JavasScript support
" Plug 'pangloss/vim-javascript'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'flowtype/vim-flow'
" Plug 'leafgarland/typescript-vim'
" Plug 'HerringtonDarkholme/yats.vim'

" Elixir
Plug 'elixir-editors/vim-elixir'

" Plant UML
" Syntax highlight only.
" TODO: Look into coc with previewer support
Plug 'aklt/plantuml-syntax'

" HTML like support
Plug 'mattn/emmet-vim'

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreview' }
Plug 'vim-voom/VOoM' " Document outline

" YAML
" The built-in syntax doesn't handle block scalar well.
Plug 'stephpy/vim-yaml'

" API Blueprint
Plug 'kylef/apiblueprint.vim'

" Fish
Plug 'dag/vim-fish'

" Grammar
Plug 'rhysd/vim-grammarous'

" CSV
Plug 'chrisbra/csv.vim'

" Lilypond
Plug 'martineausimon/nvim-lilypond-suite'
Plug 'MunifTanjim/nui.nvim'

call plug#end()

