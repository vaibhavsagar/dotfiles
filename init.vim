set runtimepath^=/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua <<EOLUA
require("mason").setup()
require("mason-lspconfig").setup()

-- require("lspconfig").hls.setup {}
EOLUA
