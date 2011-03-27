"! Vim установки для Windows
"! @date 20011-03-01

"Позиция расположения окна в Windows winpos x y
  winpos 70 50
" Don't let Windows handle alt-cmds (menu access, etc.); let vim do it
  set winaltkeys=no

"! Alt+1,2,3,4,5,6 - переключение между tabs 
  nmap ± 1gt
  nmap ² 2gt
  nmap ³ 3gt
  nmap ´ 4gt
  nmap µ 5gt
  nmap ¶ 6gt

  imap ± <ESC>1gt
  imap ² <ESC>2gt
  imap ³ <ESC>3gt
  imap ´ <ESC>4gt
  imap µ <ESC>5gt
  imap ¶ <ESC>6gt

"Меню выбора кодировки текста (koi8-r, cp1251, cp866, utf8)
  set wildmenu
  set wcm=<Tab> 
  menu Decoding.latin1 :e ++enc=latin1 <CR>
  menu Decoding.utf-8 :e ++enc=utf8 <CR>
  menu Decoding.windows-1251 :e ++enc=cp1251<CR>
  menu Decoding.cp866 :e ++enc=cp866<CR>
  menu Decoding.koi8-r :e ++enc=koi8-r<CR>

"Меню выбора кодировки текста (koi8-r, cp1251, cp866, utf8)
  set wildmenu
  set wcm=<Tab> 
  menu Coding.BOM :setlocal bomb<CR>
  menu Coding.latin1 :set fenc=latin1<CR>
  menu Coding.utf-8 :set fenc=utf8<CR>
  menu Coding.windows-1251 :set fenc=cp1251<CR>
  menu Coding.cp866 :set fenc=cp866<CR>
  menu Coding.koi8-r :set fenc=koi8-r<CR>

"! Формат заголовка
  set titlestring=%t\|m%(%M%)

