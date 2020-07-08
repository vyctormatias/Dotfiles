" ============ Configurações ============

set nocompatible                          " Desabilita a compatibilidade com o vi
syntax on                                 " Habilita o destaque de sintaxe
set number                                " Ativa a numeração das linhas
set scrolloff=8                           " Posição do cursor com Page UP e Page Down
set encoding=utf-8                        " Tipo de encode
set clipboard=unnamedplus                 " Copia para o clipboard quando usado o yy/dd etc.
set linebreak                             " Habilita a quebra de linha
set wildmenu                              " Mostra todos os arquivos casados quando o tab for pressionado
set autoread                              " Recarrega o arquivo caso seja editado enquanto aberto
set noswapfile                            " Não utiliza arquivo de swap
set visualbell                            " Pisca a tela ao inves de bipar
set hlsearch                              " Destaca os resultados da busca
set incsearch                             " Busca incremental
set noshiftround                          " Cria parágrafos com CTRL-T e CTRL-D
set cursorline                            " Mostra uma linha sob o cursor
set foldenable foldmethod=marker          " Habilita folders
set ignorecase                            " Ignora a case ao pesquisar
set tabstop=4                             " Define o espaçamento do tab para quatro espaços 
set shiftwidth=4                          " Define quatro espaçõs quando pressinado >>
set laststatus=2                          " Sempre mostra a statusline
set expandtab                             " Não converte os tabs em expaços
set textwidth=0                           " Não define um tamanho para o editor
let g:leave_my_textwidth_alone=1          " Não permite a config padrão sobrescrever o textwidth
let g:leave_my_cursor_position_alone = 1  " Não salva a posição do cursor
set list listchars=trail:∙ listchars+=tab:┆\  fillchars+=vert:│,fold:=

" Define a exibição da linha de status
set statusline=%1*\ file\ %3*\ %f\ %4*\ 
set statusline+=%=\ 
set statusline+=%3*\ %l\ of\ %L\ %2*\ line\ 
hi linenr ctermfg=0
hi cursorline cterm=NONE
hi cursorlinenr ctermfg=8
hi comment ctermfg=8
hi pmenu ctermbg=0 ctermfg=NONE
hi pmenusel ctermbg=4 ctermfg=0
hi pmenusbar ctermbg=0
hi pmenuthumb ctermbg=7
hi matchparen ctermbg=black ctermfg=NONE
hi search ctermbg=11
hi PreProc cterm=NONE ctermfg=green
hi statusline ctermbg=0 ctermfg=NONE
hi statuslinenc ctermbg=0 ctermfg=0
hi user1 ctermbg=1 ctermfg=0
hi user2 ctermbg=12 ctermfg=0
hi user3 ctermbg=0 ctermfg=NONE
hi user4 ctermbg=NONE ctermfg=NONE
hi group1 ctermbg=NONE ctermfg=0
hi clear SpellBad
hi SpellBad cterm=underline

" ============ Atalhos ============

" leader is comma
let mapleader=","

nmap <Down> gj
nmap <Up> gk

" Limpa o buffer de buscas
nnoremap <silent> <F9> :set hlsearch!<CR>

" Muda a case da palavra abaixo do cursor
nnoremap cc viw~

" Move a linha atual para cima
nnoremap _ ddkP

" Deleta a linha atual no modo de inserção
inoremap <C-d> <esc>ddi

" Deleta a palavra posterior no modo de inserção
inoremap <C-b> <C-O>diw

" Navega para o começo e para o final da linha no modo de inserção
inoremap <C-a> <esc>0i
inoremap <C-e> <esc>$i

" Tabs
map <S-C-t> :tabnew<CR>
map <S-C-p> gT
map <S-C-n> gt
map <S-C-b> :tabc<CR>

" Janelas
nmap <silent> <leader>s <Esc>:split<CR>
nnoremap <silent> <leader>v :vsplit<CR>

" Navegação de janelas
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Redimensionar janelas
nmap <silent> <S-k> :resize +5<CR>
nmap <silent> <S-j> :resize -5<CR>
nmap <silent> <S-h> :vertical resize +5<CR>
nmap <silent> <S-l> :vertical resize -5<CR>

" Usa o tab pra navegar entre as sugestões auto-complete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" netrw (built-in replacement para o NERDTree). Para rodar use :Vex
let g:netrw_sort_by = 'name'
let g:netrw_sort_direction = 'reverse'
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_fastbrowse = 1
let g:netrw_sort_by = 'name'
let g:netrw_sort_direction = 'normal'
let g:netrw_winsize = -28

" ============ Funções ============

" Adiciona o shebang se o arquivo tiver a extensão .sh e .py
autocmd BufNewFile *.sh :norm i#!/usr/bin/env sh
autocmd BufNewFile *.sh :norm 2o

autocmd BufNewFile *.py :norm i#!/usr/bin/env python3
autocmd BufNewFile *.py :norm 2o

" Torna executável arquivos com o shebang no início
au BufWritePost * if getline(1) =~ "^#!/bin/sh" ||
            \ getline(1) =~ "^#!/bin/bash" ||
            \ getline(1) =~ "^#!/usr/bin/env sh" ||
            \ getline(1) =~ "^#!/usr/bin/env bash" ||
            \ getline(1) =~ "^#!/usr/bin/env python3" | silent execute "!chmod +x <afile>" | endif


" Envia o texto selecionado para o ix.io
command! -range=% IX  <line1>,<line2>w !curl -F 'f:1=<-' ix.io | tr -d '\n' | xclip -i -selection clipboard

" Abre arquivos markdown no Pale Moon
map <silent><leader>md :!previewmarkdown.sh -i "%" -b firefox<CR>

" Abre o terminal em uma split
" ------------------------------------------------
if has('nvim')
 nnoremap <silent><A-t> :call TermToggle(12)<CR>
 inoremap <silent><A-t> <Esc>:call TermToggle(12)<CR>
 tnoremap <silent><A-t> <C-\><C-n>:call TermToggle(12)<CR>
 " Terminal go back to normal mode
 tnoremap <silent><Esc> <C-\><C-n>
endif

let s:term_buf = 0
let s:term_win = 0

function! TermToggle(height)
  if win_gotoid(s:term_win)
    hide
  else
    new terminal
    exec "resize ".a:height
    try
      exec "buffer ".s:term_buf
      exec "bd terminal"
    catch
      call termopen($SHELL, {"detach": 0})
      let s:term_buf = bufnr("")
      setlocal nonu nornu scl=no nocul
    endtry
    startinsert!
    let s:term_win = win_getid()
  endif
endfunction
"----------------------------------------------------

" Compila e executa os arquivos baseado no fitetype
function! MakeTerm()
  if empty(glob("Makefile"))
    " If there is not a makefile, use makeprg
    exec 'up|10sp term://'.&makeprg.' | nmap <buffer><Esc> ZQ'
  else
    " Otherwise, execute "run"
    exec 'up|10sp term://make run | nmap <buffer><Esc> ZQ'
  endif
endfunction
noremap <silent><A-r> :call MakeTerm()<CR>

augroup makeCmd
  autocmd!

  au FileType Agda       setlocal makeprg=agda\ %
  au FileType arduino    setlocal makeprg=ardc\ .\ &&\ ardup\ .
  au FileType befunge    setlocal makeprg=befungee\ %
  au FileType brainfuck  setlocal makeprg=bfi\ %
  au FileType c          setlocal makeprg=gcc\ -O3\ %\ -o\ %:r\ &&\ ./%:r
  au FileType cs         setlocal makeprg=dotnet\ run
  au FileType cpp        setlocal makeprg=g++\ -O3\ -std=c++2a\ -fconcepts\ %\ -o\ %:r\ &&\ ./%:r
  au FileType emojicode  setlocal makeprg=emojicodec\ %\ &&\ emojicode\ %:r.emojib
  au FileType go         setlocal makeprg=go\ run\ %
  au FileType haskell    setlocal makeprg=stack\ run
  au FileType idris      setlocal makeprg=idris\ %\ -o\ %:r\ &&\ ./%:r
  au FileType java       setlocal makeprg=jj\ %
  au FileType kotlin     setlocal makeprg=kotlinc\ *.kt\ -include-runtime\ -d\ Main.jar\ &&\ java\ -jar\ Main.jar
  au FileType javascript setlocal makeprg=node\ %
  au FileType joy        setlocal makeprg=joy\ %
  au FileType mascarpone setlocal makeprg=mascarpone\ %
  au FileType php        setlocal makeprg=php\ %
  au FileType python     setlocal makeprg=python\ %
  au FileType rust       setlocal makeprg=cargo\ run\ %
  au FileType swift      setlocal makeprg=swift\ %
  au FileType pyth       setlocal makeprg=python3\ ~/mess/pyth/pyth.py\ %
  au FileType 05AB1E     setlocal makeprg=python3\ ~/mess/05AB1E/05AB1E.py\ %
  au FileType sh         setlocal makeprg=bash\ %

augroup END
