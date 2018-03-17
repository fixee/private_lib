
set nocompatible
set number
set autoindent
set smartindent
set showmatch
set ruler
set incsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set cindent
set nobackup
set hlsearch

"set guifont
if has("gui_running")
	set guifont=Consolas:h9
endif

filetype plugin on
au FileType php set omnifunc=phpcomplete#CompletePHP
let php_sql_query=1
let php_htmlInStrings=1

"config the Tlist
let Tlist_Show_OneFile=1
let Tlist_Exit_OnlyWindow=1

"config the MiniBufExplorer
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExpModSelTarget=1
let g:miniBufExplMoreThanOne=0

"config the NERDTree
let g:NERDTree_title="[NERDTree]"

"config the winmanager
let g:winManagerWindowLayout="NERDTree|TagList"

function! NERDTree_Start()
	exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
	return 1
endfunction

nmap wm :WMToggle<CR>
	
"WinManager will open a blank file at start
"the following is to fixe the bug
function! <SID>ToggleWindowsManager()
	if IsWinManagerVisible()
		call s:CloseWindowsManager()
	else
		call s:StartWindowsManager()
		exe 'q'
	end
endfunction

syntax enable
set background=dark
colorscheme solarized
