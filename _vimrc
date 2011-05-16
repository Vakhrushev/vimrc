"!
"! @file           _vimrc
"! @title          Конфигурация настроек для VIM 73_46
"! @date           2011-02-22
"! @last modified  2011-04-24 13:00:00
"!

"Section - Создание окружения

"! Убрать совместимость с Vi
  set nocompatible

"! Обновление модулей
  filetype off

  set rtp+=$VIM/vundle/
  call vundle#rc()
  " My Bundles here:
  " original repos on github
  " Bundle 'tpope/vim-fugitive'
  " vim-scripts repos
  Bundle 'AutoComplPop'
  Bundle 'taglist.vim'
  " non github repos
  Bundle 'https://github.com/mattn/zencoding-vim.git'
  Bundle 'https://github.com/msanders/snipmate.vim.git'
  Bundle 'https://github.com/scrooloose/nerdcommenter.git'

"! Установтьб язык по умолчанию в меню
  set langmenu=none

"! Авто определение расширений plugin's
  filetype plugin indent on

"! Авто определение файлов
  set smartindent

"! Загрузка биндов клавиш
  so $VIM/keys.vimrc

"! Переменные 
"!{{{1
"! Папка HOME
  let $HOME='z:/progs/vim/'
"!}}}1

"! Раскраска кода и компановка кнопок
  syntax on
  if has("gui_running")
    highlight clear Normal
    colorscheme zenburn
    so $VIM/win.vimrc
  endif


"Section 3.07 - Визуализация текущей позиции
"! highlight current line
set cursorline

"Section - Создание окружения для временных файлов
if !exists('s:loaded_my_vimrc')

  "! Don't reset twice on reloading - 'compatible' has SO many side effects.
  " Create special directory for backup and swap
  if finddir($VIM.'/data/') == ''
    silent call mkdir($VIM.'/data/')
  endif

  if finddir($VIM.'/data/backup') == ''
    silent call mkdir($VIM.'/data/backup')
  endif

  set backup                                    "! Make backup file and leave it around 
  set backupdir=$VIM/data/backup                "! Where to put backup file 
  set backupskip&
  set backupskip+=svn-commit.tmp,svn-commit.[0-9]*.tmp

  if finddir($VIM.'/data/swap') == ''
    silent call mkdir($VIM.'/data/swap')
  endif

  set directory=$VIM/data/swap                  "! Where to put swap file 

  if finddir($VIM.'/data/sessions') == ''
    silent call mkdir($VIM.'/data/sessions')
  endif
  let g:session_dir = $VIM.'/data/sessions'

endif

"Все файлы открываем в UTF-8
if has("multi_byte")
 if &termencoding == ""
  let &termencoding = &encoding
 endif
 set encoding=utf-8
 setglobal fileencoding=utf-8
 set fileencodings=utf-8,ucs-bom,latin1
endif

"! Словари
  set spelllang=ru_ru,en_us                     "! Словари елка
  set spellsuggest=8                            "! Количество предлагаемых вариантов"
  set nospell                                   "! Запускаем проверку сразу не надо
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
  map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
  map <leader>sn ]s
  map <leader>sp [s
  map <leader>sa zg
  map <leader>s? z=



"! Глобальные настройки Vim
  set keymap=russian-jcukenwin                  "! Установить key map, чтобы по Ctr+^ переключался на русский и обратно
  set iminsert=0
  set imsearch=0

" automatically leave insert mode after 'updatetime' milliseconds of inaction
  "au CursorHoldI * stopinsert

  set shortmess+=I                              "! Не беспокоиться о детях Уганды!"
  set nohidden                                  "! Не очищать буфер при закрытии файла
  set magic                                     "! Добавим магии
  set ignorecase                                "! Игнорировать Case при Regxp and Search
  set mouse=a                                   "! Выключить поддержку мыши
  set autoread                                  "! Следить за изменением файла
  set history=200                               "! Запоминает изменения
  set foldenable                                "! Включаем Folding
  set fdm=marker                                "! Folding по меткам
  set laststatus=2                              "! Всегда показывать строку статуса
  set showcmd                                   "! Показывать не завершенные команды
  set lazyredraw                                "! Не перерисовывать экран при выполнении скриптов
  set guioptions-=T                             "! Спрятать tool bar
  set guioptions-=t                             "! Спрятать tear off "Ножницы"
  set guioptions-=i
  set guioptions-=l
  set guioptions-=L
  set nowrap                                    "! Не разрывать строку
  set textwidth=0                               "! Не Варпать текст
  set listchars=tab:»\ ,trail:·,eol:¶           "! Обозначение white strap's 
  set list                                      "! Включить listchars
  set showtabline=2                             "! Всегда показывать Tab line"

"Section 3.01 - Визуализация кода
  set number                                    "! Номера строчек
  set tabstop=2                                 "! Tab 2
  set shiftwidth=2                              "! Размер сдвига при нажатии на клавиши << и >>
  set softtabstop=2                             "! Табуляция 4 пробела
  set expandtab                                 "! Преобразование tab  в пробелы
  set shiftround                                "! Удалять лишние пробелы при отступе

"Section 3.02 - Визуализация шрифта
  set guifont=Consolas:h13:cRUSSIAN             "! Шрифт Consolas размер 10pt
  set antialias                                 "! Сглаживание шрифтов  

"Section 3.06 - Визуализация поиска
  set nohlsearch                                "! Не подсвечивать результаты поиска
  set incsearch

"Section 3.05 - Визуализация 
  set cmdheight=1                               "! Командная строка не может быть больше 1 строки
  set lines=43                                  "! Линий в Главном окне
  set columns=140                               "! Колонок в Главном окне

"Section 3.04 - Визуализация строки состояния
  set statusline=%-65.65F\ \|A\ %2*%m%r%*\ \|E\ %{&fileencoding}\ %{((exists(\"+bomb\")\ &&\ &bomb)?\"B\":\"\")}\|F\ %{&fileformat}\ \|T\ %1*%y%*\ %=%4l/%-4L\ %3.3v\ %3.3p%%
  hi User1 guifg=#3c687b guibg=#313633
  hi User2 guifg=#800000 guibg=#313633

" -- ctag --
  let Tlist_Show_One_File=1                   "! Показывать только один файл
  let Tlist_Sort_Type="name"                  "! Сортировать по имени
  let Tlist_Use_Right_Window=1                "! Панелька справа

" map <ctrl>+F12 to generate ctags for current folder:
  map <C-F9> :!ctags --C++-kinds=+l --C-kinds=+l -R<CR>

"! F11 - показать окно Taglist
  map <F11> :TlistToggle<cr>
"! F11 - показать окно Taglist
  vmap <F11> <esc>:TlistToggle<cr>
"! F11 - показать окно Taglist 
  imap <F11> <esc>:TlistToggle<cr>

"! nerdcommenter"
  let NERDSpaceDelims=1

"! ZenCoding"
  imap ñ <C-Y>,

" add current directory's generated tags file to available tags
  set tags+=$HOME/vimfiles/tags/cpp
  set tags+=$HOME/vimfiles/tags/php

"! SnipMate dir for snippets
  let g:snippets_dir=$VIM.'/vimfiles/snippets/'

"! Устанавливаем автора для Снипетов"
  let g:snips_author = 'VVV'

  let g:langpair="ru"

"Section 5.00 - Keys
  imap { {}<LEFT>
  imap < <><LEFT>
  imap [ []<LEFT>
  imap ( ()<LEFT>
  inoremap " ""<LEFT>
  inoremap ' ''<LEFT>

  nmap <tab> :s/^/  <cr>
  nmap <s-tab> :s/^  /<cr>
  imap <s-tab> <esc>:s/^  /<cr>i

"! Вставить дату"
  iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

"Section 5.03 - Работа с _vimrc
"! Открытие _vimrc
  map ,V :tabnew $MYVIMRC<CR>
"! Перечитывание конфигов vim
  map ,v :source $MYVIMRC<CR>

"Section 6.00 - Сборка проекта
"Section 6.01 - Функция создания build
  map <F7> :!g++ %:p -o %:p:h:h/debug/%:t:r.exe  -std=c++0x -lpcre -lpcrecpp<CR><CR>

"! Проверка php синтаксиса
"!  set makeprg=z:/Progs/Server/server/php/php.exe\ -l\ %

"! Сохранение сессии 
  set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
  map <F5> :mksession! ~/data/sessions/session<CR>
  map <C-F5> :source ~/data/sessions/session<CR>

"! Открытие во внешней программе"
  map <F8> :silent !%<CR>
"! Файловый менеджер"
  imap <F4> <ESC>:tabnew<CR>:Explore<CR>
  map <F4> :tabnew<CR>:Explore<CR>

"! Списки TODO"
  map <F6> :vimgrep /fixme\\|todo/j Z:\Progs\Denv\home\ball\www\**\*.php Z:\Progs\Denv\home\ball\www\**\*.html Z:\Progs\Denv\home\ball\www\**\*.js<CR>:cw<CR>

"! Юнит тесты
"! --coverage-html dir = Папка для ХТМЛЯ
  map <F2> :!z:\Progs\Denv\usr\local\php5\PEAR\phpunit.bat  %<CR><CR>
  map <F3> :!z:\Progs\Denv\usr\local\php5\PEAR\phpunit.bat  z:\Progs\Denv\home\ball2\unit\<CR><CR>

"! Отключаем Syntax при больших файлах
  autocmd BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif

"! При сохранении перезаписываем Last modified"
" При записи файла или буфера все файлы php выполняют замена строки содержит last modified в строках с 1 по 10 на строку с нужным временем
  autocmd BufWritePre,FileWritePre *.php   ks|call LM()|'s
  function! LM()
    if line("$") > 20
      let l = 20
    else
      let l = line("$")
    endif
    exe "1," . l . "g/@last modified/s/@last modified.*/@last modified      " .strftime("%c")
  endfunction

"! При загрузке файла с расширением PHP будет загружен шаблон с шапкой"
  autocmd BufNewFile *.php 0r $VIM/vimfiles/templates/php.tpl

"! Наименование табов Vim
  function! GuiTabLabel()
    let label = ''
    let bufnrlist = tabpagebuflist(v:lnum)
    " Add '+' if one of the buffers in the tab page is modified
    for bufnr in bufnrlist
      if getbufvar(bufnr, "&modified")
        let label = '+'
        break
      endif
    endfor
    " Append the tab number
    let label .= v:lnum.': '
    " Append the buffer name
    let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
    if name == ''
      " give a name to no-name documents
      if &buftype=='quickfix'
        let name = '[Quickfix List]'
      else
        let name = '[No Name]'
      endif
    else
      " get only the file name
      let name = fnamemodify(name,":t")
    endif
    let label .= name
    " Append the number of windows in the tab page
    let wincount = tabpagewinnr(v:lnum, '$')
    return label
  endfunction

  set guitablabel=%{GuiTabLabel()}
