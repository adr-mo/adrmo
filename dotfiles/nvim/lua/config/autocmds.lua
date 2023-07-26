vim.cmd([[
  augroup PhpactorMappings
    au!
    au FileType php nmap <buffer> <Leader>pm :PhpactorContextMenu<CR>
    au FileType php nmap <buffer> <Leader>pn :PhpactorClassNew<CR>
  augroup END
]])

vim.cmd([[
    augroup LspPhpactor
    autocmd!
    autocmd Filetype php command! -nargs=0 LspPhpactorReindex lua vim.lsp.buf_notify(0, "phpactor/indexer/reindex",{})
    autocmd Filetype php command! -nargs=0 LspPhpactorConfig lua LspPhpactorDumpConfig()
    autocmd Filetype php command! -nargs=0 LspPhpactorStatus lua LspPhpactorStatus()
    autocmd Filetype php command! -nargs=0 LspPhpactorBlackfireStart lua LspPhpactorBlackfireStart()
    autocmd Filetype php command! -nargs=0 LspPhpactorBlackfireFinish lua LspPhpactorBlackfireFinish()
    augroup END
]])

