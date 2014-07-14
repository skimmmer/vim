set nocompatible
filetype on

"set rtp+=~/.vim/bundle/vundle
"call vundle#rc()
"Bundle 'gmarik/vundle'
"Bundle 'Valloric/YouCompleteMe'
"
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_key_invoke_completion = '<C-s>'

let mapleader = ","
let maplocalleader = ","

set number
syntax on
set ai
set backspace=indent,eol,start
set smartindent
set autoindent
set smartcase

set ts=4
set shiftwidth=4

set title
set showmode
set ruler
set spelllang=en_us
set cursorline
"set completeopt=menu,menuone,longest
"set pumheight=15
"set timeoutlen=250
set spelllang=en_us
filetype plugin indent on

" search
set hlsearch
set showmatch
set incsearch
set ignorecase

colorscheme molokai
"set ofu=syntaxcomplete#Complete
"
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabCompletionContexts = ['s:ContextDiscover', 's:ContextText']
"let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc', '&keyword']
"let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>", "&keyword:<c-p>"]
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"au BufEnter *.c,*.h,*.cpp,*.hpp let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"au BufEnter *.tcl,*.pl,*.py,*.cgi : let g:SuperTabDefaultCompletionType = "<C-X><C-P>"
"au BufLeave *.tcl,*.pl,*.py,*.cgi : let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
highlight   Pmenu         ctermfg=white ctermbg=darkblue
highlight   PmenuSel      ctermfg=black ctermbg=blue
highlight   PmenuSbar     ctermfg=black ctermbg=blue
highlight   PmenuThumb    ctermfg=white ctermbg=darkblue
hi CursorLine cterm=NONE ctermbg=darkblue ctermfg=NONE guibg=darkgrey guifg=NONE
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

au InsertEnter * hi StatusLine ctermfg=161
au InsertLeave * hi StatusLine ctermfg=236 ctermbg=253

set statusline=%#SLfile#\ %<%f\ %h%m%r\ %#SLtype#\ %Y\ %*\ 0%=%-14.(%l,%c%V%)\ %P
hi SLfile ctermbg=0 ctermfg=6 cterm=bold
hi SLtype ctermbg=4 cterm=bold

" Toggle spell checking on and off with `,s`
" remap esc
imap jj <Esc>
nmap <silent> <leader>s :set spell!<CR>
  
" Set region to English
set spelllang=en_us

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

nnoremap <C-h> <C-w>h

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <leader>O O<Esc>j
nmap <leader>o o<Esc>k
nmap <leader>p :set paste!<CR>
nmap <leader>pp :set paste<CR>i<C-r>+<Esc>:set paste!<CR>
nmap <leader>b :bn<CR>
nmap <leader>bb :bp<CR>

nmap <leader>tt :TlistToggle<CR>
nmap <C-w>t :TlistOpen<CR>
let Tlist_Show_One_File = 1
let Tlist_Compact_Format = 1
nmap <leader>s :setlocal spell! spelllang=en_us<CR>

nmap <leader>h :set hlsearch!<CR>
nmap <silent> <leader>t :call ShowTabs()<CR>

nmap <leader>e :cn<CR>
nmap <leader>ee :cp<CR>
nmap <leader>eo  :cope<CR>
nmap <leader>ec  :cope<CR>:q<CR>

nmap <leader>st :exe '%s/\v%(^ *)@<= {'.&ts.'}/\t/g'<CR>:set noet<CR>
nmap <leader>ts :exe '%s/^\t\+/\=repeat(" ", len(submatch(0)) *'. &ts .')'<CR>:set et<CR>

"nmap <leader>rw :%s/\<<C-r><C-w>\>/
"nmap <leader>rl :s/\<<C-r><C-w>\>/

nmap <leader>to :grep "TODO:"<CR>:cope<CR>

nnoremap c_ ct_
nnoremap cU c/\v[A-Z]<CR>
nnoremap cu c/\v[a-z]<CR>

nnoremap gp `[v`]

" Taglist
nmap <silent> <leader>t :TlistToggle<CR>

"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" custom matches
au BufReadPost,FileReadPost *.cpp,*.cc,*.hpp syntax match Namespace /[a-zA-Z_0-9]*:/hs=s,he=e-1
au BufReadPost,FileReadPost *.cpp,*.cc,*.hpp syntax match NameType /:[a-zA-Z_0-9]*[ \);]/hs=s+1,he=e-1
au BufReadPost,FileReadPost *.sp nmap <silent> <leader>cc :s/^/*/ <CR>
au BufReadPost,FileReadPost *.sp nmap <silent> <leader>co :s/^\*// <CR>
au BufReadPost,FileReadPost *.sp vmap <silent> <leader>cc :s/^/*/ <CR>
au BufReadPost,FileReadPost *.sp vmap <silent> <leader>co :s/^\*// <CR>
au BufReadPost,FileReadPost *.dust : set syntax=html

"c-lang
let g:clang_complete_auto=0
let g:clang_hl_errors=1

au BufReadPost,FileReadPost *.c,*.h,*.cc,*.cpp,*.hpp let w:m1=matchadd('Longline', '\%>80v.\+', -1)
highlight Longline ctermbg=red

" commands
au FileType csh,tcsh,tcl,perl,python : noremap <buffer> <silent> <leader>cc :call PythonComment()<CR>
au FileType csh,tcsh,tcl,perl,python : noremap <buffer> <silent> <leader>co :call PythonUnComment()<CR>
au FileType css : noremap <buffer> <silent> <leader>cc :call CssComment()<CR>
au FileType css : noremap <buffer> <silent> <leader>co :call CssUnComment()<CR>

"YAML
au FileType yaml : setlocal et ts=2 sw=2
"
"au BufReadPost,FileReadPost *.tcl,*.pl,*.py,*.cgi : map <leader>cc :call PythonComment()<CR>
"au BufReadPost,FileReadPost *.tcl,*.pl,*.py,*.cgi : map <leader>co :call PythonUnComment()<CR>

" for the weird perl comment issue
au FileType tcsh,csh,tcl,perl,python : inoremap <buffer> # X#

" functions
function! CssComment ( ) range
	silent exe a:firstline.','.a:lastline.":s:^:/*"
	silent exe a:firstline.','.a:lastline.":s:$:*/"
endfunction

function! CssUnComment ( ) range
	silent exe a:firstline.','.a:lastline.":s:\\(/\\*\\|\\*/\\)::g"
endfunction

function! PythonComment ( ) range
	silent exe a:firstline.','.a:lastline.":s/^/#/"
endfunction

function! PythonUnComment ( ) range
	silent exe a:firstline.','.a:lastline.":s/#//"
endfunction

function! ShowTabs ( )
	if !exists("g:TabChars")
		let g:TabChars = &listchars
		set list
		set listchars=tab:\|\ 
	else
		set nolist
		let &listchars = g:TabChars
		unlet g:TabChars
	endif
endfunction

" Makefiles
au FileType make : set sw=4 ts=4 noexpandtab
