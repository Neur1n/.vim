" Vim syntax file
" Language:	bug records
" Maintainer:	Jihang Li <LeeJihg@gmail.com>
" Last Change:	2016 July 15

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

"=============================================================================== keyword
" Specifications


"=============================================================================== match
" Project Titles
" {dark text, orange background, bold}
syn match bugTitle /PROJECT.*/
hi bugTitle guifg=#272822 guibg=#FFA500 gui=bold
hi bugTitle ctermfg=235 ctermbg=214 cterm=bold

"=============================================================================== region

let b:current_syntax = "bug"
