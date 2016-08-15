" Set this here so that this file can be run separately to install the
" plugins.
set nocompatible

" Build YCM, taking into account systems (like Arch) that have separate
" python2 and python 3 binaries
function! BuildYCM(info)
  if a:info.status == 'unchanged' && !a:info.force
    return
  endif

  if executable('python2')
    silent !python2 ./install.py --clang-completer
  else
    silent !./install.py --clang-completer
  endif
endfunction


if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Utilities
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/syntastic'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'merlinrebrovic/focus.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'moll/vim-bbye' " Delete buffer without messing the window layout.
Plug 'vim-scripts/matchit.zip'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/restore_view.vim'

" Automatically insert closing quotes, brackets, etc.
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'

" Unite.vim
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'

" Google Calendar in Vim
Plug 'itchyny/calendar.vim'

" Completion
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" Color scheme bundles
Plug 'altercation/vim-colors-solarized'

" Language support
" Plug 'sheerun/vim-polyglot'

Plug 'Chiel92/vim-autoformat'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Ruby
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'

" LaTeX
Plug 'lervag/vimtex'

" Matlab
Plug 'vim-scripts/MatlabFilesEdition'

" Markdown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Haskell
Plug 'dag/vim2hs'
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }

" HexMode
Plug 'fidian/hexmode'

" Run spec from vim
"http://robots.thoughtbot.com/running-specs-from-vim-sent-to-tmux-via-tslime
Plug 'thoughtbot/vim-rspec'
Plug 'epeli/slimux'

call plug#end()
