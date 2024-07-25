" vim: foldmethod=marker:foldlevel=0

let configDir = "$HOME/.config/nvim"

" Source functions file
let functionsfile = configDir . "/functions.vim"
" if filereadable(expand(functionsfile))
  exec "source " . functionsfile
" endif

" Source plugins file
let pluginsfile = configDir . "/plugins.vim"

" if filereadable(expand(pluginsfile))
  exec "source " . pluginsfile
" endif

scriptencoding utf-8


" Basic {{{

set nocompatible
set title
set whichwrap=b,s,h,l,<,>,[,]      " Let backspace, space, and arrow keys move to the next/previous line
set shortmess+=filmnrxoOtT         " Make messages shorter
set showmode
set sh=/bin/zsh
set encoding=utf-8
set relativenumber

" Searching
set incsearch                      " Find as you type search
set ignorecase                     " Case insensitive search
set smartcase                      " Case sensitive when upper case present

" Display
set scrolloff=3                    " Minimum lines to keep above and below cursor
set nowrap                         " Do not wrap long lines
set fillchars=vert:│,fold: ,diff:─ " Character used to display split, fold, and
set list                           " Display special characters
set listchars=tab:›\ ,trail:•,nbsp:.,extends:❯,precedes:❮
set number                         " Line numbers on

" Windows
set laststatus=2                   " Always show the status line
set hidden                         " When switching buffer, makes the current buffer hidden instead of unloading
set splitright                     " Puts new vsplit windows to the right of the current
set splitbelow                     " Puts new split windows to the bottom of the current
set winminheight=0                 " Windows can be 0 line high

set undolevels=1000
set undoreload=10000               " Maximum number lines to save for undo
set showmatch                      " Show matching brackets/parenthesis
set nojoinspaces                   " Prevents inserting two spaces after punctuation on a join (J)
set nrformats-=octal               " Allow increment/decrement of number with leading zero

set tabstop=2                      " Number of columns that represent tab stop
set shiftwidth=2                   " Number of columns in each level for autoident
set smarttab                       " Makes tab indent the same numbers of spaces as shiftwidth
set softtabstop=2                  " Number of columns that is added when inserting tab
set shiftround                     " Round ">" and "<" to multiples of shiftwidth
set expandtab                      " Use spaces instead of tabs
set autoindent                     " New line start at the same level of indentation
set nosmartindent                  " Let filetype indent handle smart indent
set completeopt-=preview

set foldlevelstart=2
" set foldmethod=syntax
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldcolumn=1
set foldtext=ShortFoldText()
set foldnestmax=4

set history=1000                   " Store lots of command lines history
set wildmode=list:longest,full     " Complete to the longest match on the first tab, then show menu on the second.
set wildmenu
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
set wildignorecase

set inccommand=nosplit             " Live preview for substitute/other things
set updatetime=300

" }}}


" Color & Syntax Highlighting {{{
set termguicolors
set background=dark
filetype plugin indent on
syntax on

colorscheme solarized
" colorscheme base16-solarized-dark

highlight clear SignColumn " Remove background
highlight clear VertSplit  " Remove backgorund
set hlsearch               " Highlight search terms
set colorcolumn=80         " Hightlight column 80 for manual wrapping

" Customize base16 colors
" function! s:base16_customize() abort
"   if g:colors_name == "NeoSolarized"
"     return
"   endif
"   call Base16hi("MatchParen", "", g:base16_gui02, "", g:base16_cterm02, "bold")
"   call Base16hi("MatchParenCur", "", "", "", "", "bold")
"   call Base16hi("MatchWord", "", g:base16_gui01, "", g:base16_cterm01, "bold")
"   call Base16hi("Pmenu", g:base16_gui04, )
" endfunction

" augroup on_change_colorschema
"   autocmd!
"   autocmd ColorScheme * call s:base16_customize()
" augroup END

" call s:base16_customize()

" Highlight listchars red
highlight SpecialKey ctermfg=darkred guifg=darkred ctermbg=NONE guibg=NONE

" Highlight non-ASCII characters
" highlight nonascii guibg=Red ctermbg=1 term=standout
" au BufReadPost * syntax match nonascii "[^\u0000-\u007F]"

" }}}


" Tree sitter {{{

lua<< EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "javascript",
    "typescript",
    "ruby",
    "python",
    "tsx",
    "vim",
    "query",
    "lua",
    "graphql",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  matchup = {
    enable = true,
  },

  playground = {
    enable = true,
  },
}

require'treesitter-context'.setup {
  enable = true,
}

require("nvim-autopairs").setup {}

require('nvim-treesitter.configs').setup {
    textsubjects = {
        enable = true,
        prev_selection = ',', -- (Optional) keymap to select the previous selection
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
        },
    },
}
EOF

" }}}


" Bufferline {{{

lua << EOF
require("bufferline").setup {
  highlights = {
    buffer_selected = {
      italic = false
    },
    numbers_selected = {
      italic = false
    },
    hint_selected = {
      fg = {
        attribute = "fg",
        highlight = "Normal"
      },
      italic = false
    },
    hint_diagnostic = {
      fg = {
        attribute = "fg",
        highlight = "Normal"
      },
    },
    info_selected = {
      italic = false,
    },
    warning_selected = {
      italic = false
    },
    error_selected = {
      italic = false
    },
    modified = {
      fg = {
        attribute = "fg",
        highlight = "Search"
      },
    },
    modified_selected = {
      fg = {
        attribute = "fg",
        highlight = "Search"
      },
    },
  },
  options = {
    separator_style = "thin",
    diagnostics = "coc",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
    local icons = {
        ["info"] = "",
        ["hint"] = "",
        ["warning"] = "",
        ["error"] = "",
      }
      return icons[level]
    end
  },
}
EOF
" }}}


" Key mappings {{{

" Remap CTRL-C to ESC to avoid interrupt.
inoremap <C-c> <Esc>

" Remove search highlight
nmap <silent> <CR><CR> :nohl<CR>

" Visual shifting that does not exit Visual mode
vnoremap < <gv
vnoremap > >gv

" Split line with Ctrl+J
nmap <C-J>  i<CR><Esc>

" Expand current window. <C-w>= to restore.
nnoremap <C-w>f <C-w>_<C-w>\|


" Save with sudo
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Interrobang‽
digraph !? 8253
digraph ?! 8253


" }}}


" python in arch {{{
let g:python3_host_prog = "/usr/bin/python"
let g:python_host_prog = "/usr/bin/python2"
" }}}


" vim-airline {{{
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#tabline#enabled = 0
" }}}


" matchup {{{
" let g:matchup_matchparen_deferred = 1
" }}}

" EasyMotion {{{
" map <space> <Plug>(easymotion-prefix)
" map <space>s <Plug>(easymotion-sn)
" }}}


" EasyAlign {{{
  nmap ga <Plug>(LiveEasyAlign)
  xmap ga <Plug>(LiveEasyAlign)
" }}}


" fzf {{{

let g:fzf_layout = { 'up': '~40%' }

let g:fzf_colors =
      \{'fg':    ['fg', 'Comment'],
      \ 'bg':      ['bg', 'Comment'],
      \ 'hl':      ['fg', 'Statement'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'MoreMsg'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Normal'] }

" Override commands to include preview

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(),
      \   <bang>0)


command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <silent> <C-p>f :Files<CR>
nnoremap <silent> <C-p>g :GFiles<CR>
nnoremap <silent> <C-p>b :Buffers<CR>
nnoremap <silent> <C-p>/ :Rg<CR>
nnoremap <silent> <C-p>u :Snippets<CR>
nnoremap <silent> <C-p>c :Commits<CR>
nnoremap <silent> <C-p>l :Lines<CR>
" }}}


" Polyglot {{{
let g:polyglot_disabled = ['javascript']
" }}}


" Hard time {{{

let g:hardtime_default_on = 0

let g:hardtime_showmsg = 0
let g:hardtime_ignore_quickfix = 1
let g:hardtime_timeout = 500
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 3

" }}}


" Rooter {{{

let g:rooter_patterns = [
      \ 'package.json',
      \ 'Gemfile',
      \ 'mix.exs',
      \ '.git',
      \ '.git/',
      \  '_darcs/',
      \  '.hg/',
      \  '.bzr/',
      \  '.svn/'
      \ ]

" }}}


" Projectionist {{{
let g:projectionist_heuristics = {
      \   "Gemfile": {
      \     "app/*_controller.rb": {
      \       "alternate": [
      \           "spec/controllers/{basename}_controller_spec.rb",
      \           "spec/requests/{basename}_spec.rb",
      \       ]
      \     },
      \     "app/*.rb": {
      \       "alternate": "spec/{}_spec.rb"
      \     },
      \   },
      \   "package.json": {
      \     "*.ts": {
      \       "alternate": [
      \           "{dirname}/__tests__/{basename}.test.tsx",
      \           "{dirname}/__tests__/{basename}.test.ts",
      \           "{dirname}/__tests__/{basename}.ts",
      \           "{dirname}/{basename}.test.tsx",
      \           "{dirname}/{basename}.test.ts"
      \       ]
      \     },
      \     "*.tsx": {
      \       "alternate": [
      \           "{dirname}/__tests__/{basename}.test.tsx",
      \           "{dirname}/__tests__/{basename}.test.ts",
      \           "{dirname}/__tests__/{basename}.ts",
      \           "{dirname}/{basename}.test.tsx",
      \           "{dirname}/{basename}.test.ts"
      \       ]
      \     },
      \     "*.js": {
      \       "alternate": [
      \           "{dirname}/__tests__/{basename}.test.jsx",
      \           "{dirname}/__tests__/{basename}.test.js",
      \           "{dirname}/__tests__/{basename}.js",
      \           "{dirname}/{basename}.test.jsx",
      \           "{dirname}/{basename}.test.js"
      \       ]
      \     },
      \     "*.jsx": {
      \       "alternate": [
      \           "{dirname}/__tests__/{basename}.test.jsx",
      \           "{dirname}/__tests__/{basename}.test.js",
      \           "{dirname}/__tests__/{basename}.js",
      \           "{dirname}/{basename}.test.jsx",
      \           "{dirname}/{basename}.test.js"
      \       ]
      \     }
      \   }
      \ }
" }}}


" Goyo {{{
function! s:goyo_enter()
  set wrap
  set linebreak
  if strlen(&filetype) == 0
    setlocal ft=text
    let b:changedFileType = 1
  endif
endfunction

function! s:goyo_leave()
  set nowrap
  set linebreak!
  if b:changedFileType==1
    unlet b:changedFileType
    setlocal ft=
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}


" Table mode {{{
let g:table_mode_corner='|'
" }}}


" Deoplete {{{
let g:deoplete#enable_at_startup=1

let g:deoplete#omni#functions = {}
let g:deoplete#sources = {}
let g:deoplete#omni#input_patterns = {}
" }}}


" ALE {{{
let g:ale_linters = {}

let g:ale_fixers = {
      \ '' : ['languagetool'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'python': ['yapf', 'autopep8'],
      \ 'ruby': ['rubocop'],
      \ 'typescript': ['prettier', 'eslint'],
      \ 'sql' : [function('ale#fixers#sqlformat#Fix')]
      \}

let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_javascript_prettier_use_local_config = 1

let g:ale_echo_msg_format = '[%linter%]% [code] %severity%: %%s'
nmap <silent> <F2> <Plug>(ale_next_wrap)
nmap <silent> <F3> <Plug>(ale_detail)
nmap <silent> gaf <Plug>(ale_fix)

" }}}


" LanguageClient {{{
let g:LanguageClient_serverCommands = {
      \ 'javascript': ['./node_modules/.bin/flow', 'lsp', '--from', 'vim'],
      \ 'javascript.jsx': ['./node_modules/.bin/flow', 'lsp', '--from', 'vim'],
      \ 'python': ['/usr/bin/pyls'],
      \ 'ruby': ['solargraph', 'stdio']
      \}

let g:LanguageClient_diagnosticsEnable=0

nmap glc :call LanguageClient_contextMenu()<CR>
" }}}


" CoC.vim {{{

" Rename current word
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)

" Navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)

" Code actions
nmap <silent> gca  <Plug>(coc-codeaction)

" Quickfix for current line
nmap qf  <Plug>(coc-fix-current)

" Organize imports
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Range select
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold (have not press any key for a
" while)
autocmd CursorHold * silent call CocActionAsync('highlight')

" }}}


" Echodoc {{{
set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'
" }}}


" Testing {{{

function! SlimuxStrategy(cmd)
  execute 'SlimuxShellRun ' . "clear && " . a:cmd

  " This doesn't work before a target pane is configured.
  let target = get(g:SlimuxActiveConfigure, 'target_pane', '')
  if target != ''
    call system(g:slimux_tmux_path . " send-keys -t '" . target . "' -X cancel")
  endif
endfunction

let g:test#custom_strategies = {'slimux': function('SlimuxStrategy')}
let g:test#strategy = 'slimux'

nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>T :TestVisit<CR>

" }}}


" JavaScript support {{{

" typescript-vim does not set the filetype correctly.
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1
let g:flow#enable = 0

let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
    let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif

" }}}


" Grammar {{{
let g:grammarous#languagetool_cmd = 'languagetool'
let g:grammarous#use_vim_spelllang=1
let g:grammarous#enable_spell_check = 1
" }}}

" Lilypond {{{

lua<< EOF
require('nvls').setup {
  clean_logs = true
}
EOF

" }}}


" CSV {{{
let g:csv_no_conceal = 1
" }}}

