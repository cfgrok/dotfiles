call plug#begin()

Plug 'Raimondi/delimitMate'
Plug 'antoinemadec/coc-fzf'
" Plug 'frazrepo/vim-rainbow'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'jenterkin/vim-autosource'
Plug 'junegunn/fzf', { 'dir': '~/.config/fzf', 'do': './install --all --xdg --no-update-rc --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'overcache/NeoSolarized'
Plug 'p0deje/vim-ruby-interpolation'
Plug 'pearofducks/ansible-vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sleuth'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-test/vim-test'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }

" Plugins limited to text editing
Plug 'AndrewRadev/splitjoin.vim'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-visual-star-search'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'

" User-defined text objects
Plug 'Julian/vim-textobj-variable-segment' " [ai]v
Plug 'beloglazov/vim-textobj-quotes' " [ai]q -- evaluate, behavior seems sketchy if unmatched quotes are present in file
Plug 'idbrii/textobj-word-column.vim' " [ai]c [ai]C -- remapped from c/C to l/L
Plug 'jceb/vim-textobj-uri' " [ai]u go
Plug 'kana/vim-textobj-lastpat' " [ai]/
Plug 'tek/vim-textobj-ruby' " [ai]r [ai]c [ai]f [ai]n
Plug 'wellle/targets.vim'
Plug 'whatyouhide/vim-textobj-erb' " [ai]e -- remapped from E to e
Plug 'whatyouhide/vim-textobj-xmlattr' " [ai]x

" Other user-defined text objects to review
" https://github.com/kana/vim-textobj-indent
" https://github.com/vimtaku/vim-textobj-keyvalue

" PLUGIN TESTING
" See initialization code at bottom for Lua plugin configuration
Plug 'airblade/vim-gitgutter'
Plug 'ggandor/flit.nvim'
Plug 'ggandor/leap.nvim'
Plug 'jreybert/vimagit'
Plug 'kylechui/nvim-surround', { 'tag': '*' }
Plug 'numToStr/Comment.nvim'
Plug 'rhysd/git-messenger.vim'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'hiphish/rainbow-delimiters.nvim'

Plug 'ishan9299/nvim-solarized-lua'

call plug#end()


" Set leader to space
nnoremap <Space> <Nop>
let mapleader=' '


" Coc configuration
if !empty(glob('~/.local/share/nvim/plugged/coc.nvim')) && &rtp =~ 'coc.nvim'
  source ~/.config/nvim/coc.vim
endif


" Settings for Magit, GitGutter and Git-Messenger testing
nnoremap <silent> <Leader>ma :Magit<CR>
nnoremap <silent> <Leader>mo :MagitOnly<CR>
nnoremap <silent> <Leader>gg :GitGutterLineHighlightsToggle\|GitGutterLineNrHighlightsToggle<CR>
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_removed_above_and_below = '^-'
let g:gitgutter_sign_modified_removed = '<'
let g:git_messenger_floating_win_opts = { 'border': 'single' }


" Suppress health check message for Perl provider
let g:loaded_perl_provider = 0


" Automatic filetype detection for jsonc files
source ~/.config/nvim/jsonc.vim


" Fzf.vim configuration
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9, 'relative': v:true } }
let g:fzf_preview_window = [ 'down:50%' ]


" Fzf-preview configuration
let g:fzf_preview_command = 'bat --theme="Solarized (dark)" --color=always --plain --number {-1}'
let g:fzf_preview_grep_command = 'rg --line-number --no-heading --color=never --hidden --one-file-system --smart-case'
let g:fzf_preview_lines_command = 'bat --theme="Solarized (dark)" --color=always --plain --number'
let g:fzf_preview_preview_key_bindings = 'ctrl-f:preview-page-down,ctrl-b:preview-page-up,?:toggle-preview,alt-a:select-all,alt-d:deselect-all,btab:toggle+up'
let g:fzf_preview_quit_map = 0


" Coc-fzf configuration
let g:coc_fzf_preview = 'down:50%'
let g:coc_fzf_opts = []


" Remap vim-textobj-erb from E to e
silent! ounmap aE
silent! ounmap iE
silent! xunmap aE
silent! xunmap iE

omap ae <Plug>(textobj-erb-a)
omap ie <Plug>(textobj-erb-i)
xmap ae <Plug>(textobj-erb-a)
xmap ie <Plug>(textobj-erb-i)


" Remap idbrii/textobj-word-column.vim from [cC] to [lL]
silent! ounmap ac
silent! ounmap aC
silent! ounmap ic
silent! ounmap iC
silent! xunmap ac
silent! xunmap aC
silent! xunmap ic
silent! xunmap iC

omap al <Plug>(textobj-wordcolumn-word-a)
omap aL <Plug>(textobj-wordcolumn-WORD-a)
omap il <Plug>(textobj-wordcolumn-word-i)
omap iL <Plug>(textobj-wordcolumn-WORD-i)
xmap al <Plug>(textobj-wordcolumn-word-a)
xmap aL <Plug>(textobj-wordcolumn-WORD-a)
xmap il <Plug>(textobj-wordcolumn-word-i)
xmap iL <Plug>(textobj-wordcolumn-WORD-i)


" Load NeoSolarized color scheme if installed
if !empty(glob('~/.local/share/nvim/plugged/NeoSolarized')) && &rtp =~ 'NeoSolarized'
  colorscheme NeoSolarized
endif

" colorscheme solarized-flat


" Load & configure rainbow parentheses if installed
" if !empty(glob('~/.local/share/nvim/plugged/vim-rainbow')) && &rtp =~ 'vim-rainbow'
"   let g:rainbow_active = 1
"
"   let g:rainbow_ctermfgs = ['red', 'darkgreen', 'darkblue']
" endif

let g:rainbow_delimiters = {
    \ 'highlight': [
    \   'RainbowDelimiterRed',
    \   'RainbowDelimiterGreen',
    \   'RainbowDelimiterViolet',
    \   'RainbowDelimiterOrange',
    \ ]
    \ }

hi RainbowDelimiterGreen ctermfg=2
hi RainbowDelimiterViolet ctermfg=5
hi RainbowDelimiterOrange ctermfg=3


" Base options
set clipboard^=unnamed,unnamedplus
set history=10000
set nohlsearch
set ignorecase
set nojoinspaces
set mouse=
set number
set scrolloff=3
set noshowmode
set smartcase
set nostartofline
set undofile


" Transparent background for main window and line number column
highlight! Normal ctermbg=NONE
highlight! LineNr ctermbg=NONE

" Cancel color reversal and use transparent background for PUM
highlight! Pmenu cterm=NONE ctermbg=NONE


" Close all but the current buffer
nnoremap <Leader>bo :%bd!\|e#\|bd#<CR>\|'"

" Clear and close quickfix list
nnoremap <silent> <Leader>qc :call setqflist([], 'r')<CR>:cclose<CR>

" Fix for broken lightline display that sometimes occurs when calling Vim via xdg-open
nnoremap <silent> <C-_> G<C-f>gg:call lightline#disable()<CR>:call lightline#enable()<CR>

" Expand directory of current file in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

" Filter command history previous/next scrolling
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" Map Alt key for all window commands, excluding a few redundant keys:
" S, :, gt, gT, g<Tab>, <Down>, <Up>, <Left>, <Right>
nnoremap <A-+>           <C-w>+             | "increase current window height N lines
nnoremap <A-->           <C-w>-             | "decrease current window height N lines
nnoremap <A-_>           <C-w>_             | "set current window height to N (default: very high)
nnoremap <A-\>           <C-w><Bar>         | "set window width to N columns
nnoremap <A-<>           <C-w><             | "decrease current window width N columns
nnoremap <A->>           <C-w>>             | "increase current window width N columns
nnoremap <A-=>           <C-w>=             | "make all windows the same height & width

nnoremap <A-H>           <C-w>H             | "move current window to the far left
nnoremap <A-J>           <C-w>J             | "move current window to the very bottom
nnoremap <A-K>           <C-w>K             | "move current window to the very top
nnoremap <A-L>           <C-w>L             | "move current window to the far right
nnoremap <A-R>           <C-w>R             | "rotate windows upwards N times
nnoremap <A-r>           <C-w>r             | "rotate windows downwards N times
nnoremap <A-T>           <C-w>T             | "move current window to a new tab page
nnoremap <A-x>           <C-w>x             | "exchange current window with window N (default: next window)

nnoremap <A-W>           <C-w>W             | "go to N previous window (wrap around)
nnoremap <A-w>           <C-w>w             | "go to N next window (wrap around)
nnoremap <A-b>           <C-w>b             | "go to bottom window
nnoremap <A-t>           <C-w>t             | "go to top window
nnoremap <A-h>           <C-w>h             | "go to Nth left window (stop at first window)
nnoremap <A-j>           <C-w>j             | "go N windows down (stop at last window)
nnoremap <A-k>           <C-w>k             | "go N windows up (stop at first window)
nnoremap <A-l>           <C-w>l             | "go to Nth right window (stop at last window)
nnoremap <A-p>           <C-w>p             | "go to previous (last accessed) window
nnoremap <A-P>           <C-w>P             | "go to preview window

nnoremap <A-c>           <C-w>c             | "close current window (like :close)
nnoremap <A-o>           <C-w>o             | "close all but current window (like :only)
nnoremap <A-q>           <C-w>q             | "quit current window (like :quit)
nnoremap <A-z>           <C-w>z             | "close preview window
nnoremap <silent> <A-Q>  :bd!<CR>           | "close buffer

nnoremap <silent> <A-O>  <C-w>n:ter<CR>     | "open new terminal in split window
nnoremap <A-n>           <C-w>n             | "open new window, N lines high
nnoremap <A-s>           <C-w>s             | "split current window in two parts, new window N lines high
nnoremap <A-v>           <C-w>v             | "split current window vertically, new window N columns wide
nnoremap <A-^>           <C-w>^             | "split current window and edit alternate file N

nnoremap <A-d>           <C-w>d             | "split window and jump to definition under the cursor
nnoremap <A-i>           <C-w>i             | "split window and jump to declaration of identifier under the cursor

nnoremap <A-]>           <C-w>]             | "split window and jump to tag under cursor
nnoremap <A-g>]          <C-w>g]            | "split window and do :tselect for tag under cursor
nnoremap <A-g><C-]>      <C-w>g<C-]>        | "split window and do :tjump to tag under cursor
nnoremap <A-g>}          <C-w>g}            | "do a :ptjump to the tag under the cursor
nnoremap <A-}>           <C-w>}             | "show tag under cursor in preview window

nnoremap <A-f>           <C-w>f             | "split window and edit file name under the cursor
nnoremap <A-F>           <C-w>F             | "split window and edit file name under the cursor and jump to the line number following the file name
nnoremap <A-g>f          <C-w>gf            | "edit file name under the cursor in a new tab page
nnoremap <A-g>F          <C-w>gF            | "edit file name under the cursor in a new tab page and jump to the line number following the file name

" Map Alt key in insert mode for switching windows
inoremap <A-h>           <C-o><C-w>h        | "go to Nth left window (stop at first window)
inoremap <A-j>           <C-o><C-w>j        | "go N windows down (stop at last window)
inoremap <A-k>           <C-o><C-w>k        | "go N windows up (stop at first window)
inoremap <A-l>           <C-o><C-w>l        | "go to Nth right window (stop at last window)

" Map Esc and Alt keys in terminal mode for exiting to normal mode and
" switching windows -- custom command and function used to close floating
" windows in terminal mode, e.g. fzf-preview
tnoremap <silent> <Esc>  <C-\><C-n>:CloseFloat<CR>
tnoremap <A-h>           <C-\><C-n><C-w>h   | "go to Nth left window (stop at first window)
tnoremap <A-j>           <C-\><C-n><C-w>j   | "go N windows down (stop at last window)
tnoremap <A-k>           <C-\><C-n><C-w>k   | "go N windows up (stop at first window)
tnoremap <A-l>           <C-\><C-n><C-w>l   | "go to Nth right window (stop at last window)
tnoremap <silent> <A-Q>  <C-\><C-n>:bd!<CR> | "close terminal buffer

command! CloseFloat call CloseFloatWindow()

function! CloseFloatWindow() abort
  if nvim_win_get_config(0).relative != ''
    call nvim_win_close(0,0)
  endif
endfunction

" Enter terminal mode automatically in new terminal buffer
autocmd TermOpen * startinsert


" Mappings for fzf-preview
nnoremap [fzf-p] <Nop>
xnoremap [fzf-p] <Nop>

nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> [fzf-p]p     :<C-u>FzfPreviewFromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>FzfPreviewGitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>FzfPreviewGitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewBuffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>FzfPreviewAllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewFromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>FzfPreviewJumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>FzfPreviewChanges<CR>
nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLines --add-fzf-arg=--no-sort --add-fzf-arg=--query=""<CR>
nnoremap <silent> [fzf-p]*     :<C-u>FzfPreviewLines --add-fzf-arg=--no-sort --add-fzf-arg=--query="<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>FzfPreviewProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>FzfPreviewBufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>FzfPreviewQuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewLocationList<CR>


" Indenting defaults (does not override vim-sleuth's indenting detection)
" Defaults to 2 spaces for most filetypes
if get(g:, '_has_set_default_indent_settings', 0) == 0
  " Set the indenting level to 4 spaces for the following file types.
  autocmd FileType python
    \ setlocal expandtab tabstop=4 shiftwidth=4
  set expandtab
  set tabstop=2
  set shiftwidth=2
  let g:_has_set_default_indent_settings = 1
endif


" delimitMate autoclosing configuration
let delimitMate_matchpairs = '(:),[:],{:},<:>'
let delimitMate_quotes = "\" ' ` * |"
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

" Support for hashes in CFML
autocmd FileType cf let b:delimitMate_quotes = "\" ' ` * | #"

if empty(maparg('<CR>', 'i'))
  imap <CR> <Plug>delimitMateCR
endif


function! CocCurrentFunction() abort
  return get(b:, 'coc_current_function', '')
endfunction

function! LightlineFilename() abort
  return &filetype !=# 'qf' && len(expand('%:f')) <= 40 && winwidth(0) > 40 ? '%f' : '%t'
endfunction

function! LightlineFileformat() abort
  return winwidth(0) > 80 ? &fileformat : ''
endfunction

function! LightlineFileencoding() abort
  return winwidth(0) > 80 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineFiletype() abort
  return winwidth(0) > 80 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineModified() abort
  return &modifiable && &modified ? ',[+]' : ''
endfunction

" lightline configuration
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'gitbranch', 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ]
  \   ],
  \   'right': [
  \     [ 'lineinfo' ],
  \     [ 'percent', 'linecount' ],
  \     [ 'fileformat', 'fileencoding', 'filetype' ]
  \   ]
  \ },
  \ 'component': {
  \   'filename': '%{%LightlineFilename()%}',
  \   'linecount': '%L'
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction',
  \   'fileformat': 'LightlineFileformat',
  \   'fileencoding': 'LightlineFileencoding',
  \   'filetype': 'LightlineFiletype',
  \   'gitbranch': 'gitbranch#name',
  \   'modified': 'LightlineModified'
  \ },
  \ }


" Load Emmet custom snippets
if !empty(glob('~/.local/share/nvim/plugged/webapi-vim')) && &rtp =~ 'webapi-vim' && !empty(glob('~/.config/nvim/vim-snippets-custom.json'))
  let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.config/nvim/vim-snippets-custom.json')), "\n"))
endif


" Use Dispatch for running tests
let test#strategy = 'dispatch'


" Custom command to save & source current file
command! WS write | source %


" Custom command to edit init.vim file
command! VM edit $MYVIMRC


" Custom command to toggle CFML/CFScript commentstring
command! CF call v:lua.toggle_cf_commentstring()


" Enable highlight on yank Lua functionality
au TextYankPost * silent! lua vim.highlight.on_yank()


" Script to initialize/configure Lua plugins -- placing at the end as the
" heredoc format screws up syntax highlighting
lua << EOF

  -- Replacing default 's/S' keymaps with 'z/Z' to avoid conflict with leap
  require('nvim-surround').setup({
    keymaps = {
      normal = 'yz',
      normal_cur = 'yzz',
      normal_line = 'yZ',
      normal_cur_line = 'yZZ',
      visual = 'Z',
      visual_line = 'gZ',
      delete = 'dz',
      change = 'cz',
      change_line = 'cZ',
    }
  })

  require('leap').add_default_mappings()
  require('leap').add_repeat_mappings(';', ',', {
    -- False by default. If set to true, the keys will work like the
    -- native semicolon/comma, i.e., forward/backward is understood in
    -- relation to the last motion.
    relative_directions = true,
    -- By default, all modes are included.
    modes = {'n', 'x', 'o'},
  })
  vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
  vim.api.nvim_create_autocmd(
    'User',
    { callback = function()
        vim.cmd.hi('Cursor', 'blend=100')
        vim.opt.guicursor:append { 'a:Cursor/lCursor' }
      end,
      pattern = 'LeapEnter'
    }
  )
  vim.api.nvim_create_autocmd(
    'User',
    { callback = function()
        vim.cmd.hi('Cursor', 'blend=0')
        vim.opt.guicursor:remove { 'a:Cursor/lCursor' }
      end,
      pattern = 'LeapLeave'
    }
  )

  require('flit').setup()

  require('Comment').setup()

  -- Set up manual commentstring support for CFML/CFScript
  local ft = require('Comment.ft')
  local cfscript_comment = {'//%s', '/*%s*/'}

  ft.cf = cfscript_comment

  function toggle_cf_commentstring()
    if ft.get('cf')[1] == cfscript_comment[1] then
      ft.cf = '<!---%s--->'
    else
      ft.cf = cfscript_comment
    end
  end

  require('nvim-treesitter.configs').setup ({
    ensure_installed = { 'c', 'lua', 'query', 'vim', 'vimdoc', },
    auto_install = true,
    highlight = {
      enable = false,
      disable = function(lang)
        local ft = vim.bo.filetype
        local disabled_types = create_set{ 'gitcommit', 'gitrebase', 'yaml.ansible' }
        if disabled_types[ft] then
          return true
        end
      end
    },
  })

  function create_set(list)
    local set = {}
    for _, i in ipairs(list) do set[i] = true end
    return set
  end

EOF
