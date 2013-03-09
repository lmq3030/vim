set nu
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set cursorline
set ruler
set cmdheight=1
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
set incsearch
set mouse=a "enable mouse mode, now needs Shift+Ctrl then right mouse -> select paste to paste text

let g:syntastic_cpp_no_include_search = 1

"""  map tab switching   """"""
map <C-l>   :tabn<CR>
map <C-h>   :tabp<CR>
map <C-n>   :tabnew<CR>
 
set pastetoggle=<F2> """ Toggle auto-indenting for code paste
map  <C-n> :tabnew<CR>
call pathogen#infect() 
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"""""""""""""""""""""""global plugin settings""""""""""""""""""""""
let g:NERDTreeDirArrows=0 "make nerdtree compatible with terminal mode
let g:syntastic_cpp_include_dirs = ['/home1/m/muqili/CIS553/project1/cis553_proj1/ns-3/build/debug/']
let g:syntastic_cpp_compiler_options = ' -std=c++0x'
let g:EchoFuncKeyNext='<C-n>' " display echofunc next function prototype
let g:EchoFuncKeyPrev='<C-p>' " display echofunc previous function prototype

nmap <F4> :TagbarToggle<CR> " F4 key will toggle the Tagbar window
nmap <F5> : NERDTreeToggle<CR> " F5 key will toggle the NerdTree window
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
"""""""""""""""""""""""""""""""""""End of Omnicppcomplete"""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""" Start of Solarized Vim"""""""""""""""""""""""""""""""""""""""""
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
""""""""""""""""""""""""""""""""""" End of Solarized Vim"""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""" Start of Self-defined Functions
" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
  syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
  hi def link cppFuncDef Special
endfunction

autocmd Syntax cpp call EnhanceCppSyntax()

" set color column
map cc :call SetColorColumn()<CR>
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction

"""""""""""""""""""""""""""""""End of Self-defined functions  """"""""""""""""""""""""""""""""""""""""""""
