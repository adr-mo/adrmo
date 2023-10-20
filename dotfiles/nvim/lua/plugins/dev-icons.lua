local P = {
  'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
}

function P.config()
  require('nvim-web-devicons').setup {
    color_icons = true,
    default = true,
  }
end

return P
