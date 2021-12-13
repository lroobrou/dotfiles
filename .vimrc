" vim: set foldmethod=marker foldlevel=1:
" ===========================================================================+
"  ___                _______             __                          __     |
" |   |  .--.--.----.|   _   .-----.-----|  |--.----.-----.--.--.----|  |--. |
" |.  |  |  |  |  __||.  l   |  _  |  _  |  _  |   _|  _  |  |  |  __|    <  |
" |.  |__|_____|____||.  _   |_____|_____|_____|__| |_____|_____|____|__|__| |
" |:  1   |          |:  |   |                                               |
" |::.. . |          |::.|:. |                                               |
" `-------'          `--- ---'                                               |
"                                                                            |
"          ________ ++     ________                                          |
"         /VVVVVVVV\++++  /VVVVVVVV\                                         |
"         \VVVVVVVV/++++++\VVVVVVVV/                                         |
"          |VVVVVV|++++++++/VVVVV/'                                          |
"          |VVVVVV|++++++/VVVVV/'                                            |
"         +|VVVVVV|++++/VVVVV/'+                 _                           |
"       +++|VVVVVV|++/VVVVV/'+++++        _   __(_)___ ___  __________       |
"     +++++|VVVVVV|/VVVVV/'+++++++++     | | / / / __ `__ \/ ___/ ___/       |
"       +++|VVVVVVVVVVV/'+++++++++      _| |/ / / / / / / / /  / /__         |
"         +|VVVVVVVVV/'+++++++++       (_)___/_/_/ /_/ /_/_/   \___/         |
"          |VVVVVVV/'+++++++++                                               |
"          |VVVVV/'+++++++++                                                 |
"          |VVV/'+++++++++                                                   |
"          'V/'   ++++++                                                     |
"                   ++                                                       |
"                                                                            |
" ===========================================================================+

set encoding=utf-8
scriptencoding utf-8

" ============================================================================
" .vimrc of Luc Roobrouck
" ============================================================================

" Vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

let s:darwin = has('mac')
if !s:darwin
  let s:linux = has("unix")
endif

" ============================================================================
" Path {{{
" ============================================================================
set path=.,**
if has('win32')
    set path+=c:/Users/lro
    set path+=e:/users/lro/omnitracker/interfacing,**
    let $PATH .= ";E:\\Install\\Apps\\Python\\Python27"
    let $PATH .= ";E:\\Install\\Apps\\Python\\Python36-32" " needs to be a 32-bit version
    let $PATH .= ";E:\\Omnitracker Tools\\tidy-5.6.0-vc10-32b\\tidy-5.6.0-vc10-32b\\bin"
    let $PATH .= ";E:\\Install\\Apps\\node-v12.16.2-win-x64\\"
    let $PATH .= ";C:\\Windows\\Microsoft.NET\\Framework64\\v4.0.30319"
    let $PATH .= ";C:\\Windows\\System32"
    let $PATH .= ";C:\\Users\\lro\\XML\\bin"               " for xmllint
    let $PATH .= ';' . 'C:\Users\lro\Downloads\Portablebin'
    let $PATH .= ';' . 'C:\Users\lro\'

    " Remove network path entries, they slow things down
    let $PATH = substitute($PATH, '\v[YX]:[^;]*;', '', 'g')
endif

let mapleader      = ' '
let maplocalleader = ','

" }}}
" ============================================================================
" VIM-Plug BLOCK {{{
" ============================================================================
let s:vim_plugged_dir = "~/vimfiles/plugged"
if has("unix")
    let s:vim_plugged_dir = "~/.vim/plugged"
endif

if has("win32")
    let $PATH.=";E:\\Install\\Apps\\Cmder\\vendor\\git-for-windows\\bin"
    let $TMP="C:\\Users\\lro\\VimTemp" " needed for GPO thing
    let s:vim_plugged_dir = "~/vimfiles/plugged"
endif

silent! if plug#begin(s:vim_plugged_dir)

if s:darwin
    " let g:plug_url_format = 'git@github.com:%s.git'
else
    " let $git_ssl_no_verify = 'true'
endif

" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'justinmk/vim-sneak'
" Plug 'metakirby5/codi.vim'
" Plug 'gillyb/stable-windows'

" Plug 'dkarter/bullets.vim'
" Plug 'dhruvasagar/vim-table-mode'
" let g:table_mode_map_prefix = '<LocalLeader>t'

" Plug 'jceb/vim-orgmode'
Plug 'airblade/vim-gitgutter'

" junegunn Plugins
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chengzeyi/fzf-preview.vim'

Plug 'rust-lang/rust.vim'

" Colors
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
" Plug 'arcticicestudio/nord-vim'
" Plug 'tomasr/molokai'

let g:gruvbox_contrast_dark = 'soft'

" Tim Pope plugins
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-speeddating'

map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

" Textobj
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'wellle/targets.vim'

Plug 'gko/vim-coloresque'
Plug 'mhinz/vim-grepper', { 'on': 'GrepperRg' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDtreeToggle' }
Plug 'preservim/nerdcommenter'

Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
let g:tagbar_sort = 0

Plug 'roman/golden-ratio'
let g:golden_ratio_autocommand = 0

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vim-which-key'
Plug 'liuchengxu/vista.vim'

" Slow :(
" Plug 'ssh://luc@192.168.0.250/volume1/homes/luc/repos/pim'
let g:pim_source_file = ""
" let g:pim_source_file = ["~/.vim.py"]

Plug 'skywind3000/asyncrun.vim'

Plug 'preservim/vimux'
Plug 'jtdowney/vimux-cargo'

Plug 'christoomey/vim-tmux-navigator' " Navigate seemlessly in tmux
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> h :TmuxNavigateLeft<cr>
nnoremap <silent> j :TmuxNavigateDown<cr>
nnoremap <silent> k :TmuxNavigateUp<cr>
nnoremap <silent> l :TmuxNavigateRight<cr>

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>

call plug#end()
endif

" }}}
" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab smarttab
set nocompatible
set path+=**

set number
set autoindent
set smartindent
set lazyredraw
set showcmd
set visualbell
set belloff=all
set backspace=indent,eol,start
set timeoutlen=500
set whichwrap=b,s
set shortmess=aIT
set hlsearch " CTRL-L / CTRL-R W
set incsearch
set hidden
set ignorecase smartcase
set wildmenu
set wildmode=full
set scrolloff=1
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,space:•,trail:◼,extends:❯,precedes:❮
set nowrap
set virtualedit=block
set nojoinspaces
set diffopt=filler,vertical
set clipboard=unnamed
set foldlevelstart=99
set grepformat=%f:%l:%c:%m,%f:%l:%m
set completeopt=menuone,preview
set cursorline
set nrformats=hex
set linebreak
set mouse=a
set undofile
silent! set cryptmethod=blowfish2

set nostartofline " Keep the cursor on the same column

if has("gui")
  set guioptions=-T
  set guioptions=-t
  set guioptions=-m
endif

set formatoptions+=1
if has('patch-7.3.541')
  set formatoptions+=j
endif

if has('patch-7.4.338')
  let &showbreak = '↳ '
  set breakindent
  set breakindentopt=sbr
endif

if has('termguicolors') && $TERM !~? 'rxvt' && !has("mac")
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

if $TERM ==? 'xterm-kitty' || $TERM ==? 'xterm-256color'
  " vim hardcodes background color erase even if the terminfo file does
  " not contain bce (not to mention that libvte based terminals
  " incorrectly contain bce in their terminfo files). This causes
  " incorrect background rendering when using a color theme with a
  " background color.
  let &t_ut=''
  set termguicolors
endif

" }}}
" ============================================================================
" Functions {{{
" ============================================================================

function! s:update_fzf_colors()
    let rules =
                \ { 'fg':      [['Normal',       'fg']],
                \ 'bg':      [['Normal',       'bg']],
                \ 'hl':      [['Comment',      'fg']],
                \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
                \ 'bg+':     [['CursorColumn', 'bg']],
                \ 'hl+':     [['Statement',    'fg']],
                \ 'info':    [['PreProc',      'fg']],
                \ 'prompt':  [['Conditional',  'fg']],
                \ 'pointer': [['Exception',    'fg']],
                \ 'marker':  [['Keyword',      'fg']],
                \ 'spinner': [['Label',        'fg']],
                \ 'header':  [['Comment',      'fg']] }

    let cols = []
    for [name, pairs] in items(rules)
        for pair in pairs
            let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
            if !empty(name) && code != ''
                call add(cols, name.':'.code)
                break
            endif
        endfor
    endfor
    let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
    let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
                \ empty(cols) ? '' : (' --color='.join(cols, ','))
endfunction

augroup _fzf
    autocmd!
    autocmd ColorScheme * call <sid>update_fzf_colors()
augroup END

function! GenerateTemplate()
    " echomsg "Generating Templates..."
    let cwd = getcwd()

    cd E:\users\lro\Omnitracker\Message\ Templates\
    silent py3file generate_templates.py

    cd E:\users\lro\Omnitracker\CC Templates\
    silent py3file generate_templates.py

    " cd -
    execute 'cd' fnameescape(cwd)
endfunction

function! CleanupDoubleBlankLines(type, ...)
    '<,'>g/\v(^$\n)\zs(^$\n)+/d
endfunction

" Create a new operator that will remove all double blank lines
nmap <silent> <Leader>d :set opfunc=CleanupDoubleBlankLines<CR>g@
vmap <silent> <Leader>d :<C-U>call CleanupDoubleBlankLines(visualmode(), 1)<CR>

function! FormatSql(type, ...) range
    if a:0  " Invoked from Visual mode, use gv command.
        "echo a:000[0]
    endif
    if a:type == 'visual'
        let startpos = getpos("'<")
        let endpos = getpos("'>")
        "echo "visual mode" . a:000[0]
    elseif a:type == 'line'
        let startpos = getpos("'[")
        let endpos = getpos("']")
        "echo "linemode"
    else
        let startpos = getpos("'[")
        let endpos = getpos("']")
        "echo "else mode"
   endif
    "echo startpos[1] . '/' .startpos[2] . ' ' . endpos[1] . '/' . endpos[2]
python << EOF
import vim
import sqlparse
buf = vim.current.buffer
lnum1 = int(vim.eval('startpos[1]'))
lnum2 = int(vim.eval('endpos[1]'))
lines = vim.eval('getline({}, {})'.format(lnum1, lnum2))
# Always use a full line as the selection
#lines[0] = lines[0][col1:]
#lines[-1] = lines[-1][:col2]
stmt = "\n".join(lines)
new_stmt = stmt.replace("\\r\\n", " ")
new_stmt = sqlparse.format(new_stmt, reindent=True)
new_stmt = sqlparse.format(new_stmt, reindent=True)
buf[lnum1-1:lnum2] = None
buf.append(new_stmt.split('\n'), lnum1-1)
EOF
endfunction

function! SnapShotFormat()
    silent v/\vPallet (\d+).*not in Snapshot/d
    silent %s/\vPallet (\d+) having status (\w+) not in Snapshot.*/   Update HandlingUnit h set h.Comments = 'Deleted', h.HandlingUnitStatus = 'Canceled' where h.adstat = 'A' and h.HandlingUnitStatus = '\2' and exists (select 1 from PhysicalHandlingUnit p where h.physicalhandlingunitid=p.physicalhandlingunitid and p.erpid = '\1');/
    let bef = ""
    let bef = bef . "DECLARE\n"
    let bef = bef . "   Sequence    NUMBER(10);\n"
    let bef = bef . "   TXStart     DATE;\n"
    let bef = bef . "BEGIN\n"
    let bef = bef . "   SELECT OMCONNECTIONSEQUENCE.nextval into Sequence FROM Dual;\n"
    let bef = bef . "   SELECT sysdate into TXStart FROM Dual;\n"
    let bef = bef . "   INSERT INTO OMTXLOG (objectname,SID,TXTYPE,TXSTART) VALUES ('STEP',Sequence,'CHANGE',TXStart);\n"

    let aft = ""
    let aft = aft . "   UPDATE OmTxLog SET TxEnd = SYSDATE WHERE ObjectName ='STEP' AND SID = Sequence AND TxType = 'CHANGE' AND TxStart = TXStart;\n"
    let aft = aft . "   COMMIT;\n"
    let aft = aft . "END;\n"
    let aft = aft . "/\n"

    set nocompatible
    silent :2,$g/^/if !(line('.') % 100)| put=aft | put=bef|endif
    silent 0put=bef
    silent $put=aft
endfunction

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunc

function! Html2Text(type, ...) range
    if a:0  " Invoked from Visual mode, use gv command.
        "echo a:000[0]
    endif
    if a:type == 'visual'
        let startpos = getpos("'<")
        let endpos = getpos("'>")
    elseif a:type == 'line'
        let startpos = getpos("'[")
        let endpos = getpos("']")
    else
        let startpos = getpos("'[")
        let endpos = getpos("']")
   endif
python3 << EOF
import vim
import sys
import html2text              # convert html to plaintext
buf = vim.current.buffer
lnum1 = int(vim.eval('startpos[1]'))
lnum2 = int(vim.eval('endpos[1]'))
lines = vim.eval('getline({}, {})'.format(lnum1, lnum2))
text = "".join(lines)
h2text = html2text.HTML2Text()
h2text.ignore_images = True
tmp = h2text.handle(str(text))
# new_stmt = stmt.replace("\\r\\n", " ")
buf[lnum1-1:lnum2] = None
buf.append(tmp.split('\n'), lnum1-1)
EOF
endfunction

" ctags
set tags=./tags;/

" 80 chars/line
set textwidth=0
if exists('&colorcolumn')
  " set colorcolumn=80
  let &colorcolumn=join(range(80,999),',')
endif

function! NewOp(type, ...) range
    if a:0  " Invoked from Visual mode, use gv command.
        "echo a:000[0]
    endif
    if a:type == 'visual'
        let startpos = getpos("'<")
        let endpos = getpos("'>")
    elseif a:type == 'line'
        let startpos = getpos("'[")
        let endpos = getpos("']")
    else
        let startpos = getpos("'[")
        let endpos = getpos("']")
   endif
python3 << EOF
import vim
buf = vim.current.buffer
rang = vim.current.range
print(buf.mark('['))
print(vim.eval('a:type'))
#lnum1 = int(vim.eval('startpos[1]'))
#lnum2 = int(vim.eval('endpos[1]'))
#lines = vim.eval('getline({}, {})'.format(lnum1, lnum2))
#text = "".join(lines)
#h2text = html2text.HTML2Text()
#h2text.ignore_images = True
#tmp = h2text.handle(str(text))
## new_stmt = stmt.replace("\\r\\n", " ")
#buf[lnum1-1:lnum2] = None
#buf.append(tmp.split('\n'), lnum1-1)
EOF
endfunction
xnoremap <silent> <Leader>n :call NewOp('visual', visualmode())<CR>
nnoremap <silent> <Leader>n :set opfunc=NewOp<CR>g@


function! DoPrettyXML()
    " save the filetype so we can restore it later
    let l:origft = &ft
    set ft=
    " delete the xml header if it exists. This will
    " permit us to surround the document with fake tags
    " without creating invalid xml.
    1s/<?xml .*?>//e
    " insert fake tags around the entire document.
    " This will permit us to pretty-format excerpts of
    " XML that may contain multiple top-level elements.
    " 0put ='<PrettyXML>'
    " $put ='</PrettyXML>'
    silent %!xmllint --format --recover --nowarning -
    " xmllint will insert an <?xml?> header. it's easy enough to delete
    " if you don't want it.
    " delete the fake tags
    " 2d
    " $d
    " restore the 'normal' indentation, which is one extra level
    " too deep due to the extra tags we wrapped around the document.
    " silent %<
    " back to home
    1
    " restore the filetype
    exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" call sqlformat to format the selected region
xnoremap <silent> <Leader>s :call FormatSql('visual', visualmode())<CR>
nnoremap <silent> <Leader>s :set opfunc=FormatSql<CR>g@
" these ones don't seem to work?
nnoremap <Leader>ss .,.call FormatSql('line')<CR>
command! -range -nargs=0 FormatSql <line1>,<line2>call FormatSql()

command! -range -nargs=0 Html2Text <line1>,<line2>call Html2Text('range')

if !exists("g:loaded_vimrc")
    if has("gui_macvim")
        set guifont=Consolas:h14
        " set guifont=JetBrains Mono Regular:h14
        set gfn=SourceCodePro-Regular:h15

        " set macvim specific stuff
        " colorscheme holokai
        " colorscheme solarized8_light
        " colorscheme base16-harmonic-dark
        " colorscheme base16-atelier-dune-light
        colorscheme gruvbox
        set background=light
    elseif has('gui_running')
        " set guifont=Menlo:h14 columns=80 lines=40
        "silent! colo seoul256-light
        colorscheme nord
        set guifont=Source_Code_Pro:h12:cANSI:qDRAFT
        set background=dark
    elseif has('mac')
        " set guifont=Menlo:h14 columns=80 lines=40
        "silent! colo seoul256-light
        colorscheme evening
        set background=dark
    else
        "silent! colo seoul256
        " colorscheme gruvbox
        colorscheme onedark
        set background=dark
    endif
endif

if exists('g:started_by_firenvim')
    colorscheme Tomorrow
endif

" }}}
" ============================================================================
" MAPPINGS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" Basic mappings
" ----------------------------------------------------------------------------

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-^> <C-o><C-^>

" Fix all screen related stuff
nnoremap <C-l> :noh<cr>:syntax sync fromstart<cr><C-l>

" Make Y behave like other capitals
nnoremap Y y$

" Fix the & command so that it remember the flags
nnoremap & :&&<Cr>
xnoremap & :&&<Cr>

" qq to record, Q to replay
nnoremap Q @q

" Zoom
function! s:zoom()
  if winnr('$') > 1
    tab split
  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
                  \ 'index(v:val, '.bufnr('').') >= 0')) > 1
    tabclose
  endif
endfunction
nnoremap <silent> <Leader>z :call <sid>zoom()<cr>

" ----------------------------------------------------------------------------
" Vim-which-key key mappings
" ----------------------------------------------------------------------------

nnoremap <silent> <Leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <Leader> :<c-u>WhichKeyVisual '<Space>'<CR>

nnoremap <silent> <LocalLeader> :<c-u>WhichKey ','<CR>
vnoremap <silent> <LocalLeader> :<c-u>WhichKeyVisual ','<CR>

nnoremap <silent> <Leader>1 1<C-W><C-W>
nnoremap <silent> <Leader>2 2<C-W><C-W>
nnoremap <silent> <Leader>3 3<C-W><C-W>
nnoremap <silent> <Leader>4 4<C-W><C-W>
nnoremap <silent> <Leader>5 5<C-W><C-W>
nnoremap <silent> <Leader>6 6<C-W><C-W>
nnoremap <silent> <Leader>7 7<C-W><C-W>
nnoremap <silent> <Leader>8 8<C-W><C-W>
nnoremap <silent> <Leader>9 9<C-W><C-W>

let g:which_key_map = {}

" --- Main -------------------------------------------------------------------
nnoremap <Leader><Leader> :Commands<cr>
let g:which_key_map.1 = 'window-1'
let g:which_key_map.2 = 'window-2'
let g:which_key_map.3 = 'window-3'
let g:which_key_map.4 = 'window-4'
let g:which_key_map.5 = 'window-5'
let g:which_key_map.6 = 'window-6'
let g:which_key_map.7 = 'window-7'
let g:which_key_map.8 = 'window-8'
let g:which_key_map.9 = 'window-9'
map <Leader>; <Plug>Commentary
let g:which_key_map[';'] = 'Comment'

" --- Windows ----------------------------------------------------------------

" 2 and 3 column layout, can use some refinement
" nmap <Leader>w2 1<C-W><C-W><C-W>o:bfirst<CR><C-W>v:bnext<CR>
nmap <Leader>w2 :call TwoColumnLayout()<cr>
nmap <Leader>w3 1<C-W><C-W><C-W>o:bfirst<CR><C-W>v:bnext<CR><C-W>v:bnext<CR>
nmap <Leader>wo <C-W>o

function! TwoColumnLayout()
    let w = winnr('$')
    if w == 1
        exe "wincmd v"
        exe "wincmd w"
        exe "bnext"
        exe "wincmd w"
    elseif w >= 2
        while winnr('$') > 2
            exe winnr('$') . "wincmd c"
        endwhile
        exe "wincmd H"
        exe "wincmd ="
    endif
endfunction

let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window ☣']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : 'layout-double-columns 𐄗',
      \ '3' : 'layout-triple-columns',
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'o' : 'window-only',
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ 'r' : ['<C-W>r'     , 'rotate-windows']        ,
      \ 'R' : ['<C-W>R'     , 'rotate-windows-anti']   ,
      \ 'x' : ['<C-W>x'     , 'switch-windows']   ,
      \ }

" --- GIT --------------------------------------------------------------------
nmap <Leader>gs :G<CR>
nmap <Leader>gS :G stage<CR>
nmap <Leader>gc :G commit<CR>
nmap <Leader>gp :G push<CR>
nmap <Leader>gb :G blame<CR>
nmap <Leader>gd :Gdiffsplit<CR>
nmap <Leader>gl :G log<CR>

let g:which_key_map['g'] = {
      \ 'name' : '+git' ,
      \ 's' : 'git-status',
      \ 'S' : 'git-stage',
      \ 'c' : 'git-commit',
      \ 'p' : 'git-push',
      \ 'b' : 'git-blame',
      \ 'd' : 'git-diff',
      \ 'l' : 'git-log',
      \ }

" Key Binding     Description
" SPC g s     view git status
" SPC g S     stage current file
" SPC g U     unstage current file
" SPC g c     edit git commit
" SPC g p     git push
" SPC g m     git branch manager
" SPC g d     view git diff
" SPC g A     stage all files
" SPC g b     open git blame windows
" SPC g h a   stage current hunk
" SPC g h r   undo cursor hunk
" SPC g h v   preview cursor hunk

" --- Help -------------------------------------------------------------------
nnoremap <Leader>hh :Helptags<cr>
nnoremap <Leader>hm :Maps<cr>

" --- Toggles ----------------------------------------------------------------
nnoremap <Leader>tp :set paste!<cr>
nnoremap <Leader>tr :setlocal relativenumber!<cr>
nnoremap <Leader>tn :setlocal number!<cr>
nnoremap <Leader>ta :setlocal wrap!<cr>
nnoremap <Leader>tl :setlocal list!<cr>
nnoremap <Leader>tt :Telescope<cr>
nnoremap <Leader>tg :GoldenRatioToggle<cr>
nnoremap <Leader>tv :Vista!!<cr>
if has("nvim")
    nnoremap <Leader>tc :CHADopen<cr>
endif
nnoremap <Leader>tb :let &background = &background == "dark" ? "light" : "dark"<bar>redraw<cr>
nnoremap <Leader>tm :let &mouse = &mouse == "" ? "a" : ""<cr>
nnoremap <Leader>tw :let &textwidth = input("textwidth (". &textwidth ."): ")<bar>redraw<cr>
nnoremap <Leader>t_ :setlocal cursorline!<cr>
nnoremap <Leader>t- :setlocal cursorline!<cr>
nnoremap <Leader>t<Bar> :setlocal cursorcolumn!<cr>

let g:which_key_map['t'] = {
      \ 'name' : '+toggles',
      \ 'r'    : 'relative-number',
      \ 'n'    : 'number',
      \ 'a'    : 'wrap',
      \ 'l'    : 'list',
      \ 'b'    : 'background',
      \ 'm'    : 'mouse',
      \ 'w'    : 'textwidth',
      \ 't'    : 'telescope',
      \ 'v'    : 'toggle-vista',
      \ 'p'    : 'paste-mode',
      \ }

" --- Buffer -----------------------------------------------------------------
nnoremap <Leader>bN :new<cr>
let g:which_key_map.b = {
      \ 'name' : '+buffers' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'N' : 'new-buffer',
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ 'b' : ['Buffers'   , 'fzf-buffer']      ,
      \ }

" --- Files ------------------------------------------------------------------
nnoremap <Leader>ff :call fzf#run({'sink': 'e', 'down': '10'})<cr>
nnoremap <Leader>fed :e ~/.vimrc<cr>

let g:which_key_map.f = {
      \ 'name' : '+files',
      \ 's' :  [':w'   , 'save'],
      \ 'f' :  'open-files'
      \ }

call which_key#register('<Space>', "g:which_key_map")

" }}}
" ============================================================================
" FUNCTIONS & COMMANDS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" :CSfold
" ----------------------------------------------------------------------------
function! CSFold()
    normal zE
    setlocal foldmethod=manual
    setlocal foldcolumn=5
    g/\v(^\s*(public|private)[^()]*\([^()]*\)(\s|\n)*)@<=\{/normal 0zfiB<CR>
    g/\v(class\s.*(\s|\n)*)@<=\{/normal 0zfiB<CR>
    normal zR
endfunction

if exists("xxxxxxxxxxxxxxx")
    let g:fold_options = {
                \ 'fold_blank': 0,
                \ 'fold_includes': 0,
                \ 'max_foldline_length': 'win',
                \ 'merge_comments' : 1,
                \ 'show_if_and_else': 1,
                \ 'strip_namespaces': 1,
                \ 'strip_template_arguments': 1,
                \ }
endif

" ----------------------------------------------------------------------------
" :NL
" ----------------------------------------------------------------------------
command! -range=% -nargs=1 NL
  \ <line1>,<line2>!nl -w <args> -s '. ' | perl -pe 's/^.{<args>}..$//'

" ----------------------------------------------------------------------------
" :Chomp
" ----------------------------------------------------------------------------
command! Chomp %s/\s\+$// | normal! ``

" ----------------------------------------------------------------------------
" :Count
" ----------------------------------------------------------------------------
command! -nargs=1 Count execute printf('%%s/%s//gn', escape(<q-args>, '/')) | normal! ``

" ----------------------------------------------------------------------------
" :M
" ----------------------------------------------------------------------------
command! M execute printf('!bundle exec m %s:%d', expand('%'), line('.'))

" ----------------------------------------------------------------------------
" :Vb
" ----------------------------------------------------------------------------
command! Vb normal! <C-v>

" ----------------------------------------------------------------------------
" :CopyRTF
" ----------------------------------------------------------------------------
function! s:colors(...)
  return filter(map(filter(split(globpath(&rtp, 'colors/*.vim'), "\n"),
        \                  'v:val !~ "^/usr/"'),
        \           'fnamemodify(v:val, ":t:r")'),
        \       '!a:0 || stridx(v:val, a:1) >= 0')
endfunction

function! s:copy_rtf(line1, line2, ...)
  let [ft, cs, nu] = [&filetype, g:colors_name, &l:nu]
  let lines = getline(1, '$')

  tab new
  setlocal buftype=nofile bufhidden=wipe nonumber
  let &filetype = ft
  call setline(1, lines)
  doautocmd BufNewFile filetypedetect

  execute 'colo' get(a:000, 0, 'seoul256-light')
  hi Normal ctermbg=NONE guibg=NONE

  let lines = getline(a:line1, a:line2)
  let indent = repeat(' ', min(map(filter(copy(lines), '!empty(v:val)'), 'len(matchstr(v:val, "^ *"))')))
  call setline(a:line1, map(lines, 'substitute(v:val, indent, "", "")'))

  call tohtml#Convert2HTML(a:line1, a:line2)
  g/^\(pre\|body\) {/s/background-color: #[0-9]*; //
  silent %write !textutil -convert rtf -textsizemultiplier 1.3 -stdin -stdout | ruby -e 'puts STDIN.read.sub(/\\\n}$/m, "\n}")' | pbcopy

  bd!
  tabclose

  let &l:nu = nu
  execute 'colorscheme' cs
endfunction

if s:darwin
  command! -range=% -nargs=? -complete=customlist,s:colors CopyRTF call s:copy_rtf(<line1>, <line2>, <f-args>)
endif

" ----------------------------------------------------------------------------
" :Root | Change directory to the root of the Git repository
" ----------------------------------------------------------------------------
function! s:root()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echo 'Not in git repo'
  else
    execute 'lcd' root
    echo 'Changed directory to: '.root
  endif
endfunction
command! Root call s:root()

" ----------------------------------------------------------------------------
" <F5> / <F6> | Run script
" ----------------------------------------------------------------------------
function! s:run_this_script(output)
  let head   = getline(1)
  let pos    = stridx(head, '#!')
  let file   = expand('%:p')
  let ofile  = tempname()
  let rdr    = ' 2>&1 | tee '.ofile
  let win    = winnr()
  let prefix = a:output ? 'silent !' : '!'
  " Shebang found
  if pos != -1
    execute prefix.strpart(head, pos + 2).' '.file.rdr
  " Shebang not found but executable
  elseif executable(file)
    execute prefix.file.rdr
  elseif &filetype == 'ruby'
    execute prefix.'/usr/bin/env ruby '.file.rdr
  elseif &filetype == 'tex'
    execute prefix.'latex '.file. '; [ $? -eq 0 ] && xdvi '. expand('%:r').rdr
  elseif &filetype == 'dot'
    let svg = expand('%:r') . '.svg'
    let png = expand('%:r') . '.png'
    " librsvg >> imagemagick + ghostscript
    execute 'silent !dot -Tsvg '.file.' -o '.svg.' && '
          \ 'rsvg-convert -z 2 '.svg.' > '.png.' && open '.png.rdr
  else
    return
  end
  redraw!
  if !a:output | return | endif

  " Scratch buffer
  if exists('s:vim_exec_buf') && bufexists(s:vim_exec_buf)
    execute bufwinnr(s:vim_exec_buf).'wincmd w'
    %d
  else
    silent!  bdelete [vim-exec-output]
    silent!  vertical botright split new
    silent!  file [vim-exec-output]
    setlocal buftype=nofile bufhidden=wipe noswapfile
    let      s:vim_exec_buf = winnr()
  endif
  execute 'silent! read' ofile
  normal! gg"_dd
  execute win.'wincmd w'
endfunction
nnoremap <silent> <F5> :call <SID>run_this_script(0)<cr>
nnoremap <silent> <F6> :call <SID>run_this_script(1)<cr>

" ----------------------------------------------------------------------------
" <F8> | Color scheme selector
" ----------------------------------------------------------------------------
function! s:rotate_colors()
  if !exists('s:colors')
    let s:colors = s:colors()
  endif
  let name = remove(s:colors, 0)
  call add(s:colors, name)
  execute 'colorscheme' name
  redraw
  echo name
endfunction
nnoremap <silent> <F8> :call <SID>rotate_colors()<cr>

" ----------------------------------------------------------------------------
" :Shuffle | Shuffle selected lines
" ----------------------------------------------------------------------------
function! s:shuffle() range
ruby << RB
  first, last = %w[a:firstline a:lastline].map { |e| VIM::evaluate(e).to_i }
  (first..last).map { |l| $curbuf[l] }.shuffle.each_with_index do |line, i|
    $curbuf[first + i] = line
  end
RB
endfunction
command! -range Shuffle <line1>,<line2>call s:shuffle()

" ----------------------------------------------------------------------------
" Syntax highlighting in code snippets
" ----------------------------------------------------------------------------
function! s:syntax_include(lang, b, e, inclusive)
  let syns = split(globpath(&rtp, "syntax/".a:lang.".vim"), "\n")
  if empty(syns)
    return
  endif

  if exists('b:current_syntax')
    let csyn = b:current_syntax
    unlet b:current_syntax
  endif

  let z = "'" " Default
  for nr in range(char2nr('a'), char2nr('z'))
    let char = nr2char(nr)
    if a:b !~ char && a:e !~ char
      let z = char
      break
    endif
  endfor

  silent! exec printf('syntax include @%s %s', a:lang, syns[0])
  if a:inclusive
    exec printf('syntax region %sSnip start=%s\(%s\)\@=%s ' .
                \ 'end=%s\(%s\)\@<=\(\)%s contains=@%s containedin=ALL',
                \ a:lang, z, a:b, z, z, a:e, z, a:lang)
  else
    exec printf('syntax region %sSnip matchgroup=Snip start=%s%s%s ' .
                \ 'end=%s%s%s contains=@%s containedin=ALL',
                \ a:lang, z, a:b, z, z, a:e, z, a:lang)
  endif

  if exists('csyn')
    let b:current_syntax = csyn
  endif
endfunction

function! s:file_type_handler()
  if &ft =~ 'jinja' && &ft != 'jinja'
    call s:syntax_include('jinja', '{{', '}}', 1)
    call s:syntax_include('jinja', '{%', '%}', 1)
  elseif &ft =~ 'mkd\|markdown'
    for lang in ['ruby', 'yaml', 'vim', 'sh', 'bash=sh', 'python', 'java', 'c',
          \ 'clojure', 'clj=clojure', 'scala', 'sql', 'gnuplot', 'json=javascript']
      call s:syntax_include(split(lang, '=')[-1], '```'.split(lang, '=')[0], '```', 0)
    endfor

    highlight def link Snip Folded
    setlocal textwidth=78
    setlocal completefunc=emoji#complete
  elseif &ft == 'sh'
    call s:syntax_include('ruby', '#!ruby', '/\%$', 1)
  endif
endfunction

" ----------------------------------------------------------------------------
" SaveMacro / LoadMacro
" ----------------------------------------------------------------------------
function! s:save_macro(name, file)
  let content = eval('@'.a:name)
  if !empty(content)
    call writefile(split(content, "\n"), a:file)
    echom len(content) . ' bytes save to '. a:file
  endif
endfunction
command! -nargs=* SaveMacro call <SID>save_macro(<f-args>)

function! s:load_macro(file, name)
  let data = join(readfile(a:file), "\n")
  call setreg(a:name, data, 'c')
  echom 'Macro loaded to @'. a:name
endfunction
command! -nargs=* LoadMacro call <SID>load_macro(<f-args>)

" ----------------------------------------------------------------------------
" HL | Find out syntax group
" ----------------------------------------------------------------------------
function! s:hl()
  " echo synIDattr(synID(line('.'), col('.'), 0), 'name')
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction
command! HL call <SID>hl()

" ----------------------------------------------------------------------------
" :A
" ----------------------------------------------------------------------------
function! s:a(cmd)
  let name = expand('%:r')
  let ext = tolower(expand('%:e'))
  let sources = ['c', 'cc', 'cpp', 'cxx']
  let headers = ['h', 'hh', 'hpp', 'hxx']
  for pair in [[sources, headers], [headers, sources]]
    let [set1, set2] = pair
    if index(set1, ext) >= 0
      for h in set2
        let aname = name.'.'.h
        for a in [aname, toupper(aname)]
          if filereadable(a)
            execute a:cmd a
            return
          end
        endfor
      endfor
    endif
  endfor
endfunction
command! A call s:a('e')
command! AV call s:a('botright vertical split')

" ----------------------------------------------------------------------------
" Todo
" ----------------------------------------------------------------------------
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -niI -e TODO -e FIXME -e XXX 2> /dev/null',
            \ 'grep -rniI -e TODO -e FIXME -e XXX * 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction
command! Todo call s:todo()

" ----------------------------------------------------------------------------
" ConnectChrome
" ----------------------------------------------------------------------------
if s:darwin
  function! s:connect_chrome(bang)
    augroup connect-chrome
      autocmd!
      if !a:bang
        autocmd BufWritePost <buffer> call system(join([
        \ "osascript -e 'tell application \"Google Chrome\"".
        \               "to tell the active tab of its first window\n",
        \ "  reload",
        \ "end tell'"], "\n"))
      endif
    augroup END
  endfunction
  command! -bang ConnectChrome call s:connect_chrome(<bang>0)
endif

" ----------------------------------------------------------------------------
" AutoSave
" ----------------------------------------------------------------------------
function! s:autosave(enable)
  augroup autosave
    autocmd!
    if a:enable
      autocmd TextChanged,InsertLeave <buffer>
            \  if empty(&buftype) && !empty(bufname(''))
            \|   silent! update
            \| endif
    endif
  augroup END
endfunction

command! -bang AutoSave call s:autosave(<bang>1)

" ----------------------------------------------------------------------------
" TX
" ----------------------------------------------------------------------------
command! -nargs=1 TX
  \ call system('tmux split-window -d -l 16 '.<q-args>)
cnoremap !! TX<space>
command! GP TX git push

" ----------------------------------------------------------------------------
" EX | chmod +x
" ----------------------------------------------------------------------------
command! EX if !empty(expand('%'))
         \|   write
         \|   call system('chmod +x '.expand('%'))
         \|   silent e
         \| else
         \|   echohl WarningMsg
         \|   echo 'Save the file first'
         \|   echohl None
         \| endif

" ----------------------------------------------------------------------------
" Profile
" ----------------------------------------------------------------------------
function! s:profile(bang)
  if a:bang
    profile pause
    noautocmd qall
  else
    profile start /tmp/profile.log
    profile func *
    profile file *
  endif
endfunction
command! -bang Profile call s:profile(<bang>0)

" ----------------------------------------------------------------------------
" call LSD()
" ----------------------------------------------------------------------------
function! LSD()
  syntax clear

  for i in range(16, 255)
    execute printf('highlight LSD%s ctermfg=%s', i - 16, i)
  endfor

  let block = 4
  for l in range(1, line('$'))
    let c = 1
    let max = len(getline(l))
    while c < max
      let stride = 4 + reltime()[1] % 8
      execute printf('syntax region lsd%s_%s start=/\%%%sl\%%%sc/ end=/\%%%sl\%%%sc/ contains=ALL', l, c, l, c, l, min([c + stride, max]))
      let rand = abs(reltime()[1] % (256 - 16))
      execute printf('hi def link lsd%s_%s LSD%s', l, c, rand)
      let c += stride
    endwhile
  endfor
endfunction

" ----------------------------------------------------------------------------
" Open FILENAME:LINE:COL
" ----------------------------------------------------------------------------

function! s:goto_line()
  let tokens = split(expand('%'), ':')
  if len(tokens) <= 1 || !filereadable(tokens[0])
    return
  endif

  let file = tokens[0]
  let rest = map(tokens[1:], 'str2nr(v:val)')
  let line = get(rest, 0, 1)
  let col  = get(rest, 1, 1)
  bd!
  silent execute 'e' file
  execute printf('normal! %dG%d|', line, col)
endfunction

" ----------------------------------------------------------------------------
" co? : Toggle options (inspired by unimpaired.vim)
" ----------------------------------------------------------------------------
function! s:map_change_option(...)
  let [key, opt] = a:000[0:1]
  let op = get(a:, 3, 'set '.opt.'!')
  execute printf('nnoremap co%s :%s<bar>set %s?<cr>', key, op, opt)
endfunction

call s:map_change_option('p', 'paste')
call s:map_change_option('n', 'number')
call s:map_change_option('w', 'wrap')
call s:map_change_option('h', 'hlsearch')
call s:map_change_option('m', 'mouse', 'let &mouse = &mouse == "" ? "a" : ""')
call s:map_change_option('t', 'textwidth',
    \ 'let &textwidth = input("textwidth (". &textwidth ."): ")<bar>redraw')
call s:map_change_option('b', 'background',
    \ 'let &background = &background == "dark" ? "light" : "dark"<bar>redraw')

" ----------------------------------------------------------------------------
" <Leader>?/! | Google it / Feeling lucky
" ----------------------------------------------------------------------------
function! s:goog(pat, lucky)
  let q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
  let q = substitute(q, '[[:punct:] ]',
       \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  call system(printf('open "https://www.google.com/search?%sq=%s"',
                   \ a:lucky ? 'btnI&' : '', q))
endfunction

nnoremap <Leader>? :call <SID>goog(expand("<cWORD>"), 0)<cr>
nnoremap <Leader>! :call <SID>goog(expand("<cWORD>"), 1)<cr>
xnoremap <Leader>? "gy:call <SID>goog(@g, 0)<cr>gv
xnoremap <Leader>! "gy:call <SID>goog(@g, 1)<cr>gv

" }}}
" ============================================================================
" TEXT OBJECTS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" Common
" ----------------------------------------------------------------------------
function! s:textobj_cancel()
  if v:operator == 'c'
    augroup textobj_undo_empty_change
      autocmd InsertLeave <buffer> execute 'normal! u'
            \| execute 'autocmd! textobj_undo_empty_change'
            \| execute 'augroup! textobj_undo_empty_change'
    augroup END
  endif
endfunction

noremap         <Plug>(TOC) <nop>
inoremap <expr> <Plug>(TOC) exists('#textobj_undo_empty_change')?"\<esc>":''

" ----------------------------------------------------------------------------
" ?ii / ?ai | indent-object
" ?io       | strictly-indent-object
" ----------------------------------------------------------------------------
function! s:indent_len(str)
  return type(a:str) == 1 ? len(matchstr(a:str, '^\s*')) : 0
endfunction

function! s:indent_object(op, skip_blank, b, e, bd, ed)
  let i = min([s:indent_len(getline(a:b)), s:indent_len(getline(a:e))])
  let x = line('$')
  let d = [a:b, a:e]

  if i == 0 && empty(getline(a:b)) && empty(getline(a:e))
    let [b, e] = [a:b, a:e]
    while b > 0 && e <= line('$')
      let b -= 1
      let e += 1
      let i = min(filter(map([b, e], 's:indent_len(getline(v:val))'), 'v:val != 0'))
      if i > 0
        break
      endif
    endwhile
  endif

  for triple in [[0, 'd[o] > 1', -1], [1, 'd[o] < x', +1]]
    let [o, ev, df] = triple

    while eval(ev)
      let line = getline(d[o] + df)
      let idt = s:indent_len(line)

      if eval('idt '.a:op.' i') && (a:skip_blank || !empty(line)) || (a:skip_blank && empty(line))
        let d[o] += df
      else | break | end
    endwhile
  endfor
  execute printf('normal! %dGV%dG', max([1, d[0] + a:bd]), min([x, d[1] + a:ed]))
endfunction
xnoremap <silent> ii :<c-u>call <SID>indent_object('>=', 1, line("'<"), line("'>"), 0, 0)<cr>
onoremap <silent> ii :<c-u>call <SID>indent_object('>=', 1, line('.'), line('.'), 0, 0)<cr>
xnoremap <silent> ai :<c-u>call <SID>indent_object('>=', 1, line("'<"), line("'>"), -1, 1)<cr>
onoremap <silent> ai :<c-u>call <SID>indent_object('>=', 1, line('.'), line('.'), -1, 1)<cr>
xnoremap <silent> io :<c-u>call <SID>indent_object('==', 0, line("'<"), line("'>"), 0, 0)<cr>
onoremap <silent> io :<c-u>call <SID>indent_object('==', 0, line('.'), line('.'), 0, 0)<cr>

" ----------------------------------------------------------------------------
" <Leader>I/A | Prepend/Append to all adjacent lines with same indentation
" ----------------------------------------------------------------------------
nmap <silent> <Leader>I ^vio<C-V>I
nmap <silent> <Leader>A ^vio<C-V>$A

" ----------------------------------------------------------------------------
" ?i_ ?a_ ?i. ?a. ?i, ?a, ?i/
" ----------------------------------------------------------------------------
function! s:between_the_chars(incll, inclr, char, vis)
  let cursor = col('.')
  let line   = getline('.')
  let before = line[0 : cursor - 1]
  let after  = line[cursor : -1]
  let [b, e] = [cursor, cursor]

  try
    let i = stridx(join(reverse(split(before, '\zs')), ''), a:char)
    if i < 0 | throw 'exit' | end
    let b = len(before) - i + (a:incll ? 0 : 1)

    let i = stridx(after, a:char)
    if i < 0 | throw 'exit' | end
    let e = cursor + i + 1 - (a:inclr ? 0 : 1)

    execute printf('normal! 0%dlhv0%dlh', b, e)
  catch 'exit'
    call s:textobj_cancel()
    if a:vis
      normal! gv
    endif
  finally
    " Cleanup command history
    if histget(':', -1) =~ '<SNR>[0-9_]*between_the_chars('
      call histdel(':', -1)
    endif
    echo
  endtry
endfunction

for [s:c, s:l] in items({'_': 0, '.': 0, ',': 0, '/': 1, '-': 0})
  execute printf("xmap <silent> i%s :<C-U>call <SID>between_the_chars(0,  0, '%s', 1)<CR><Plug>(TOC)", s:c, s:c)
  execute printf("omap <silent> i%s :<C-U>call <SID>between_the_chars(0,  0, '%s', 0)<CR><Plug>(TOC)", s:c, s:c)
  execute printf("xmap <silent> a%s :<C-U>call <SID>between_the_chars(%s, 1, '%s', 1)<CR><Plug>(TOC)", s:c, s:l, s:c)
  execute printf("omap <silent> a%s :<C-U>call <SID>between_the_chars(%s, 1, '%s', 0)<CR><Plug>(TOC)", s:c, s:l, s:c)
endfor

" ----------------------------------------------------------------------------
" ?ie | entire object
" ----------------------------------------------------------------------------
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<CR>

" ----------------------------------------------------------------------------
" ?il | inner line
" ----------------------------------------------------------------------------
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<CR>

onoremap <silent> al :<C-U>normal! 0vj<CR>

" ----------------------------------------------------------------------------
" ?i# | inner comment
" ----------------------------------------------------------------------------
function! s:inner_comment(vis)
  if synIDattr(synID(line('.'), col('.'), 0), 'name') !~? 'comment'
    call s:textobj_cancel()
    if a:vis
      normal! gv
    endif
    return
  endif

  let origin = line('.')
  let lines = []
  for dir in [-1, 1]
    let line = origin
    let line += dir
    while line >= 1 && line <= line('$')
      execute 'normal!' line.'G^'
      if synIDattr(synID(line('.'), col('.'), 0), 'name') !~? 'comment'
        break
      endif
      let line += dir
    endwhile
    let line -= dir
    call add(lines, line)
  endfor

  execute 'normal!' lines[0].'GV'.lines[1].'G'
endfunction
xmap <silent> i# :<C-U>call <SID>inner_comment(1)<CR><Plug>(TOC)
omap <silent> i# :<C-U>call <SID>inner_comment(0)<CR><Plug>(TOC)

" ----------------------------------------------------------------------------
" ?ic / ?iC | Blockwise column object
" ----------------------------------------------------------------------------
function! s:inner_blockwise_column(vmode, cmd)
  if a:vmode == "\<C-V>"
    let [pvb, pve] = [getpos("'<"), getpos("'>")]
    normal! `z
  endif

  execute "normal! \<C-V>".a:cmd."o\<C-C>"
  let [line, col] = [line('.'), col('.')]
  let [cb, ce]    = [col("'<"), col("'>")]
  let [mn, mx]    = [line, line]

  for dir in [1, -1]
    let l = line + dir
    while line('.') > 1 && line('.') < line('$')
      execute 'normal! '.l.'G'.col.'|'
      execute 'normal! v'.a:cmd.'\<C-C>'
      if cb != col("'<") || ce != col("'>")
        break
      endif
      let [mn, mx] = [min([line('.'), mn]), max([line('.'), mx])]
      let l += dir
    endwhile
  endfor

  execute printf("normal! %dG%d|\<C-V>%s%dG", mn, col, a:cmd, mx)

  if a:vmode == "\<C-V>"
    normal! o
    if pvb[1] < line('.') | execute 'normal! '.pvb[1].'G' | endif
    if pvb[2] < col('.')  | execute 'normal! '.pvb[2].'|' | endif
    normal! o
    if pve[1] > line('.') | execute 'normal! '.pve[1].'G' | endif
    if pve[2] > col('.')  | execute 'normal! '.pve[2].'|' | endif
  endif
endfunction

xnoremap <silent> ic mz:<C-U>call <SID>inner_blockwise_column(visualmode(), 'iw')<CR>
xnoremap <silent> iC mz:<C-U>call <SID>inner_blockwise_column(visualmode(), 'iW')<CR>
xnoremap <silent> ac mz:<C-U>call <SID>inner_blockwise_column(visualmode(), 'aw')<CR>
xnoremap <silent> aC mz:<C-U>call <SID>inner_blockwise_column(visualmode(), 'aW')<CR>
onoremap <silent> ic :<C-U>call   <SID>inner_blockwise_column('',           'iw')<CR>
onoremap <silent> iC :<C-U>call   <SID>inner_blockwise_column('',           'iW')<CR>
onoremap <silent> ac :<C-U>call   <SID>inner_blockwise_column('',           'aw')<CR>
onoremap <silent> aC :<C-U>call   <SID>inner_blockwise_column('',           'aW')<CR>

" ----------------------------------------------------------------------------
" ?i<shift>-` | Inside ``` block
" ----------------------------------------------------------------------------
xnoremap <silent> i~ g_?^\s*```<cr>jo/^\s*```<cr>kV:<c-u>nohl<cr>gv
xnoremap <silent> a~ g_?^\s*```<cr>o/^\s*```<cr>V:<c-u>nohl<cr>gv
onoremap <silent> i~ :<C-U>execute "normal vi~"<cr>
onoremap <silent> a~ :<C-U>execute "normal va~"<cr>

" }}}
" ============================================================================
" Autocommands {{{
" ============================================================================

function! VimLogoSyntax()
    syntax match VimLogo /\v(^"[ /\\V|'_+]+)@<=\++/
    highlight VimLogo guifg=#20963e
    syntax match VimLogoV /\v(^"[ +|/\\'V]+)@<=V+/
    highlight VimLogoV guifg=#999999
    syn cluster vimCommentGroup	contains=vimTodo,@Spell,VimLogo,VimLogoV

    syntax match VimLogoRc /\v(%9l|%3l|%4l|%5l|%6l|%7l|%8l)[|'`l<1:._-](%>78c)@!/
    highlight VimLogoRc guifg=#FFFFFF
    syn cluster vimCommentGroup	contains=vimTodo,@Spell,VimLogo,VimLogoV,VimLogoRc
endfunction

augroup vimrc
    autocmd!
    autocmd! BufWritePost $MYVIMRC source $MYVIMRC
    autocmd! BufWritePost ~/.vimrc source ~/.vimrc | call VimLogoSyntax()
    autocmd! BufWritePost ~/.config/nvim/vimrc source ~/.config/nvim/vimrc | call VimLogoSyntax()
    autocmd! BufWritePost ~/.vim.py py3file ~/.vim.py


    autocmd! BufReadPost *.py setlocal signcolumn=yes
    autocmd! BufReadPost ~/.vimrc call VimLogoSyntax()
    autocmd! BufReadPost ~/.config/nvim/vimrc call VimLogoSyntax()

    autocmd FileType vim setlocal commentstring=\"\ %s
    autocmd FileType make setlocal noexpandtab
    autocmd FileType rust setlocal makeprg=cargo\ build

    " autocmd vimrc BufNewFile * nested call s:goto_line()

    autocmd BufNewFile,BufRead *.cs compiler csc
    autocmd BufWritePost *.htmlt silent :cd %:h
    autocmd BufWritePost *.htmlt call GenerateTemplate()

    autocmd BufRead,BufNewFile *.htmlt set filetype=htmlt
    autocmd Syntax htmlt source ~/vimfiles/syntax/htmlt.vim
augroup END

" Use actual tab chars in Makefiles.
augroup MakeFile
    autocmd!
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
augroup END

" }}}
" ============================================================================
" Random stuff {{{
" ============================================================================
if has("unix")
    " Need to think this though. It does not seems to work in all cases.
    " --> the reason is that the endwise plugin remaps enter, but
    "  doesn't play well with <expr> mappings

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <expr><Enter> pumvisible() ? "\<C-y>" : "<Enter>"
    "inoremap <expr><Esc> pumvisible() ? "\<C-e>" : "<Esc>"

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
endif

" Cycle through windows using tab
" nnoremap <tab> :wincmd w<cr>
" nnoremap <s-tab> :wincmd W<cr>

" }}}
" ============================================================================
" PlugINS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" vim-Plug extension
" ----------------------------------------------------------------------------

function! s:Plug_gx()
  let line = getline('.')
  let sha  = matchstr(line, '^  \X*\zs\x\{7,9}\ze ')
  let name = empty(sha) ? matchstr(line, '^[-x+] \zs[^:]\+\ze:')
                      \ : getline(search('^- .*:$', 'bn'))[2:-2]
  let uri  = get(get(g:plugs, name, {}), 'uri', '')
  if uri !~ 'github.com'
    return
  endif
  let repo = matchstr(uri, '[^:/]*/'.name)
  let url  = empty(sha) ? 'https://github.com/'.repo
                      \ : printf('https://github.com/%s/commit/%s', repo, sha)
  call netrw#BrowseX(url, 0)
endfunction

function! s:scroll_preview(down)
  silent! wincmd P
  if &previewwindow
    execute 'normal!' a:down ? "\<c-e>" : "\<c-y>"
    wincmd p
  endif
endfunction

function! s:Plug_doc()
  let name = matchstr(getline('.'), '^- \zs\S\+\ze:')
  if has_key(g:plugs, name)
    for doc in split(globpath(g:plugs[name].dir, 'doc/*.txt'), '\n')
      execute 'tabe' doc
    endfor
  endif
endfunction

function! s:setup_extra_keys()
  " PlugDiff
  nnoremap <silent> <buffer> J :call <sid>scroll_preview(1)<cr>
  nnoremap <silent> <buffer> K :call <sid>scroll_preview(0)<cr>
  nnoremap <silent> <buffer> <c-n> :call search('^  \X*\zs\x')<cr>
  nnoremap <silent> <buffer> <c-p> :call search('^  \X*\zs\x', 'b')<cr>
  nmap <silent> <buffer> <c-j> <c-n>o
  nmap <silent> <buffer> <c-k> <c-p>o

  " gx
  nnoremap <buffer> <silent> gx :call <sid>Plug_gx()<cr>

  " helpdoc
  nnoremap <buffer> <silent> H  :call <sid>Plug_doc()<cr>
endfunction

autocmd vimrc FileType vim-Plug call s:setup_extra_keys()

let g:plug_window = '-tabnew'
let g:plug_pwindow = 'vertical rightbelow new'

" ----------------------------------------------------------------------------
" MatchParen delay
" ----------------------------------------------------------------------------
let g:matchparen_insert_timeout=5

" ----------------------------------------------------------------------------
" matchit.vim
" ----------------------------------------------------------------------------
runtime macros/matchit.vim

" ----------------------------------------------------------------------------
" <Enter> | vim-easy-align
" ----------------------------------------------------------------------------

let g:easy_align_delimiters = {
      \ '>': { 'pattern': '>>\|=>\|>' },
      \ '\': { 'pattern': '\\' },
      \ '/': { 'pattern': '//\+\|/\*\|\*/', 'delimiter_align': 'l', 'ignore_groups': ['!Comment'] },
      \ ']': {
      \     'pattern':       '\]\zs',
      \     'left_margin':   0,
      \     'right_margin':  1,
      \     'stick_to_left': 0
      \   },
      \ ')': {
      \     'pattern':       ')\zs',
      \     'left_margin':   0,
      \     'right_margin':  1,
      \     'stick_to_left': 0
      \   },
      \ 'f': {
      \     'pattern': ' \(\S\+(\)\@=',
      \     'left_margin': 0,
      \     'right_margin': 0
      \   },
      \ 'd': {
      \     'pattern': ' \ze\S\+\s*[;=]',
      \     'left_margin': 0,
      \     'right_margin': 0
      \   }
      \ }

" Start interactive EasyAlign in visual mode
xmap ga <Plug>(LiveEasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap ga <Plug>(LiveEasyAlign)
nmap gaa ga_

xmap <Leader>ga <Plug>(LiveEasyAlign)

" ----------------------------------------------------------------------------
" goyo.vim + limelight.vim
" ----------------------------------------------------------------------------

if exists("g:loaded_limelight")
  let g:limelight_paragraph_span = 1
  let g:limelight_priority = -1

  function! s:goyo_enter()
    if has('gui_running')
      set fullscreen
      set background=light
      set linespace=7
    elseif exists('$TMUX')
      silent !tmux set status off
    endif
    Limelight
    let &l:statusline = '%M'
    hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
  endfunction

  function! s:goyo_leave()
    if has('gui_running')
      set nofullscreen
      set background=dark
      set linespace=0
    elseif exists('$TMUX')
      silent !tmux set status on
    endif
    Limelight!
  endfunction

  augroup Goyo
    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
  augroup END
endif

" nnoremap <Leader>G :Goyo<CR>

" ----------------------------------------------------------------------------
" airline
" ----------------------------------------------------------------------------

if exists("g:loaded_airline")
  let g:airline_round_numbers = ['*', '❶', '❷', '❸', '❹', '❺', '❻', '❼', '❽', '❾', '❿']
  function Airline_window_number()
    let window_number = tabpagewinnr(tabpagenr())
    if window_number >= len(g:airline_round_numbers)
      return window_number
    endif

    return g:airline_round_numbers[tabpagewinnr(tabpagenr())]
  endfunction

  function! WindowNumber(...)
    let builder = a:1
    let context = a:2
    let number_string = ' %{airline_round_numbers[tabpagewinnr(tabpagenr())]} '
    let number_string = ' %{Airline_window_number()} '

    call builder.add_section('airline_b', number_string)
    return 0
  endfunction

  if !exists("g:airline_winnr_added")
    call airline#add_statusline_func('WindowNumber')
    call airline#add_inactive_statusline_func('WindowNumber')
    let g:airline_winnr_added = 1
  endif
endif

" ----------------------------------------------------------------------------
" Vista
" ----------------------------------------------------------------------------

let g:unicode_circled = {
     \  '1': '①', '2':  '②', '3':  '③', '4':  '④', '5':  '⑤',
     \  '6': '⑥', '7':  '⑦', '8':  '⑧', '9':  '⑨', '10': '⑩',
     \ '11': '⑪', '12': '⑫', '13': '⑬', '14': '⑭', '15': '⑮',
     \ '16': '⑯', '17': '⑰', '18': '⑱', '19': '⑲', '20': '⑳',
     \  'a': 'ⓐ', 'b':  'ⓑ', 'c':  'ⓒ', 'd':  'ⓓ', 'e':  'ⓔ',
     \  'f': 'ⓕ', 'g':  'ⓖ', 'h':  'ⓗ', 'i':  'ⓘ', 'j':  'ⓙ',
     \  'k': 'ⓚ', 'l':  'ⓛ', 'm':  'ⓜ', 'n':  'ⓝ', 'o':  'ⓞ',
     \  'p': 'ⓟ', 'q':  'ⓠ', 'r':  'ⓡ', 's':  'ⓢ', 't':  'ⓣ',
     \  'u': 'ⓤ', 'v':  'ⓥ', 'w':  'ⓦ', 'x':  'ⓧ', 'y':  'ⓨ',
     \  'z': 'ⓩ', 'A':  'Ⓐ', 'B':  'Ⓑ', 'C':  'Ⓒ', 'D':  'Ⓓ',
     \  'E': 'Ⓔ', 'F':  'Ⓕ', 'G':  'Ⓖ', 'H':  'Ⓗ', 'I':  'Ⓘ',
     \  'J': 'Ⓙ', 'K':  'Ⓚ', 'L':  'Ⓛ', 'M':  'Ⓜ', 'N':  'Ⓝ',
     \  'O': 'Ⓞ', 'P':  'Ⓟ', 'Q':  'Ⓠ', 'R':  'Ⓡ', 'S':  'Ⓢ',
     \  'T': 'Ⓣ', 'U':  'Ⓤ', 'V':  'Ⓥ', 'W':  'Ⓦ', 'X':  'Ⓧ',
     \  'Y': 'Ⓨ', 'Z':  'Ⓩ',
     \  }

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" ⓐ	9424	ⓐ	24D0	CIRCLED LATIN SMALL LETTER A
" ⓑ	9425	ⓑ	24D1	CIRCLED LATIN SMALL LETTER B
" ⓒ	9426	ⓒ	24D2	CIRCLED LATIN SMALL LETTER C
" ⓓ	9427	ⓓ	24D3	CIRCLED LATIN SMALL LETTER D
" ⓔ	9428	ⓔ	24D4	CIRCLED LATIN SMALL LETTER E
" ⓕ	9429	ⓕ	24D5	CIRCLED LATIN SMALL LETTER F
" ⓖ	9430	ⓖ	24D6	CIRCLED LATIN SMALL LETTER G
" ⓗ	9431	ⓗ	24D7	CIRCLED LATIN SMALL LETTER H
" ⓘ	9432	ⓘ	24D8	CIRCLED LATIN SMALL LETTER I
" ⓙ	9433	ⓙ	24D9	CIRCLED LATIN SMALL LETTER J
" ⓚ	9434	ⓚ	24DA	CIRCLED LATIN SMALL LETTER K
" ⓛ	9435	ⓛ	24DB	CIRCLED LATIN SMALL LETTER L
" ⓜ	9436	ⓜ	24DC	CIRCLED LATIN SMALL LETTER M
" ⓝ	9437	ⓝ	24DD	CIRCLED LATIN SMALL LETTER N
" ⓞ	9438	ⓞ	24DE	CIRCLED LATIN SMALL LETTER O
" ⓟ	9439	ⓟ	24DF	CIRCLED LATIN SMALL LETTER P
" ⓠ	9440	ⓠ	24E0	CIRCLED LATIN SMALL LETTER Q
" ⓡ	9441	ⓡ	24E1	CIRCLED LATIN SMALL LETTER R
" ⓢ	9442	ⓢ	24E2	CIRCLED LATIN SMALL LETTER S
" ⓣ	9443	ⓣ	24E3	CIRCLED LATIN SMALL LETTER T
" ⓤ	9444	ⓤ	24E4	CIRCLED LATIN SMALL LETTER U
" ⓥ	9445	ⓥ	24E5	CIRCLED LATIN SMALL LETTER V
" ⓦ	9446	ⓦ	24E6	CIRCLED LATIN SMALL LETTER W
" ⓧ	9447	ⓧ	24E7	CIRCLED LATIN SMALL LETTER X
" ⓨ	9448	ⓨ	24E8	CIRCLED LATIN SMALL LETTER Y
" ⓩ	9449	ⓩ	24E9	CIRCLED LATIN SMALL LETTER Z
" Ⓐ	9398	Ⓐ	24B6	CIRCLED LATIN CAPITAL LETTER A
" Ⓑ	9399	Ⓑ	24B7	CIRCLED LATIN CAPITAL LETTER B
" Ⓒ	9400	Ⓒ	24B8	CIRCLED LATIN CAPITAL LETTER C
" Ⓓ	9401	Ⓓ	24B9	CIRCLED LATIN CAPITAL LETTER D
" Ⓔ	9402	Ⓔ	24BA	CIRCLED LATIN CAPITAL LETTER E
" Ⓕ	9403	Ⓕ	24BB	CIRCLED LATIN CAPITAL LETTER F
" Ⓖ	9404	Ⓖ	24BC	CIRCLED LATIN CAPITAL LETTER G
" Ⓗ	9405	Ⓗ	24BD	CIRCLED LATIN CAPITAL LETTER H
" Ⓘ	9406	Ⓘ	24BE	CIRCLED LATIN CAPITAL LETTER I
" Ⓙ	9407	Ⓙ	24BF	CIRCLED LATIN CAPITAL LETTER J
" Ⓚ	9408	Ⓚ	24C0	CIRCLED LATIN CAPITAL LETTER K
" Ⓛ	9409	Ⓛ	24C1	CIRCLED LATIN CAPITAL LETTER L
" Ⓜ	9410	Ⓜ	24C2	CIRCLED LATIN CAPITAL LETTER M
" Ⓝ	9411	Ⓝ	24C3	CIRCLED LATIN CAPITAL LETTER N
" Ⓞ	9412	Ⓞ	24C4	CIRCLED LATIN CAPITAL LETTER O
" Ⓟ	9413	Ⓟ	24C5	CIRCLED LATIN CAPITAL LETTER P
" Ⓠ	9414	Ⓠ	24C6	CIRCLED LATIN CAPITAL LETTER Q
" Ⓡ	9415	Ⓡ	24C7	CIRCLED LATIN CAPITAL LETTER R
" Ⓢ	9416	Ⓢ	24C8	CIRCLED LATIN CAPITAL LETTER S
" Ⓣ	9417	Ⓣ	24C9	CIRCLED LATIN CAPITAL LETTER T
" Ⓤ	9418	Ⓤ	24CA	CIRCLED LATIN CAPITAL LETTER U
" Ⓥ	9419	Ⓥ	24CB	CIRCLED LATIN CAPITAL LETTER V
" Ⓦ	9420	Ⓦ	24CC	CIRCLED LATIN CAPITAL LETTER W
" Ⓧ	9421	Ⓧ	24CD	CIRCLED LATIN CAPITAL LETTER X
" Ⓨ	9422	Ⓨ	24CE	CIRCLED LATIN CAPITAL LETTER Y
" Ⓩ	9423	Ⓩ	24CF	CIRCLED LATIN CAPITAL LETTER
let g:vista#renderer#icons = {
\    'augroup'        : unicode_circled['a'],
\    'class'          : unicode_circled['C'],
\    'const'          : unicode_circled['c'],
\    'constant'       : unicode_circled['c'],
\    'default'        : unicode_circled['d'],
\    'enum'           : unicode_circled['E'],
\    'enumerator'     : unicode_circled['e'],
\    'field'          : unicode_circled['f'],
\    'fields'         : unicode_circled['f'],
\    'func'           : unicode_circled['F'],
\    'function'       : unicode_circled['F'],
\    'functions'      : unicode_circled['F'],
\    'implementation' : unicode_circled['i'],
\    'interface'      : unicode_circled['i'],
\    'macro'          : unicode_circled['m'],
\    'macros'         : unicode_circled['m'],
\    'map'            : unicode_circled['m'],
\    'member'         : unicode_circled['m'],
\    'method'         : unicode_circled['M'],
\    'module'         : unicode_circled['m'],
\    'modules'        : unicode_circled['m'],
\    'namespace'      : unicode_circled['n'],
\    'package'        : unicode_circled['p'],
\    'packages'       : unicode_circled['p'],
\    'property'       : unicode_circled['P'],
\    'struct'         : "🞲",
\    'subroutine'     : unicode_circled['s'],
\    'target'         : unicode_circled['t'],
\    'type'           : unicode_circled['T'],
\    'typeParameter'  : unicode_circled['t'],
\    'typedef'        : unicode_circled['t'],
\    'types'          : unicode_circled['t'],
\    'union'          : "🞸",
\    'var'            : unicode_circled['V'],
\    'variable'       : unicode_circled['V'],
\    'variables'      : unicode_circled['V'],
\}

"𐄀	65792	𐄀	10100	AEGEAN WORD SEPARATOR LINE
"𐄁	65793	𐄁	10101	AEGEAN WORD SEPARATOR DOT
"𐄂	65794	𐄂	10102	AEGEAN CHECK MARK
"𐄇	65799	𐄇	10107	AEGEAN NUMBER ONE
"𐄈	65800	𐄈	10108	AEGEAN NUMBER TWO
"𐄉	65801	𐄉	10109	AEGEAN NUMBER THREE
"𐄊	65802	𐄊	1010A	AEGEAN NUMBER FOUR
"𐄋	65803	𐄋	1010B	AEGEAN NUMBER FIVE
"𐄌	65804	𐄌	1010C	AEGEAN NUMBER SIX
"𐄍	65805	𐄍	1010D	AEGEAN NUMBER SEVEN
"𐄎	65806	𐄎	1010E	AEGEAN NUMBER EIGHT
"𐄏	65807	𐄏	1010F	AEGEAN NUMBER NINE
"𐄐	65808	𐄐	10110	AEGEAN NUMBER TEN
"𐄑	65809	𐄑	10111	AEGEAN NUMBER TWENTY
"𐄒	65810	𐄒	10112	AEGEAN NUMBER THIRTY
"𐄓	65811	𐄓	10113	AEGEAN NUMBER FORTY
"𐄔	65812	𐄔	10114	AEGEAN NUMBER FIFTY
"𐄕	65813	𐄕	10115	AEGEAN NUMBER SIXTY
"𐄖	65814	𐄖	10116	AEGEAN NUMBER SEVENTY
"𐄗	65815	𐄗	10117	AEGEAN NUMBER EIGHTY
"𐄘	65816	𐄘	10118	AEGEAN NUMBER NINETY
"𐄙	65817	𐄙	10119	AEGEAN NUMBER ONE HUNDRED
"𐄚	65818	𐄚	1011A	AEGEAN NUMBER TWO HUNDRED
"𐄛	65819	𐄛	1011B	AEGEAN NUMBER THREE HUNDRED
"𐄜	65820	𐄜	1011C	AEGEAN NUMBER FOUR HUNDRED
"𐄝	65821	𐄝	1011D	AEGEAN NUMBER FIVE HUNDRED
"𐄞	65822	𐄞	1011E	AEGEAN NUMBER SIX HUNDRED
"𐄟	65823	𐄟	1011F	AEGEAN NUMBER SEVEN HUNDRED
"𐄠	65824	𐄠	10120	AEGEAN NUMBER EIGHT HUNDRED
"𐄡	65825	𐄡	10121	AEGEAN NUMBER NINE HUNDRED
"𐄢	65826	𐄢	10122	AEGEAN NUMBER ONE THOUSAND
"𐄣	65827	𐄣	10123	AEGEAN NUMBER TWO THOUSAND
"𐄤	65828	𐄤	10124	AEGEAN NUMBER THREE THOUSAND
"𐄥	65829	𐄥	10125	AEGEAN NUMBER FOUR THOUSAND
"𐄦	65830	𐄦	10126	AEGEAN NUMBER FIVE THOUSAND
"𐄧	65831	𐄧	10127	AEGEAN NUMBER SIX THOUSAND
"𐄨	65832	𐄨	10128	AEGEAN NUMBER SEVEN THOUSAND
"𐄩	65833	𐄩	10129	AEGEAN NUMBER EIGHT THOUSAND
"𐄪	65834	𐄪	1012A	AEGEAN NUMBER NINE THOUSAND
"𐄫	65835	𐄫	1012B	AEGEAN NUMBER TEN THOUSAND
"𐄬	65836	𐄬	1012C	AEGEAN NUMBER TWENTY THOUSAND
"𐄭	65837	𐄭	1012D	AEGEAN NUMBER THIRTY THOUSAND
"𐄮	65838	𐄮	1012E	AEGEAN NUMBER FORTY THOUSAND
"𐄯	65839	𐄯	1012F	AEGEAN NUMBER FIFTY THOUSAND
"𐄰	65840	𐄰	10130	AEGEAN NUMBER SIXTY THOUSAND
"𐄱	65841	𐄱	10131	AEGEAN NUMBER SEVENTY THOUSAND
"𐄲	65842	𐄲	10132	AEGEAN NUMBER EIGHTY THOUSAND
"𐄳	65843	𐄳	10133	AEGEAN NUMBER NINETY THOUSAND
"𐄷	65847	𐄷	10137	AEGEAN WEIGHT BASE UNIT
"𐄸	65848	𐄸	10138	AEGEAN WEIGHT FIRST SUBUNIT
"𐄹	65849	𐄹	10139	AEGEAN WEIGHT SECOND SUBUNIT
"𐄺	65850	𐄺	1013A	AEGEAN WEIGHT THIRD SUBUNIT
"𐄻	65851	𐄻	1013B	AEGEAN WEIGHT FOURTH SUBUNIT
"𐄼	65852	𐄼	1013C	AEGEAN DRY MEASURE FIRST SUBUNIT
"𐄽	65853	𐄽	1013D	AEGEAN LIQUID MEASURE FIRST SUBUNIT
"𐄾	65854	𐄾	1013E	AEGEAN MEASURE SECOND SUBUNIT
"𐄿	65855	𐄿	1013F	AEGEAN MEASURE THIRD SUBUNIT
"🞲
" ☀	9728	☀	2600	 	BLACK SUN WITH RAYS
" ☁	9729	☁	2601	 	CLOUD
" ☂	9730	☂	2602	 	UMBRELLA
" ☃	9731	☃	2603	 	SNOWMAN
" ☄	9732	☄	2604	 	COMET
" ★	9733	★	2605	 	BLACK STAR
" ☆	9734	☆	2606	 	WHITE STAR
" ☇	9735	☇	2607	 	LIGHTNING
" ☈	9736	☈	2608	 	THUNDERSTORM
" ☉	9737	☉	2609	 	SUN
" ☊	9738	☊	260A	 	ASCENDING NODE
" ☋	9739	☋	260B	 	DESCENDING NODE
" ☌	9740	☌	260C	 	CONJUNCTION
" ☍	9741	☍	260D	 	OPPOSITION
" ☎	9742	☎	260E	 	BLACK TELEPHONE
" ☏	9743	☏	260F	 	WHITE TELEPHONE
" ☐	9744	☐	2610	 	BALLOT BOX
" ☑	9745	☑	2611	 	BALLOT BOX WITH CHECK
" ☒	9746	☒	2612	 	BALLOT BOX WITH X
" ☓	9747	☓	2613	 	SALTIRE
" ☔	9748	☔	2614	 	UMBRELLA WITH RAIN DROPS
" ☕	9749	☕	2615	 	HOT BEVERAGE
" ☖	9750	☖	2616	 	WHITE SHOGI PIECE
" ☗	9751	☗	2617	 	BLACK SHOGI PIECE
" ☘	9752	☘	2618	 	SHAMROCK
" ☙	9753	☙	2619	 	REVERSED ROTATED FLORAL HEART BULLET
" ☚	9754	☚	261A	 	BLACK LEFT POINTING INDEX
" ☛	9755	☛	261B	 	BLACK RIGHT POINTING INDEX
" ☜	9756	☜	261C	 	WHITE LEFT POINTING INDEX
" ☝	9757	☝	261D	 	WHITE UP POINTING INDEX
" ☞	9758	☞	261E	 	WHITE RIGHT POINTING INDEX
" ☟	9759	☟	261F	 	WHITE DOWN POINTING INDEX
" ☠	9760	☠	2620	 	SKULL AND CROSSBONES
" ☡	9761	☡	2621	 	CAUTION SIGN
" ☢	9762	☢	2622	 	RADIOACTIVE SIGN
" ☣	9763	☣	2623	 	BIOHAZARD SIGN
" ☤	9764	☤	2624	 	CADUCEUS
" ☥	9765	☥	2625	 	ANKH
" ☦	9766	☦	2626	 	ORTHODOX CROSS
" ☧	9767	☧	2627	 	CHI RHO
" ☨	9768	☨	2628	 	CROSS OF LORRAINE
" ☩	9769	☩	2629	 	CROSS OF JERUSALEM
" ☪	9770	☪	262A	 	STAR AND CRESCENT
" ☫	9771	☫	262B	 	FARSI SYMBOL
" ☬	9772	☬	262C	 	ADI SHAKTI
" ☭	9773	☭	262D	 	HAMMER AND SICKLE
" ☮	9774	☮	262E	 	PEACE SYMBOL
" ☯	9775	☯	262F	 	YIN YANG
" ☰	9776	☰	2630	 	TRIGRAM FOR HEAVEN
" ☱	9777	☱	2631	 	TRIGRAM FOR LAKE
" ☲	9778	☲	2632	 	TRIGRAM FOR FIRE
" ☳	9779	☳	2633	 	TRIGRAM FOR THUNDER
" ☴	9780	☴	2634	 	TRIGRAM FOR WIND
" ☵	9781	☵	2635	 	TRIGRAM FOR WATER
" ☶	9782	☶	2636	 	TRIGRAM FOR MOUNTAIN
" ☷	9783	☷	2637	 	TRIGRAM FOR EARTH
" ☸	9784	☸	2638	 	WHEEL OF DHARMA
" ☹	9785	☹	2639	 	WHITE FROWNING FACE
" ☺	9786	☺	263A	 	WHITE SMILING FACE (present in WGL4)
" ☻	9787	☻	263B	 	BLACK SMILING FACE (present in WGL4)
" ☼	9788	☼	263C	 	WHITE SUN WITH RAYS (present in WGL4)
" ☽	9789	☽	263D	 	FIRST QUARTER MOON
" ☾	9790	☾	263E	 	LAST QUARTER MOON
" ☿	9791	☿	263F	 	MERCURY
" ♀	9792	♀	2640	 	FEMALE SIGN (present in WGL4)
" ♁	9793	♁	2641	 	EARTH
" ♂	9794	♂	2642	 	MALE SIGN (present in WGL4)
" ♃	9795	♃	2643	 	JUPITER
" ♄	9796	♄	2644	 	SATURN
" ♅	9797	♅	2645	 	URANUS
" ♆	9798	♆	2646	 	NEPTUNE
" ♇	9799	♇	2647	 	PLUTO
" ♈	9800	♈	2648	 	ARIES
" ♉	9801	♉	2649	 	TAURUS
" ♊	9802	♊	264A	 	GEMINI
" ♋	9803	♋	264B	 	CANCER
" ♌	9804	♌	264C	 	LEO
" ♍	9805	♍	264D	 	VIRGO
" ♎	9806	♎	264E	 	LIBRA
" ♏	9807	♏	264F	 	SCORPIUS
" ♐	9808	♐	2650	 	SAGITTARIUS
" ♑	9809	♑	2651	 	CAPRICORN
" ♒	9810	♒	2652	 	AQUARIUS
" ♓	9811	♓	2653	 	PISCES
" ♔	9812	♔	2654	 	WHITE CHESS KING
" ♕	9813	♕	2655	 	WHITE CHESS QUEEN
" ♖	9814	♖	2656	 	WHITE CHESS ROOK
" ♗	9815	♗	2657	 	WHITE CHESS BISHOP
" ♘	9816	♘	2658	 	WHITE CHESS KNIGHT
" ♙	9817	♙	2659	 	WHITE CHESS PAWN
" ♚	9818	♚	265A	 	BLACK CHESS KING
" ♛	9819	♛	265B	 	BLACK CHESS QUEEN
" ♜	9820	♜	265C	 	BLACK CHESS ROOK
" ♝	9821	♝	265D	 	BLACK CHESS BISHOP
" ♞	9822	♞	265E	 	BLACK CHESS KNIGHT
" ♟	9823	♟	265F	 	BLACK CHESS PAWN
" ♠	9824	♠	2660	&spades; (♠)	BLACK SPADE SUIT (present in WGL4 and in Symbol font)
" ♡	9825	♡	2661	 	WHITE HEART SUIT
" ♢	9826	♢	2662	 	WHITE DIAMOND SUIT
" ♣	9827	♣	2663	&clubs; (♣)	BLACK CLUB SUIT (present in WGL4 and in Symbol font)
" ♤	9828	♤	2664	 	WHITE SPADE SUIT
" ♥	9829	♥	2665	&hearts; (♥)	BLACK HEART SUIT (present in WGL4 and in Symbol font)
" ♦	9830	♦	2666	&diams; (♦)	BLACK DIAMOND SUIT (present in WGL4 and in Symbol font)
" ♧	9831	♧	2667	 	WHITE CLUB SUIT
" ♨	9832	♨	2668	 	HOT SPRINGS
" ♩	9833	♩	2669	 	QUARTER NOTE
" ♪	9834	♪	266A	 	EIGHTH NOTE (present in WGL4)
" ♫	9835	♫	266B	 	BEAMED EIGHTH NOTES (present in WGL4)
" ♬	9836	♬	26C	 	BEAMED SIXTEENTH NOTES
" ♭	9837	♭	266D	 	MUSIC FLAT SIGN
" ♮	9838	♮	266E	 	MUSIC NATURAL SIGN
" ♯	9839	♯	266F	 	MUSIC SHARP SIGN
" ♰	9840	♰	2670	 	WEST SYRIAC CROSS
" ♱	9841	♱	2671	 	EAST SYRIAC CROSS
" ♲	9842	♲	2672	 	UNIVERSAL RECYCLING SYMBOL
" ♳	9843	♳	2673	 	RECYCLING SYMBOL FOR TYPE-1 PLASTICS
" ♴	9844	♴	2674	 	RECYCLING SYMBOL FOR TYPE-2 PLASTICS
" ♵	9845	♵	2675	 	RECYCLING SYMBOL FOR TYPE-3 PLASTICS
" ♶	9846	♶	2676	 	RECYCLING SYMBOL FOR TYPE-4 PLASTICS
" ♷	9847	♷	2677	 	RECYCLING SYMBOL FOR TYPE-5 PLASTICS
" ♸	9848	♸	2678	 	RECYCLING SYMBOL FOR TYPE-6 PLASTICS
" ♹	9849	♹	2679	 	RECYCLING SYMBOL FOR TYPE-7 PLASTICS
" ♺	9850	♺	267A	 	RECYCLING SYMBOL FOR GENERIC MATERIALS
" ♻	9851	♻	267B	 	BLACK UNIVERSAL RECYCLING SYMBOL
" ♼	9852	♼	267C	 	RECYCLED PAPER SYMBOL
" ♽	9853	♽	267D	 	PARTIALLY-RECYCLED PAPER SYMBOL
" ♾	9854	♾	267E	 	PERMANENT PAPER SIGN
" ♿	9855	♿	267F	 	WHEELCHAIR SYMBOL
" ⚀	9856	⚀	2680	 	DIE FACE-1
" ⚁	9857	⚁	2681	 	DIE FACE-2
" ⚂	9858	⚂	2682	 	DIE FACE-3
" ⚃	9859	⚃	2683	 	DIE FACE-4
" ⚄	9860	⚄	2684	 	DIE FACE-5
" ⚅	9861	⚅	2685	 	DIE FACE-6
" ⚆	9862	⚆	2686	 	WHITE CIRCLE WITH DOT RIGHT
" ⚇	9863	⚇	2687	 	WHITE CIRCLE WITH TWO DOTS
" ⚈	9864	⚈	2688	 	BLACK CIRCLE WITH WHITE DOT RIGHT
" ⚉	9865	⚉	2689	 	BLACK CIRCLE WITH TWO WHITE DOTS
" ⚊	9866	⚊	268A	 	MONOGRAM FOR YANG
" ⚋	9867	⚋	268B	 	MONOGRAM FOR YIN
" ⚌	9868	⚌	268C	 	DIGRAM FOR GREATER YANG
" ⚍	9869	⚍	268D	 	DIGRAM FOR LESSER YIN
" ⚎	9870	⚎	268E	 	DIGRAM FOR LESSER YANG
" ⚏	9871	⚏	268F	 	DIGRAM FOR GREATER YIN
" ⚐	9872	⚐	2690	 	WHITE FLAG
" ⚑	9873	⚑	2691	 	BLACK FLAG
" ⚒	9874	⚒	2692	 	HAMMER AND PICK
" ⚓	9875	⚓	2693	 	ANCHOR
" ⚔	9876	⚔	2694	 	CROSSED SWORDS
" ⚕	9877	⚕	2695	 	STAFF OF AESCULAPIUS
" ⚖	9878	⚖	2696	 	SCALES
" ⚗	9879	⚗	2697	 	ALEMBIC
" ⚘	9880	⚘	2698	 	FLOWER
" ⚙	9881	⚙	2699	 	GEAR
" ⚚	9882	⚚	269A	 	STAFF OF HERMES
" ⚛	9883	⚛	269B	 	ATOM SYMBOL
" ⚜	9884	⚜	269C	 	FLEUR-DE-LIS
" ⚝	9885	⚝	269D	 	OUTLINED WHITE STAR
" ⚞	9886	⚞	269E	 	THREE LINES CONVERGING RIGHT
" ⚟	9887	⚟	269F	 	THREE LINES CONVERGING LEFT
" ⚠	9888	⚠	26A0	 	WARNING SIGN
" ⚡	9889	⚡	26A1	 	HIGH VOLTAGE SIGN
" ⚢	9890	⚢	26A2	 	DOUBLED FEMALE SIGN
" ⚣	9891	⚣	26A3	 	DOUBLED MALE SIGN
" ⚤	9892	⚤	26A4	 	INTERLOCKED FEMALE AND MALE SIGN
" ⚥	9893	⚥	26A5	 	MALE AND FEMALE SIGN
" ⚦	9894	⚦	26A6	 	MALE WITH STROKE SIGN
" ⚧	9895	⚧	26A7	 	MALE WITH STROKE AND MALE AND FEMALE SIGN
" ⚨	9896	⚨	26A8	 	VERTICAL MALE WITH STROKE SIGN
" ⚩	9897	⚩	26A9	 	HORIZONTAL MALE WITH STROKE SIGN
" ⚪	9898	⚪	26AA	 	MEDIUM WHITE CIRCLE
" ⚫	9899	⚫	26AB	 	MEDIUM BLACK CIRCLE
" ⚬	9900	⚬	26AC	 	MEDIUM SMALL WHITE CIRCLE
" ⚭	9901	⚭	26AD	 	MARRIAGE SYMBOL
" ⚮	9902	⚮	26AE	 	DIVORCE SYMBOL
" ⚯	9903	⚯	26AF	 	UNMARRIED PARTNERSHIP SYMBOL
" ⚰	9904	⚰	26B0	 	COFFIN
" ⚱	9905	⚱	26B1	 	FUNERAL URN
" ⚲	9906	⚲	26B2	 	NEUTER
" ⚳	9907	⚳	26B3	 	CERES
" ⚴	9908	⚴	26B4	 	PALLAS
" ⚵	9909	⚵	26B5	 	JUNO
" ⚶	9910	⚶	26B6	 	VESTA
" ⚷	9911	⚷	26B7	 	CHIRON
" ⚸	9912	⚸	26B8	 	BLACK MOON LILITH
" ⚹	9913	⚹	26B9	 	SEXTILE
" ⚺	9914	⚺	26BA	 	SEMISEXTILE
" ⚻	9915	⚻	26BB	 	QUINCUNX
" ⚼	9916	⚼	26BC	 	SESQUIQUADRATE
" ⚽	9917	⚽	26BD	 	SOCCER BALL
" ⚾	9918	⚾	26BE	 	BASEBALL
" ⚿	9919	⚿	26BF	 	SQUARED KEY
" ⛀	9920	⛀	26C0	 	WHITE DRAUGHTS MAN
" ⛁	9921	⛁	26C1	 	WHITE DRAUGHTS KING
" ⛂	9922	⛂	26C2	 	BLACK DRAUGHTS MAN
" ⛃	9923	⛃	26C3	 	BLACK DRAUGHTS KING
" ⛄	9924	⛄	26C4	 	SNOWMAN WITHOUT SNOW
" ⛅	9925	⛅	26C5	 	SUN BEHIND CLOUD
" ⛆	9926	⛆	26C6	 	RAIN
" ⛇	9927	⛇	26C7	 	BLACK SNOWMAN
" ⛈	9928	⛈	26C8	 	THUNDER CLOUD AND RAIN
" ⛉	9929	⛉	26C9	 	TURNED WHITE SHOGI PIECE
" ⛊	9930	⛊	26CA	 	TURNED BLACK SHOGI PIECE
" ⛋	9931	⛋	26CB	 	WHITE DIAMOND IN SQUARE
" ⛌	9932	⛌	26CC	 	CROSSING LANES
" ⛍	9933	⛍	26CD	 	DISABLED CAR
" ⛎	9934	⛎	26CE	 	OPHIUCHUS
" ⛏	9935	⛏	26CF	 	PICK
" ⛐	9936	⛐	26D0	 	CAR SLIDING
" ⛑	9937	⛑	26D1	 	HELMET WITH WHITE CROSS
" ⛒	9938	⛒	26D2	 	CIRCLED CROSSING LANES
" ⛓	9939	⛓	26D3	 	CHAINS
" ⛔	9940	⛔	26D4	 	NO ENTRY
" ⛕	9941	⛕	26D5	 	ALTERNATE ONE-WAY LEFT WAY TRAFFIC
" ⛖	9942	⛖	26D6	 	BLACK TWO-WAY LEFT WAY TRAFFIC
" ⛗	9943	⛗	26D7	 	WHITE TWO-WAY LEFT WAY TRAFFIC
" ⛘	9944	⛘	26D8	 	BLACK LEFT LANE MERGE
" ⛙	9945	⛙	26D9	 	WHITE LEFT LANE MERGE
" ⛚	9946	⛚	26DA	 	DRIVE SLOW SIGN
" ⛛	9947	⛛	26DB	 	HEAVY WHITE DOWN-POINTING TRIANGLE
" ⛜	9948	⛜	26DC	 	LEFT CLOSED ENTRY
" ⛝	9949	⛝	26DD	 	SQUARED SALTIRE
" ⛞	9950	⛞	26DE	 	FALLING DIAGONAL IN WHITE CIRCLE IN BLACK SQUARE
" ⛟	9951	⛟	26DF	 	BLACK TRUCK
" ⛠	9952	⛠	26E0	 	RESTRICTED LEFT ENTRY-1
" ⛡	9953	⛡	26E1	 	RESTRICTED LEFT ENTRY-2
" ⛢	9954	⛢	26E2	 	ASTRONOMICAL SYMBOL FOR URANUS
" ⛣	9955	⛣	26E3	 	HEAVY CIRCLE WITH STROKE AND TWO DOTS ABOVE
" ⛤	9956	⛤	26E4	 	PENTAGRAM
" ⛥	9957	⛥	26E5	 	RIGHT-HANDED INTERLACED PENTAGRAM
" ⛦	9958	⛦	26E6	 	LEFT-HANDED INTERLACED PENTAGRAM
" ⛧	9959	⛧	26E7	 	INVERTED PENTAGRAM
" ⛨	9960	⛨	26E8	 	BLACK CROSS ON SHIELD
" ⛩	9961	⛩	26E9	 	SHINTO SHRINE
" ⛪	9962	⛪	26EA	 	CHURCH
" ⛫	9963	⛫	26EB	 	CASTLE
" ⛬	9964	⛬	26EC	 	HISTORIC SITE
" ⛭	9965	⛭	26ED	 	GEAR WITHOUT HUB
" ⛮	9966	⛮	26EE	 	GEAR WITH HANDLES
" ⛯	9967	⛯	26EF	 	MAP SYMBOL FOR LIGHTHOUSE
" ⛰	9968	⛰	26F0	 	MOUNTAIN
" ⛱	9969	⛱	26F1	 	UMBRELLA ON GROUND
" ⛲	9970	⛲	26F2	 	FOUNTAIN
" ⛳	9971	⛳	26F3	 	FLAG IN HOLE
" ⛴	9972	⛴	26F4	 	FERRY
" ⛵	9973	⛵	26F5	 	SAILBOAT
" ⛶	9974	⛶	26F6	 	SQUARE FOUR CORNERS
" ⛷	9975	⛷	26F7	 	SKIER
" ⛸	9976	⛸	26F8	 	ICE SKATE
" ⛹	9977	⛹	26F9	 	PERSON WITH BALL
" ⛺	9978	⛺	26FA	 	TENT
" ⛻	9979	⛻	26FB	 	JAPANESE BANK SYMBOL
" ⛼	9980	⛼	26FC	 	HEADSTONE GRAVEYARD SYMBOL
" ⛽	9981	⛽	26FD	 	FUEL PUMP
" ⛾	9982	⛾	26FE	 	CUP ON BLACK SQUARE
" ⛿	9983	⛿	26FF	 	WHITE FLAG WITH HORIZONTAL MIDDLE BLACK STRIPE6
" U+2580 	UPPER HALF BLOCK (U+2580) 	▀ 	arial_unicode_ms
" U+2581 	LOWER ONE EIGHTH BLOCK (U+2581) 	▁ 	arial_unicode_ms
" U+2582 	LOWER ONE QUARTER BLOCK (U+2582) 	▂ 	arial_unicode_ms
" U+2583 	LOWER THREE EIGHTHS BLOCK (U+2583) 	▃ 	arial_unicode_ms
" U+2584 	LOWER HALF BLOCK (U+2584) 	▄ 	arial_unicode_ms
" U+2585 	LOWER FIVE EIGHTHS BLOCK (U+2585) 	▅ 	arial_unicode_ms
" U+2586 	LOWER THREE QUARTERS BLOCK (U+2586) 	▆ 	arial_unicode_ms
" U+2587 	LOWER SEVEN EIGHTHS BLOCK (U+2587) 	▇ 	arial_unicode_ms
" U+2588 	FULL BLOCK (U+2588) 	█ 	arial_unicode_ms
" U+2589 	LEFT SEVEN EIGHTHS BLOCK (U+2589) 	▉ 	arial_unicode_ms
" U+258A 	LEFT THREE QUARTERS BLOCK (U+258A) 	▊ 	arial_unicode_ms
" U+258B 	LEFT FIVE EIGHTHS BLOCK (U+258B) 	▋ 	arial_unicode_ms
" U+258C 	LEFT HALF BLOCK (U+258C) 	▌ 	arial_unicode_ms
" U+258D 	LEFT THREE EIGHTHS BLOCK (U+258D) 	▍ 	arial_unicode_ms
" U+258E 	LEFT ONE QUARTER BLOCK (U+258E) 	▎ 	arial_unicode_ms
" U+258F 	LEFT ONE EIGHTH BLOCK (U+258F) 	▏ 	arial_unicode_ms
" U+2590 	RIGHT HALF BLOCK (U+2590) 	▐ 	arial_unicode_ms


" ----------------------------------------------------------------------------
" Denite
" ----------------------------------------------------------------------------

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
                \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
                \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
                \ denite#do_map('toggle_select').'j'
endfunction



nmap <silent> <F4> :set opfunc=CountSpaces<CR>g@
vmap <silent> <F4> :<C-U>call CountSpaces(visualmode(), 1)<CR>

function! CountSpaces(type, ...)
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  if a:0  " Invoked from Visual mode, use gv command.
    silent exe "normal! gvy"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe "normal! `[v`]y"
  endif

  echomsg strlen(substitute(@@, '[^ ]', '', 'g'))

  let &selection = sel_save
  let @@ = reg_save
endfunction

function! Base64(type, ...)
  let sel_save = &selection
  let ved_save = &virtualedit
  let reg_save = @@

  let &selection = "inclusive"
  let &virtualedit = "onemore"

  if a:0  " Invoked from Visual mode, use gv command.
    silent exe "normal! gvd"
  elseif a:type == 'line'
    silent exe "normal! '[V']d"
  else
    silent exe "normal! `[v`]d"
  endif

  let @@=system('base64 --decode', @@)

  silent exe "normal! P"

  let &selection = sel_save
  let &virtualedit = ved_save
  let @@ = reg_save
endfunction

function! Convertinput_py3(func_name, type, ...)
  let sel_save = &selection
  let ved_save = &virtualedit
  let reg_save = @@

  let &selection = "inclusive"
  let &virtualedit = "onemore"

  if a:0 > 1  " Invoked from Visual mode, use gv command.
    silent exe "normal! gvd"
  elseif a:type == 'line'
    silent exe "normal! '[V']d"
  else
    silent exe "normal! `[v`]d"
  endif

  python3 import vim
  silent exe "python3 arg = " + func_name + "(int(vim.eval('@@')))"
  python3 vim.command("echomsg @@")
  python3 vim.command("let @@='%s'" % arg.replace("'","''") )

  " Replace the text
  silent exe "normal! P"

  let &selection = sel_save
  let &virtualedit = ved_save
  let @@ = reg_save
endfunction

function! Convert_Wrapper(name)
  return function('Convertinput_py3', a:name))
endfunction

if g:pim_source_file
python3 << END
import pim
herp = True
@pim.create_mapping('<Leader>xd')
@pim.words
def herp_derp(text):
    global herp
    if herp:
        herp = False
        return 'herp'
    herp = True
    return 'derp'

from pyfiglet import FigletFont

myfonts = ['acrobatic' ,'banner3' ,'bell' ,'big' ,'broadway' ,'bubble'
,'calgphy2' ,'caligraphy' ,'chunky' ,'clr8x8' ,'coinstak' ,'cricket'
,'cyberlarge' ,'cybermedium' ,'cybersmall' ,'doom' ,'dotmatrix' ,'drpepper'
,'epic' ,'fraktur' ,'fuzzy' ,'goofy' ,'graffiti' ,'isometric1' ,'larry3d'
,'lean' ,'linux' ,'nancyj' ,'o8' ,'ogre' ,'pawp' ,'pebbles' ,'puffy'
,'r2-d2___' ,'rectangles' ,'relief' ,'roman' ,'rounded' ,'rozzo' ,'serifcap'
,'shimrod' ,'slant' ,'small' ,'smisome1' ,'smslant' ,'speed' ,'stacey'
,'standard' ,'starwars' ,'stop' ,'thin' ,'ticksslant' ,'tinker-toy' ,'whimsy'
,'xcourbi']

myfonts = [f for f in myfonts if f in FigletFont.getFonts()]
#@pim.map_operator('<Leader>xa', arg_values=FigletFont.getFonts())
@pim.map_operator('<Leader>xa', arg_values=myfonts)
def ascii_art(text, font):
    from pyfiglet import Figlet
    f = Figlet(font=font)
    return f.renderText(text)


@pim.map_operator('<Leader>xb')
def draw_box(text):
    i = len(text);
    line = '+-' + '-' * i + '-+'
    return f"{line}\n| {text} |\n{line}"
END
endif

function! TableMoveRowDown()
    let line = line('.') 
    if tablemode#table#IsRow(line) != 1
        echo 'Not on a row.'
        return
    endif

    if tablemode#table#IsRow(line+1) == 0
        if tablemode#table#IsHeader(line+1) == 1
            echo 'Can''t move past header.'
        else
            echo 'Already at bottom.'
        endif
        return
    endif
    
    let save_cursor = getcurpos()
    let save_reg = @@
    normal! ddp
    let @@ = save_reg
    let save_cursor[1] = save_cursor[1] + 1
    call setpos('.', save_cursor)
endfunction

function! TableMoveRowUp()
    let line = line('.') 
    if tablemode#table#IsRow(line) != 1
        echo 'Not on a row.'
        return
    endif

    if tablemode#table#IsRow(line-1) == 0
        echo 'Already at top.'
        return
    endif
    
    let save_cursor = getcurpos()
    let save_reg = @@
    normal! kddpk
    let @@ = save_reg
    let save_cursor[1] = save_cursor[1] - 1
    call setpos('.', save_cursor)
    
endfunction

function! TableModeSwapColumns(line, cola, colb)
  let current_fm = &foldmethod " save foldmethod to be restored
  setlocal foldmethod=manual " manual foldmethod while table is being aligned

  let line = tablemode#utils#line(a:line)

  let cola = 2 * a:cola + 2
  let colb = 2 * a:colb + 2

  let lnum = line
  while tablemode#table#IsTable(lnum)
      if tablemode#table#IsBorder(lnum)
          let lsplit = tablemode#align#Split(getline(lnum),
                      \ '[' . g:table_mode_corner 
                      \ . g:table_mode_corner_corner 
                      \ . g:table_mode_separator . ']' )
      else
          let lsplit = tablemode#align#Split(getline(lnum), g:table_mode_separator)
      endif
      let tmp = lsplit[cola]
      let lsplit[cola] = lsplit[colb]
      let lsplit[colb] = tmp
      call setline(lnum, join(lsplit, ''))

      let lnum -= 1
  endwhile

  let lnum = line + 1
  while tablemode#table#IsTable(lnum)
      if tablemode#table#IsBorder(lnum)
          let lsplit = tablemode#align#Split(getline(lnum),
                      \ '[' . g:table_mode_corner 
                      \ . g:table_mode_corner_corner 
                      \ . g:table_mode_separator . ']' )
      else
          let lsplit = tablemode#align#Split(getline(lnum), g:table_mode_separator)
      endif
      let tmp = lsplit[cola]
      let lsplit[cola] = lsplit[colb]
      let lsplit[colb] = tmp
      call setline(lnum, join(lsplit, ''))

      let lnum += 1
  endwhile

  " restore foldmethod
  execute "setlocal foldmethod=" . current_fm
endfunction

function! GetColumnNumber()
    let pos = getpos('.')
    let line_before = getline('.')[:pos[2]-1]
    let colnr = strlen(substitute(line_before, '[^|]', '', 'g'))
    return colnr
endfunction

function! GetTotalNumberOfColumns()
    let totcolnr = strlen(substitute(getline('.'), '[^|]', '', 'g')) - 1 
    return totcolnr
endfunction

function! TableColumnLeft()
    let line = line('.') 
    if tablemode#table#IsTable(line) != 1 | echo 'Not on a table.'| return| endif

    let colnr    = tablemode#spreadsheet#ColumnNr('.')
    let totcolnr = tablemode#spreadsheet#ColumnCount('.')

    if colnr <= 1 | echo 'At left-most column.' | return | endif
    if colnr > totcolnr | echo 'Not in a column.' | return | endif

    call TableModeSwapColumns('.', colnr - 1, colnr - 2)
    call tablemode#spreadsheet#cell#Motion('h')
endfunction

function! TableColumnRight()
    let line = line('.') 
    if tablemode#table#IsTable(line) != 1 | echo 'Not on a table.'| return| endif

    let colnr    = tablemode#spreadsheet#ColumnNr('.')
    let totcolnr = tablemode#spreadsheet#ColumnCount('.')

    if colnr < 1 | echo 'Not in a column.' | return | endif
    if colnr >= totcolnr | echo 'At right-most column.' | return | endif

    call TableModeSwapColumns('.', colnr - 1, colnr)
    call tablemode#spreadsheet#cell#Motion('l')
endfunction

function! MotionColumn(line) range
  let line = tablemode#utils#line(a:line)
  let minlnum = line
  let maxlnum = line

  let lnum = line
  while tablemode#table#IsTable(lnum)
      let minlnum = lnum
      let lnum -= 1
  endwhile

  let lnum = line + 1
  while tablemode#table#IsTable(lnum)
      let maxlnum = lnum
      let lnum += 1
  endwhile

  normal! F|
  let posa = getpos('.')
  let posa[1] = minlnum

  call search('|', 'z', line('.'))
  let posb = getpos('.')
  let posb[1] = maxlnum

  echo string(posa) . '/' . string(posb)
  call setpos('.', posa)
  normal! <C-v>
  call setpos('.', posb)

endfunction

function! ColumnTextObject(obj, count)
  let line = tablemode#utils#line('.')
  let minlnum = line
  let maxlnum = line

  let lnum = line
  while tablemode#table#IsTable(lnum)
      let minlnum = lnum
      let lnum -= 1
  endwhile

  let lnum = line + 1
  while tablemode#table#IsTable(lnum)
      let maxlnum = lnum
      let lnum += 1
  endwhile

  if a:obj ==# 'i'
      normal! F|2l
  else
      normal! F|
  endif
  let posa = getpos('.')
  let posa[1] = minlnum

  for i in range(a:count)
      call search('|', 'z', line('.'))
  endfor
  let posb = getpos('.')
  let posb[1] = maxlnum
  if a:obj ==# 'i'
      let posb[2] = posb[2] - 2
  else
      let posb[2] = posb[2] - 1
  endif

  call setpos('.', posa)
  exe "normal! \<C-V>"
  call setpos('.', posb)
endfunction

xnoremap <silent> ic :<C-u>call ColumnTextObject('i', v:count1)<cr>
onoremap <silent> ic :<C-u>call ColumnTextObject('i', v:count1)<cr>
xnoremap <silent> ac :<C-u>call ColumnTextObject('a', v:count1)<cr>
onoremap <silent> ac :<C-u>call ColumnTextObject('a', v:count1)<cr>

function! TableModeTextObjectTable()
    let line = tablemode#utils#line('.')
    let minlnum = line
    let maxlnum = line
    let posa = getpos('.')
    let posb = getpos('.')

    let lnum = line
    while tablemode#table#IsTable(lnum)
        let minlnum = lnum
        let lnum -= 1
    endwhile

    let lnum = line + 1
    while tablemode#table#IsTable(lnum)
        let maxlnum = lnum
        let lnum += 1
    endwhile

    normal! 0f|
    let posa = getpos('.')
    let posa[1] = minlnum

    normal! $
    let posb = getpos('.')
    let posb[1] = maxlnum
    let posb[2] = posb[2] - 1

    echom "posa = " . string(posa) . ', posb  ' . string(posb)
    return ["v", posa, posb]
endfunction

call textobj#user#plugin('column', {
            \   '-': {
            \     'select-a-function': 'ColumnTextObject',
            \     'select-a': 'ac',
            \     'select-i-function': 'ColumnI',
            \     'select-i': 'ic',
            \   },
            \ })

call textobj#user#plugin('table', {
            \   '-': {
            \     'select-a-function': 'TableModeTextObjectTable',
            \     'select-a': 'at',
            \   },
            \ })

" TextobjColumnDefaultKeyMappings!
" TextobjTableDefaultKeyMappings!

" onoremap aC <C-U>:call MotionColumn('.')<cr>
xnoremap C <C-U>:call MotionColumn('.')<cr>
nmap <F3> :call TableColumnLeft()<cr>
nmap <F4> :call TableColumnRight()<cr>
inoremap <silent><expr> <S-TAB>
            \ tablemode#table#IsRow(line('.')) ? 
            \ '<C-o>:call tablemode#spreadsheet#cell#Motion(''h'')<cr>' :
            \ '<S-TAB>' 
" inoremap <silent><expr> <TAB>
"             \ tablemode#table#IsRow(line('.')) ? 
"             \ '<C-o>:call tablemode#table#Realign(''.'')<cr>'.
"             \ '<C-o>:call tablemode#spreadsheet#cell#Motion(''l'')<cr>' :
"             \ '<TAB>' 

function! TableTranspose()
    " Get the extent of the entire table
    let line = tablemode#utils#line('.')
    let minlnum = line
    let maxlnum = line

    let lnum = line
    while tablemode#table#IsTable(lnum)
        let minlnum = lnum
        let lnum -= 1
    endwhile

    let lnum = line + 1
    while tablemode#table#IsTable(lnum)
        let maxlnum = lnum
        let lnum += 1
    endwhile

    " Split the table lines into pieces, discard the header lines
    let x = []
    for lnum in range(minlnum, maxlnum)
        if tablemode#table#IsRow(lnum)
            let line = substitute(getline(lnum), '^\s*\(.\{-}\)\s*$', '\1', '')
            let y = split(line, '|')
            call add(x, y)
        endif
    endfor

    " Then, transpose the result
    let y = []
    for colnr in range(len(x[0]))
        let z = [] 
        for rownr in range(len(x))
            call add(z, x[rownr][colnr])
        endfor
        call add(y, z)
    endfor

    " Create a new table 
    let indent = substitute(getline(minlnum), '^\(\s*\).*$', '\1', '')
    let y = map(y, 'indent . "|" . join(v:val, "|") . "|"')

    " Delete the existing table
    execute minlnum.','.maxlnum.'delete'

    " Add the new transposed table as text and realign
    call append(minlnum-1, y)
    call tablemode#table#Realign(minlnum)

    " We assume the first line is the header
    call append(minlnum, '')
    call tablemode#table#AddBorder(minlnum+1)
endfunction

let g:loaded_vimrc = 1

