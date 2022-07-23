"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / | | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|




" __     ___           ____  _
" \ \   / (_)_ __ ___ |  _ \| |_   _  __ _
"  \ \ / /| | '_ ` _ \| |_) | | | | |/ _` |
"   \ V / | | | | | | |  __/| | |_| | (_| |
"    \_/  |_|_| |_| |_|_|   |_|\__,_|\__, |
"                                    |___/

call plug#begin('~/.vim/plugged')

" auto save and compile pdfs when working with LaTeX
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" color
Plug 'mboughaba/i3config.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
" highlight hex codes
Plug 'ap/vim-css-color'
" Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
" Nerd tree
Plug 'preservim/nerdtree'
call plug#end()

"     _    _      _ _
"    / \  (_)_ __| (_)_ __   ___
"   / _ \ | | '__| | | '_ \ / _ \
"  / ___ \| | |  | | | | | |  __/
" /_/   \_|_|_|  |_|_|_| |_|\___|

" Airline theme
let g:airline_theme = 'codedark'
" Airline extensions
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1



"  __  __ _              _
" |  \/  (_)___  ___ ___| | __ _ _ __   ___  ___  _   _ ___
" | |\/| | / __|/ __/ _ | |/ _` | '_ \ / _ \/ _ \| | | / __|
" | |  | | \__ | (_|  __| | (_| | | | |  __| (_) | |_| \__ \
" |_|  |_|_|___/\___\___|_|\__,_|_| |_|\___|\___/ \__,_|___/


" Miscellaneous
syntax on
set number relativenumber
set encoding=utf-8
set mouse=a
set smartcase
set clipboard+=unnamedplus
set cursorline

" Autocompletion
set wildmode=longest,list,full

" Give feedback when leader key is pressed (leader = \)
set showcmd

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Vertically center document when being on insert mode
autocmd InsertEnter * norm zz

" Splits open at the bottom and right
set splitbelow splitright

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e

" When tabbing in visual mode, persist visual mode
vmap < <gv
vmap > >gv

" Vim theme
map <F5> :colorscheme codedark<CR>
map <F6> :colorscheme default<CR>

" NerdTree
map <C-n> :NERDTreeToggle<CR>


let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1


"  _____         _
" |_    |____  _| |_
"   | |/ _ \ \/ | __|
"   | |  __/>  <| |_
"   |_|\___/_/\_\\__|


" LaTeX oriented settings
let g:livepreview_previewer = 'zathura'
let tex_preview_always_autosave = 1
let g:livepreview_use_biber = 1
set updatetime=750

map <F4> :LLPStartPreview<CR>

" Spell checking ('1z=' to get the first recommendation; '[s' go back one
" word; ']s' go to next word; 'z=' get a list of corrections)
map <leader>s :setlocal spell! spelllang=en_us,es_ar,cjk

" Format
autocmd FileType tex inoremap ;b \textbf{}<Esc>T{i
autocmd FileType tex inoremap ;i \textit{}<Esc>T{i
autocmd FileType tex inoremap ;u \underline{}<Esc>T{i

" Pages
autocmd FileType tex inoremap ;np \newpage<Enter><Enter>

" Lists
autocmd FileType tex inoremap ;le \begin{enumerate}<Enter><Enter>\end{enumerate}
autocmd FileType tex inoremap ;li \begin{itemize}<Enter><Enter>\end{itemize}
autocmd FileType tex inoremap ;it \item<Space>

" Tabbing
autocmd FileType tex inoremap ;tb \begin{tabbing}<Enter>\=<Space>(<>)<Space>\hspace*{1.5cm}<Space>\=<Space>(<>)<Space>\hspace*{1.5cm}<Space>\\<Enter>\><Space>(<>)<Space>\><Space>(<>)<Space>\\<Enter>\end{tabbing}

autocmd FileType tex inoremap ;tb1 \=<Space>(<>)<Space>\hspace*{1.5cm}<Space>
autocmd FileType tex inoremap ;tb2 \><Space>(<>)<Space>

" Labels and references
autocmd FileType tex inoremap ;l \label{}<Esc>T{i
autocmd FileType tex inoremap ;r \ref{}<Esc>T{i

" Pictures
autocmd FileType tex inoremap ;pic \includegraphics[widht=(<>)cm,keepaspectratio]
autocmd FileType tex inoremap ;c \begin{center}<Enter><Enter>\end{center}
autocmd FileType tex inoremap ;fig \begin{figure}[h]<Enter>\centering<Enter>\includegraphics[widht=(<>)cm,keepaspectratio]<Enter>\caption{(<>)\label{(<>)}<Enter>\end{figure}
autocmd FileType tex inoremap ;wr \begin{wrapfigure}[r]{(<>)cm}<Enter>\centering<Enter>\includegraphics[widht=(<>)cm,keepaspectratio]<Enter>\caption{(<>)\label{(<>)}<Enter>\end{wrapfigure}

" Cites
autocmd FileType tex inoremap ;tc \textcite{}<Esc>T{i
autocmd FileType tex inoremap ;pc \parencite{}<Esc>T{i

" MarkDown

" Inline code
autocmd FileType markdown inoremap ;ic ```` ````<Esc>3hi

autocmd FileType markdown inoremap ;p ```python<Enter>```<Esc>O
autocmd FileType markdown inoremap ;c ```c<Enter>```<Esc>O
autocmd FileType markdown inoremap ;b ```bash<Enter>```<Esc>O
autocmd FileType markdown inoremap ( ()<Esc>i
autocmd FileType markdown inoremap [ []<Esc>i
autocmd FileType markdown inoremap { {}<Esc>i
autocmd FileType markdown inoremap ' ''<Esc>i
autocmd FileType markdown inoremap " ""<Esc>i
autocmd FileType markdown inoremap < <><Esc>i
