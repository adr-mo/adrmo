local Plugin = {
  'vigoux/notifier.nvim',
  event = 'VeryLazy'
}

function Plugin.config()
  require('notifier').setup()
end

return Plugin
