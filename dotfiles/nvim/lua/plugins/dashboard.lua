return {
    "goolord/alpha-nvim",
    -- cmd = "Alpha",
    event = 'VimEnter',
    -- setup header and buttonts
    opts = function()
        local dashboard = require "alpha.themes.dashboard"
        dashboard.section.header.val = {
            '                                                     ',
            '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
            '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
            '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
            '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
            '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
            '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
            '                                                     ',
        }

        dashboard.section.header.opts.hl = "DashboardHeader"
        vim.cmd "highlight DashboardHeader guifg=#f6c177"

        -- Buttons
        dashboard.section.buttons.val = {
            dashboard.button("n", " New     ", "<cmd>ene | startinsert<CR>"),
            dashboard.button("e", " Explorer     ", "<cmd>NvimTreeToggle<CR>"),
            dashboard.button("f", " Files     ", "<cmd>Telescope find_files<CR>"),
            dashboard.button("r", "󱝥 Recent  ", "<cmd>Telescope oldfiles<CR>"),
            dashboard.button("t", "󰊄 Search  ", "<cmd>Telescope live_grep<CR>"),
            dashboard.button("p", " Projects", "<cmd>Telescope projects<CR>"),
            dashboard.button("l", " Mason", "<cmd>Mason<CR>"),
            dashboard.button("m", " Lazy", "<cmd>Lazy<CR>"),
            dashboard.button("q", "󰩈 Quit", "<cmd>exit<CR>"),
        }

        ---- Vertical margins
        dashboard.config.layout[1].val =
            vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.10) } -- Above header
        dashboard.config.layout[3].val =
            vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.10) } -- Above buttons

        return dashboard
    end,
    config = function(_, opts)
        require("alpha").setup(opts.config)
    end,
}
