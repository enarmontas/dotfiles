" Load plugins
source ~/.plugs.vim

" Show line numbers
set relativenumber

" Enable backspace in insert mode
set backspace=indent,eol,start

" Enable 24-bit color terminal support inside Vim
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Enable syntax highlighting
syntax on

" Enable One Dark color scheme
colorscheme onedark
highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey

" NERDTree settings
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeGitStatusConcealBrackets = 1
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1

" Lightline settings
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'filename': 'LightlineFilename'
      \ },
      \ }
function! LightlineFilename()
  return expand('%')
endfunction

" Omnicomplete settings
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
