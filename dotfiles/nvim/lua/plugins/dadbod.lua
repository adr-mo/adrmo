local P = {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
        { 'tpope/vim-dadbod', lazy = true },
    },
    cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
    },
}

function P.config()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.dbs = {
        ['docker-database'] = 'mysql://root@127.0.0.1:3307'
    }
end

return P
