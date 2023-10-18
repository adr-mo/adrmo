local P = {
    "vinnymeller/swagger-preview.nvim",
    build = "npm install -g swagger-ui-watcher",
}

function P.config()
    local swagger = require('swagger-preview')
    swagger.setup({
        port = 8000,
        host = "localhost"
    })
end

return P
