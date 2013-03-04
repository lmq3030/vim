set nu
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set cursorline
set ruler
set cmdheight=1
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
""" Toggle auto-indenting for code paste
set pastetoggle=<F2>
call pathogen#infect() 

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

""""""""""""""""""""""""""""""""""" Haskell Mode"""""""""""""""""""""""""""""""""""""""""
" You may already have the following two on, please check
syntax on
filetype plugin on

" This assumes that ghc is in your path, if it is not, or you
" wish to use a specific version of ghc, then please change
" the ghc below to a full path to the correct one
au BufEnter *.hs compiler ghc

" For this section both of these should be set to your
" browser and ghc of choice, I used the following
" two vim lines to get those paths:
" :r!which google-chrome
" :r!whigh ghc
let g:haddock_browser = "/usr/bin/google-chrome"
let g:ghc = "/usr/local/bin/ghc"

""""""""""""""""""""""""""""""""""" End of Haskell Mode"""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""" Start of Omnicppcomplete"""""""""""""""""""""""""""""""""""""""""
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
imap <S-tab> <C-X><C-O>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
" configure tags - add additional tags here or comment out not-used ones
""""""""""""""""""""""""""""""""""" Start of Omnicppcomplete"""""""""""""""""""""""""""""""""""""""""
