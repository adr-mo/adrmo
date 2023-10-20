return {
  'yorickpeterse/nvim-pqf',
  event = 'VeryLazy',
  config = function()
    require('pqf').setup()
  end
}
