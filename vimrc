"source $VIMRUNTIME/mswin.vim
"behave mswin
" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
  colorscheme monokai
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Customized by Jihang Li
if has('gui_running')
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"Only for GVim
set lines=999 columns=999                           "| initial window size
"nnoremap <C-F1> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
"nnoremap <C-F2> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
set go-=T                                           "| remove toolbar
set go-=L                                           "| remove left scroll bar
set go-=r                                           "| remove right scroll bar
"""""""""""""""""""""""""""""""""""""""""""""""""""""
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI
set spell spelllang=en_us                           "| spelling check
set hlsearch
set guifont=Ubuntu\ Mono\ 13                        "| set default font
set number                                          "| show line number
set relativenumber                                  "| relative line number
set colorcolumn=80                                  "| show right margin
au InsertLeave * hi StatusLine ctermfg=231 ctermbg=241 cterm=bold guifg=#f8f8f2 guibg=#64645e gui=bold
au InsertEnter * hi StatusLine ctermfg=235 ctermbg=112 cterm=bold guifg=#262626 guibg=#87af00 gui=bold
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" splitting
set splitright
set splitbelow
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentation
set autoindent                                      "| set auto indentation
set expandtab shiftwidth=4 softtabstop=4            "| set <Tab> width to be 4 <space>s: without hard tab
"set shiftwidth=4 tabstop=4                          "| set <Tab> width to be 4 <space>s: with hard tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" formatting
autocmd FileType * set fo-=ro                       "| turn off automatic insertion of comment characters
autocmd FileType * set fo+=j                        "| remove a comment leader when joining lines (shift+j)
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" backup and swap
set backup
set dir=~/Documents/vim_recovery/swap               "| setup a swap file folder
set backupdir=~/Documents/vim_recovery/backup       "| setup a backup file folder
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw settings
let g:netrw_winsize=15                              "| set explorer window width to be 30
let g:netrw_liststyle=3                             "| set explorer to be tree style
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mapping
" toogle search highlighting on/off
noremap <F4> :set hlsearch! hlsearch?<CR>
" insert a new line without entering insert mode (shift-enter, enter)
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" misc
"set clipboard=unnamedplus                           "| access system clipboard
autocmd BufEnter * silent! lcd %:p:h                "| auto cd to pwd
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" abbreviations
:abbreviate //= //=============================================================================
:abbreviate #= #===============================================================================
:abbreviate #- #--------------------------------------------------------------------------
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" session
au VimLeave * call VimLeave()
au VimEnter * call VimEnter()
let g:PathToSessions = $HOME . "/Documents/vim_recovery/session"

function! VimEnter()
  if argc() == 0
    " gvim started with no files
    if has("browse") == 1
      let g:SessionFileName = browse(0, "Select Session", g:PathToSessions, g:PathToSessions . "/LastSession.vim")
      if g:SessionFileName != ""
        exe "source " . g:SessionFileName
      endif
    else
      " For non-gui vim
      let LoadLastSession = confirm("Restore last session?", "&Yes\n&No")
      if LoadLastSession == 1
        exe "source " . g:PathToSessions . "/LastSession.vim"
      endif
    endif
  endif
endfunction

function! VimLeave()
  exe "mksession! " . g:PathToSessions . "/LastSession.vim"
  if exists("g:SessionFileName") == 1
    if g:SessionFileName != ""
      exe "mksession! " . g:SessionFileName
    endif
  endif
endfunction
" A command for setting the session name
com -nargs=1 SetSession :let g:SessionFileName = g:PathToSessions . "/" . "<args>" . ".vim"
" .. and a command to unset it
com -nargs=0 UnsetSession :let g:SessionFileName = ""
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
call plug#begin()
Plug 'wting/gitsessions.vim'                        "| make sessions
call plug#end()
