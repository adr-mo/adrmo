local P = {
  'ellisonleao/glow.nvim',
  ft = { 'markdown' },
}

function P.config()
  return require('glow').setup {
    border = 'rounded'
  }
end

return P
