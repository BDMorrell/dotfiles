"""""""""""
" PLUGINS "
"""""""""""
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    echo 'Please install Plug for packages.'
else
    let plug_dir = has('nvim') ? stdpath('data') . '/plugged' : '~/.vim'
    call plug#begin(plug_dir)

    " Fuzzy File Finder
    "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    "Plug 'junegunn/fzf.vim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " Snippets
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ' " Integrations
    Plug 'hrsh7th/cmp-vsnip' " Talk with 'nvim-cmp'

    "Plug 'SirVer/ultisnips'
    "Plug 'honza/vim-snippets'

    " Trailing whitespace highlight
    Plug 'ntpeters/vim-better-whitespace'

    """""""""""""""""""
    "  IDE-ish stuff  "
    """""""""""""""""""

    " Syntax checking
    "Plug 'vim-syntastic/syntastic', { 'on': ['SyntasticCheck', 'SyntasticInfo', 'SyntasticSetLocList', 'SyntasticToggleMode'] }

    " Language Server (some of the settings are from
    " https://sharksforarms.dev/posts/neovim-rust/)
    Plug 'neovim/nvim-lspconfig'

    " Language Server UI
    Plug 'glepnir/lspsaga.nvim'

    " Completion framework
    Plug 'hrsh7th/nvim-cmp'

        "Completion sources
        Plug 'hrsh7th/cmp-nvim-lsp' " LSP
        Plug 'hrsh7th/cmp-path'
        Plug 'hrsh7th/cmp-buffer'
        "Plug 'hrsh7th/cmp-cmdline'

    " Rust
    Plug 'simrat39/rust-tools.nvim'
    Plug 'rust-lang/rust.vim'

    call plug#end()
endif

""" Syntastic
let g:syntastic_check_on_wq = 0
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1

""" Completeopt
" see :help completeopt
set completeopt=menuone,noinsert,noselect

set shortmess+=c

"""""""""""""""""
" BETTER COLORS "
"""""""""""""""""
highlight Pmenu ctermbg=53 ctermfg=15 guibg=#3d0f3d
highlight WinSeparator ctermbg=240 ctermfg=7 guibg=grey25 guifg=grey70
highlight LineNr ctermbg=236 ctermfg=248 guibg=grey17 guifg=grey70
highlight CursorLineNr ctermbg=236 ctermfg=250 guibg=grey17 guifg=grey78 cterm=underline gui=bold
highlight default InlineHint ctermbg=233 ctermfg=240 guibg=grey07 guifg=grey35


""" Telescope
nnoremap <silent> <C-P> <cmd>Telescope find_files<cr>


"""""""
" LUA "
"""""""
exec 'source' ( stdpath('config') . '/startup.lua' )

"""""""
" LSP "
"""""""
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

"""""""""""
" OPTIONS "
"""""""""""
set history=500

" Don't use tabs
set expandtab
set shiftwidth=4

" Better view
set scrolloff=3

" Enable the mouse
set mouse=a

" Better split navigations
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
set splitbelow
set splitright


if has("gui_running")
else
    augroup terminalStuff

        autocmd VimEnter * silent ! echo -ne "\e[2 q"
        autocmd VimLeave * silent ! echo -ne "\e[2 q"

    augroup END
endif

if exists("g:neovide")
    set guifont="MesloLGS NF"
endif
