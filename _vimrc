"!
"! @file     _vimrc
"! @title    Конфигурация настроек для VIM 73_46
"! @date     2011-02-22
"!

"Section - Создание окружения

"! Убрать совместимость с Vi
  set nocompatible
  set langmenu=none

"! Раскраска кода
  syntax on
  if has("gui_running")
    highlight clear Normal
    colorscheme zenburn
  endif

"! Загрузка Windows настроек
  if has ('win32') || has ('win64')

    "! Исходники для Windows
    so $VIM/win.vimrc

    "! Папка HOME
    let $HOME='z:/progs/vim/'
  endif


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
  set spell                                     "! Запускаем проверку сразу

"! Глобальные настройки Vim
  set keymap=russian-jcukenwin                  "! Установить key map, чтобы по Ctr+^ переключался на русский и обратно
  set nohidden                                  "! Не очищать буфер при закрытии файла
  set iminsert=0
  set imdisable
  set scrolloff=5                               "! Количество строк при скроле"
  set smartindent                               "! Авто определение файлов
  set magic                                     "! Добавим магии
  set ignorecase                                "! Игнорировать Case при Regxp and Search
  set mouse=a                                   "! Включить поддержку мыши
  set autoread                                  "! Следить за изменением файла
  set history=200                               "! Запоминает изменения
  filetype plugin indent on                     "! Авто определение расширений plugin's
  set foldenable                                "! Включаем Folding
  set fdm=marker                                "! Folding по меткам
  set laststatus=2                              "! Всегда показывать строку статуса
  set showcmd                                   "! Показывать не завершенные команды
  set lazyredraw                                "! Не перерисовывать экран при выполнении скриптов
  set guioptions-=T                             "! Спрятать tool bar
  set guioptions-=t                             "! Спрятать tear off "Ножницы"
  set guioptions-=i
  set nowrap                                    "! Не разрывать строку
  set textwidth=0                               "! Не Варпать текст
  set guitablabel=%t
  set listchars=tab:»\ ,trail:·,eol:¶           "! Обозначение white strap's 
  set list                                      "! Включить listchars

"Section 3.01 - Визуализация кода
  set number                                    "! Номера строчек
  set tabstop=2                                 "! Tab 2
  set shiftwidth=2                              "! Размер сдвига при нажатии на клавиши << и >>
  set softtabstop=2                             "! Табуляция 4 пробела
  set expandtab                                 "! Преобразование tab  в пробелы
  set shiftround                                "! Удалять лишние пробелы при отступе

"Section 3.02 - Визуализация шрифта
  set guifont=Consolas:h11:cRUSSIAN             "! Шрифт Consolas размер 10pt
  set antialias                                 "! Сглаживание шрифтов  

"Section 3.06 - Визуализация поиска
  set nohlsearch                                "! Не подсвечивать результаты поиска
  set incsearch

"Section 3.07 - Визуализация текущей позиции
  set cul                                       "! highlight current line
  hi CursorLine term=none cterm=none ctermbg=3  "! adjust color

"Section 3.05 - Визуализация 
  set cmdheight=1                               "! Командная строка не может быть больше 1 строки
  set lines=43                                  "! Линий в Главном окне  	
  set columns=140                               "! Колонок в Главном окне

"Section 3.05 - Визуализация 
  set cmdheight=1                               "! Командная строка не может быть больше 1 строки
  set lines=43                                  "! Линий в Главном окне  	
  set columns=140                               "! Колонок в Главном окне

" -- ctag --
  let Tlist_Show_One_File = 1                   "! Показывать только один файл
  let Tlist_Sort_Type = "name"                  "! Сортировать по имени
  let Tlist_Use_Right_Window = 1                "! Панелька справа

" map <ctrl>+F12 to generate ctags for current folder:
  map <C-F9> :!ctags --C++-kinds=+l --C-kinds=+l -R<CR>

  map <F11> :TlistToggle<cr>                    "! F11 - показать окно Taglist
  vmap <F11> <esc>:TlistToggle<cr>              "! F11 - показать окно Taglist 
  imap <F11> <esc>:TlistToggle<cr>              "! F11 - показать окно Taglist 

" add current directory's generated tags file to available tags
  set tags+=$HOME/vimfiles/tags/cpp
  set tags+=$HOME/vimfiles/tags/php

"! SnipMate dir for snippets
  let g:snippets_dir=$VIM.'/vimfiles/snippets/'

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

"Section 5.02 - Работа с win hot-key
  source $VIMRUNTIME/mswin.vim                  "! Сочетания клавиш как в win
  behave mswin

"Section 5.03 - Работа с _vimrc
  map ,V :tabnew $MYVIMRC<CR>                   "! Открытие _vimrc
  map ,v :source $MYVIMRC<CR>                   "! Перечитывание конфигов vim

"Section 6.00 - Сборка проекта
"Section 6.01 - Функция создания build
  map <F7> :!g++ %:p -o %:p:h:h/debug/%:t:r.exe  -std=c++0x -lpcre -lpcrecpp<CR><CR>

"! Открываем файлы в новом Tab
  map gf <C-w>gf

"! Проверка php синтаксиса
  set makeprg=z:/Progs/Server/server/php/php.exe\ -l\ %

"! Сохранение сессии 
  set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
  map <F5> :mksession! ~/data/sessions/session <cr>
  map <C-F5> :source ~/data/sessions/session <cr>

"! Открытие во внешней программе"
  map <F8> :silent !%<CR> 

"! Списки TODO"
  map <F6> :vimgrep /fixme\\|todo/j Z:\Progs\Denv\home\ball\www\**\*.php Z:\Progs\Denv\home\ball\www\**\*.html Z:\Progs\Denv\home\ball\www\**\*.js<CR>:cw<CR>  

"! Юнит тесты
"! --coverage-html dir = Папка для ХТМЛЯ
map <F2> :!z:\Progs\Denv\usr\local\php5\PEAR\phpunit.bat  %<CR><CR> 

"! Устанавливаем автора для Снипетов"
let g:snips_author = 'VVV'

"! Отключаем Syntax при больших файлах
autocmd BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif 

