"! @file            vimrc
"! @title           Настройки редактора VIM 703 версия
"! @date            2011-02-22
"! @last modified   2011-06-17 14:00:00
"! @brief           Vim config

set nocompatible
" main option
"! {{{1 Main block
"! {{{2 Setting variable
" Home dirs
if has("win32") || has("win64")
  let $_HOME    = "z:/Progs/Vim"
  let $_PRG     = "z:/Progs/Denv/home/ball2/www"
  let S_ROOT    = "z:/Progs/Denv/home/ball2/www/"
elseif has("mac")
  let $_HOME    = "/Users/vvv/progs/vim"
  let $_PRG     = "/Library/WebServer/Documents"
  let S_ROOT    = "/Library/WebServer/Documents"
  set rtp+=$_HOME/vimfiles/
  set invmmta "! Alt как мето кнопка
else
  let $_HOME    = "/home/vls/Progs/Vim"
  let $_PRG     = ""
endif

"! 2}}}
"! {{{2 GUI
if has("gui")
  "! gui configuration
  "! {{{3
  "! Цветовая схема
  colorscheme zenburn

  "! Шрифт
  if has('win32') || has('win64')
    set guifont=Consolas:h13:cRUSSIAN             "! Шрифт Consolas размер 13pt
  endif
  if has('mac')
    set antialias                                 "! Сглаживание шрифтов
    set guifont=Consolas:h16                      "! Шрифт Menlo размер 18pt
    set columns=142
    set lines=44
  endif

  "! Вид Vim'a
  "! GTK компоненты
  set guioptions-=t
  set guioptions-=i
  set guioptions-=L
  set guioptions-=e
  set guioptions-=r
  set guioptions-=R
  set guioptions-=b
  set guioptions-=l
  set guioptions-=L
  set guioptions-=T
  set guioptions-=m

  set showtabline=2

  set mouse=a                                   "! Выключить поддержку мыши

  set shortmess+=I                              "! Не беспокоиться о детях Уганды!"
  "! 3}}}
else
  "! {{{3
  "! nongui onfiguration
  set t_Co=256 " tell the term has 256 colors
  color desert
  set columns=140
  set lines=50
  "! 3}}}
endif
"! 2}}}
"! 1}}}

" main configuration
"! {{{1 Модули
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"! Vundle {{{2
  filetype off                                  "! Отключаем определение разшарений фалов для vyndle
  set rtp+=$_HOME/vundle/                       "! Расположение самого плугина для загрузки Bundles
  call vundle#rc()
  " My Bundles here:
  " original repos on github
  " Bundle 'tpope/vim-fugitive'
  " vim-scripts repos
  "Bundle 'AutoComplPop'
  Bundle 'taglist.vim'
  " non github repos
  Bundle 'https://github.com/mattn/zencoding-vim.git'
  Bundle 'https://github.com/msanders/snipmate.vim.git'
  Bundle 'https://github.com/scrooloose/nerdcommenter.git'
  Bundle 'https://github.com/vim-scripts/PairTools.git'
  Bundle 'https://github.com/jnurmine/Zenburn.git'
  Bundle 'https://github.com/xolox/vim-shell.git'
"! 2}}}
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"! Сtags {{{2
  let Tlist_Show_One_File=1                   "! Показывать только один файл
  let Tlist_Sort_Type="name"                  "! Сортировать по имени
  let Tlist_Use_Right_Window=1                "! Панелька справа
  let Tlist_Inc_Winwidth=0                    "! Не увеличивать окно

" map <ctrl>+F12 to generate ctags for current folder:
  map <C-F9> :!ctags --C++-kinds=+l --C-kinds=+l -R<CR>

" add current directory's generated tags file to available tags
  set tags+=$_HOME/vimfiles/tags/cpp
  set tags+=$_HOME/vimfiles/tags/php
  set tags+=$_PRG/tags


"! F11 - показать окно Taglist
  map <F11> :TlistToggle<cr>
"! F11 - показать окно Taglist
  vmap <F11> <esc>:TlistToggle<cr>
"! F11 - показать окно Taglist 
  imap <F11> <esc>:TlistToggle<cr>
"! 2}}}
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"! Shell_FullScreen {{{2
if has('win32') || has('win64')
" Количество пробелов между комментарием и строкой
  let g:shell_fullscreen_items='mT'
  let g:shell_mappings_enabled = 0
  map <F12> <ESC>:call xolox#shell#fullscreen()<CR>
  map! <F12> <ESC>:call xolox#shell#fullscreen()<CR>
  autocmd VimEnter * call xolox#shell#fullscreen()
endif
"! 2}}}
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"! Nerdcommenter {{{2
" Количество пробелов между комментарием и строкой
  let NERDSpaceDelims=1
  let NERDMenuMode=0
"! 2}}}
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"! ZenCoding {{{2
if has('win32') || has('win64')
  imap ñ <C-Y>,
elseif has('mac')
  imap œ <C-Y>,
endif
" 2}}}
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"! PairToolr {{{2
" Enable/Disable modules to use. For php
let g:pairtools_php_pairclamp = 1
let g:pairtools_php_tagwrench = 0
let g:pairtools_php_jigsaw    = 1

" Configure PairClamp
let g:pairtools_php_autoclose  = 1
let g:pairtools_php_forcepairs = 0
let g:pairtools_php_closepairs = "(:),[:],{:},':',\":\",<:>"
let g:pairtools_php_smartclose = 1
let g:pairtools_php_smartcloserules = '\w,(,&,\*'
let g:pairtools_php_apostrophe = 0
let g:pairtools_php_antimagic  = 1
let g:pairtools_php_antimagicfield  = "Special"
let g:pairtools_php_pcexpander = 1
let g:pairtools_php_pceraser   = 1

" Configure TagWrench
let g:pairtools_cpp_tagwrenchhook = 'tagwrench#BuiltinNoHook'
let g:pairtools_cpp_twexpander = 0
let g:pairtools_cpp_tweraser   = 0
"! 2}}}
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"! Snipets {{{2
"! SnipMate dir for snippets
  let g:snippets_dir=$_HOME.'/vimfiles/snippets/'

"! Устанавливаем автора для Снипетов
  let g:snips_author = 'VVV'
"! 2}}}
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"! 1}}}

"! Abbr {{{1
" Вставить дату"
  iab       xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<CR>
"! Проверить TODO
  cabbrev   todo_ball2 vimgrep /fixme\\|todo/g $_PRG/**/*.php $_PRG/**/*.html $_PRG/**/*.js<CR>:cw<CR>
"! 1}}}

"! {{{1 AutoCMD
"! При загрузке файла с расширением PHP будет загружен шаблон с шапкой"
autocmd BufNewFile *.php 0r $_HOME/vimfiles/templates/php.tpl
"! Отключаем Syntax при больших файлах
autocmd BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif
"! Сохраняем окружение перед выходом"
autocmd VimLeave * call Saveinexit()
"! Saveinexit {{{2
  function! Saveinexit()
    if exists("g:project")
      let a = "".$_HOME."/sessions/".g:project.""
      exec "mksession! ".a
    endif
  endfunction
"! 2}}}
"! Автоматическая обновление буфера в файл
autocmd CursorHoldI,CursorHold * call Timeupdate()
"! Update {{{2
  function! Timeupdate()
    if glob("%") != ''
      silent update
    endif
  endfunction
  set updatetime=2000
"! 2}}}
"! 1}}}

"! {{{1 TabName
set tabline=%!MyTabLine()
function! MyTabLine()
  let s = '' " complete tabline goes here
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " select the highlighting for the buffer names
    if t + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " empty space
    let s .= ' '
    " set the tab page number (for mouse clicks)
    let s .= '%' . (t + 1) . 'T'
    " set page number string
    let s .= t + 1 . ' '
    " get buffer names and statuses
    let n = ''  "temp string for buffer names while we loop and check buftype
    let m = 0 " &modified counter
    let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '
    " loop through each buffer in a tab
    for b in tabpagebuflist(t + 1)
      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      if getbufvar( b, "&buftype" ) == 'help'
        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      elseif getbufvar( b, "&buftype" ) == 'quickfix'
        let n .= '[Q]'
      else
        "let n .= pathshorten(bufname(b))
        let n = fnamemodify(bufname(b),":t")
        "let n .= bufname(b)
      endif
      " check and ++ tab's &modified count
      if getbufvar( b, "&modified" )
        let m += 1
      endif
      " no final ' ' added...formatting looks better done later
      if bc > 1
        let n .= ' '
      endif
      let bc -= 1
    endfor
    " add modified label [n+] where n pages in tab are modified
    if m > 0
      "let s .= '[' . m . '+]'
      let s.= '+ '
    endif
    " add buffer names
    if n == ''
      let s .= '[No Name]'
    else
      let s .= n
    endif
    " switch to no underlining and add final space to buffer list
    "let s .= '%#TabLineSel#' . ' '
    let s .= ' |'
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999XX'
  endif
  return s
endfunction
"! 1}}}

"! {{{1 Main
"! {{{2 Кодировка
if has("multi_byte")
 if &termencoding == ""
  let &termencoding = &encoding
 endif
 set encoding=utf-8
 setglobal fileencoding=utf-8
 set fileencodings=utf-8,ucs-bom,latin1
endif
set fileformats=unix,dos
"! 2}}}
"! {{{2 Глобальные
filetype plugin indent on                       "! Авто определение расширений plugin's
set smartindent                                 "! Авто определение файлов
set magic                                       "! Добавим магии
syntax on                                       "! Подсветка синтаксиса

"! Глобальные настройки Vim
set keymap=russian-jcukenwin                  "! Установить key map, чтобы по Ctr+^ переключался на русский и обратно
set iminsert=0
set imsearch=0

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

set list
set lcs=trail:·,nbsp:*,eol:¶

set laststatus=2                                "! Всегда показывать строку статуса
set statusline=%F                               "! Путь и название файла
set statusline+=\ %=\|A\ %#EX#%m%r%w%h%*        "! Модифицирован или нет файл
set statusline+=\ \|E\ %{&fileencoding}         "! Кодировка файла
set statusline+=\ %{((exists(\"+bomb\")\ &&\ &bomb)?\"B\":\"\")} "! Есть бом или нет
set statusline+=\|F\ %{&fileformat}             "! Формат файла
set statusline+=\ \|T\ %#EX#%y%*                "! Расширение файла
set statusline+=\ %4l/%-4L                      "! Позиция по вертикали
set statusline+=\ %3.3v                         "! Позиция по горизонтали
set statusline+=\ %3.3p%%                       "! Проценты от длинны файла

"set relativenumber                             "! Строки относительно текущей
set number                                      "! Номер строки
set numberwidth=4                               "! Количество знаков в нумерации
set cursorline                                  "! Подсветка текущей строки
set lazyredraw                                  "! Не перерисовывать экран при выполнении скриптов

set noswapfile                                  "! Не создавать своп файл
set nobackup                                    "! Не создавать бекап
set nohidden                                    "! Не очищать буфер при закрытии файла

set ignorecase                                  "! Игнорировать Case при Regxp and Search
set hlsearch                                    "! Не подсвечивать результаты поиска
set incsearch

set autoread                                    "! Следить за изменением файла
set history=200                                 "! Запоминает изменения
"! 2}}}
"! {{{2 Text
set tabstop=2                                   "! 2 пробела на 1 tab
set shiftwidth=2                                "! Отступ 2 пробела
set expandtab                                   "! Табы в пробелы
set shiftround                                  "! Удалять лишние пробелы при отступе
"! 2}}}
"! {{{2 Spelling
set spelllang=ru_ru,en_us                       "! Словари елка
set spellsuggest=8                              "! Количество предлагаемых вариантов"
set nospell                                     "! Запускаем проверку сразу не надо
"! 2}}}
"! {{{2 Folding
set foldenable                                  "! Включаем Folding
set foldmethod=marker                           "! Сворачивать по маркерам
"! 2}}}
"! 1}}}

"! {{{1 Highlight
hi EX guifg=#dca3a3 guibg=#313633
"! 1}}}

" keys configuration
"! {{{1 Main
map       ;             <leader>
imap      <F1>          <ESC>:echo "Hellow!"<CR>
map       <F1>          :echo "Hellow!"<CR>
"! {{{2 Options
" saving
map       <C-s>         :update<CR>
map!      <C-s>         <ESC>:update<CR>
" esc
imap      <M-i>         <ESC><RIGHT>
"! Файловый менеджер"
imap      <F4>          <ESC>:tabnew<CR>:Explore $_PRG<CR>
map       <F4>          :tabnew<CR>:Explore $_PRG<CR>
"! Смена языка
map!      <M-f>         <C-O>:set iminsert=0<CR>
map       <M-f>         :set iminsert=0<CR>
map!      <M-d>         <C-O>:set iminsert=1<CR>
map       <M-d>         :set iminsert=1<CR>
"! 2}}}
"! {{{2 Movenment
"! Move keys in insert move"
inoremap  <M-h>         <LEFT>
inoremap  <M-k>         <UP>
inoremap  <M-j>         <DOWN>
inoremap  <M-l>         <RIGHT>
"! 2}}}
"! {{{2 Source
"! Открытие _vimrc
nmap       <leader>v    :tabnew $MYVIMRC<CR>
"! Перечитывание конфигов vim
nmap       <leader>V    :source $MYVIMRC<CR>
"! 2}}}
"! {{{2 Tabs
nmap      <M-1>          1gt
nmap      <M-2>          2gt
nmap      <M-3>          3gt
nmap      <M-4>          4gt
nmap      <M-5>          5gt
nmap      <M-6>          6gt
nmap      <M-7>          7gt
nmap      <M-8>          8gt
nmap      <M-9>          9gt
nmap      <M-0>          10gt
imap      <M-1>          <ESC>1gt
imap      <M-2>          <ESC>2gt
imap      <M-3>          <ESC>3gt
imap      <M-4>          <ESC>4gt
imap      <M-5>          <ESC>5gt
imap      <M-6>          <ESC>6gt
imap      <M-7>          <ESC>7gt
imap      <M-8>          <ESC>8gt
imap      <M-9>          <ESC>9gt
imap      <M-0>          <ESC>10gt

nmap      gf            <C-w>gf
nmap      gh            :exe "tabnew ".S_ROOT."<cfile>"<CR>
"! 2}}}
"! {{{2 Spell
"Pressing ,ss will toggle and untoggle spell checking
map       <leader>ss    :setlocal spell!<cr>
"Shortcuts using <leader>
map       <leader>sn    ]s
map       <leader>sp    [s
map       <leader>sa    zg
map       <leader>s?    z=
"! 2}}}
"! {{{2 Search
"! searches use normal regexes
nnoremap  /             /\v
vnoremap  /             /\v
"! 2}}}
"! {{{2 Other
"! Открытие во внешней программе"
map       <F8>          :silent !%<CR>
"! 2}}}
"! 1}}}

let $check="ya"
nmap <F2> :echo $check<CR>
