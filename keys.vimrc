"!
"! Keys
"! Date 2011-04-26
"!

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" change leader key
let mapleader = ";"

" Use CTRL-S for saving, also in Insert mode
noremap   <C-S>     :update<CR>
vnoremap  <C-S>     <C-C>:update<CR>
inoremap  <C-S>     <C-O>:update<CR>
cnoremap  <C-S>     :update<CR>
onoremap  <C-S>     :update<CR>
snoremap  <C-S>     :update<CR>

" CTRL-Z is Undo; not in cmdline though
noremap   <C-Z>     u
inoremap  <C-Z>     <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap   <C-Y>     <C-R>
inoremap  <C-Y>     <C-O><C-R>

" CTRL-A is Select all
noremap   <C-A>     gggH<C-O>G
inoremap  <C-A>     <C-O>gg<C-O>gH<C-O>G
cnoremap  <C-A>     <C-C>gggH<C-O>G
onoremap  <C-A>     <C-C>gggH<C-O>G
snoremap  <C-A>     <C-C>gggH<C-O>G
xnoremap  <C-A>     <C-C>ggVG

" CTRL-Tab is Next window
noremap   <C-Tab>   <C-W>w
inoremap  <C-Tab>   <C-O><C-W>w
cnoremap  <C-Tab>   <C-C><C-W>w
onoremap  <C-Tab>   <C-C><C-W>w

" CTRL-F4 is Close window
noremap   <C-F4>    <C-W>c
inoremap  <C-F4>    <C-O><C-W>c
cnoremap  <C-F4>    <C-C><C-W>c
onoremap  <C-F4>    <C-C><C-W>c

"! Alt+1,2,3,4,5,6 - переключение между tabs 
noremap   ±         1gt
noremap   ²         2gt
noremap   ³         3gt
noremap   ´         4gt
noremap   µ         5gt
noremap   ¶         6gt
noremap   ·         7gt
noremap   ¸         8gt
noremap   ¹         9gt
noremap   °         10gt

inoremap  ±         <C-O>1gt
inoremap  ²         <C-O>2gt
inoremap  ³         <C-O>3gt
inoremap  ´         <C-O>4gt
inoremap  µ         <C-O>5gt
inoremap  ¶         <C-O>6gt
inoremap  ·         <C-O>7gt
inoremap  ¸         <C-O>8gt
inoremap  ¹         <C-O>9gt
inoremap  °         <C-O>10gt

"! Language change"
inoremap  æ         <C-^>
vnoremap  æ         <C-^>
cnoremap  æ         <C-^>
noremap   æ         <C-^>

"! Delete
inoremap  ã         <DELETE>
inoremap  ø         <BS>

"! Move keys in insert move"
inoremap  è         <LEFT>
inoremap  ë         <UP>
inoremap  ê         <DOWN>
inoremap  ì         <RIGHT>

"! Exit to Normal mode
inoremap  é         <ESC>

"! No more arrow keys
noremap   <UP>      <nop>
noremap   <DOWN>    <nop>
noremap   <LEFT>    <nop>
noremap   <RIGHT>   <nop>

"! Открываем файлы в новом Tab
noremap   gf        <C-w>gf
