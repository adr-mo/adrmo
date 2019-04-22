local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.config.set_config({
	store_selection_keys = "<C-s>",
	history = true,
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 200,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	enable_autosnippets = false,
})

ls.add_snippets("php", {
	s("core-header", {
		t({
			"/*",
			" * Copyright 2005 - 2022 Centreon (https://www.centreon.com/)",
			" *",
			' * Licensed under the Apache License, Version 2.0 (the "License");',
			" * you may not use this file except in compliance with the License.",
			" * You may obtain a copy of the License at",
			" *",
			" * http://www.apache.org/licenses/LICENSE-2.0",
			" *",
			" * Unless required by applicable law or agreed to in writing, software",
			' * distributed under the License is distributed on an "AS IS" BASIS,',
			" * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.",
			" * See the License for the specific language governing permissions and",
			" * limitations under the License.",
			" *",
			" * For more information : contact@centreon.com",
			" *",
			" */",
			"declare(strict_types=1);",
		}),
	}),
	s("module-header", {
		t({
			"/*",
			" * Centreon",
			" *",
			" * Source Copyright 2005-2022 Centreon",
			" *",
			" * Unauthorized reproduction, copy and distribution",
			" * are not allowed.",
			" *",
			" * For more information : contact@centreon.com",
			" *",
			" */",
			"",
			"declare(strict_types=1);",
		}),
	}),
	s(
		"addProperty",
		fmt(
			[[
        /**
         * @var {} ${}
         */
        {} {} ${} = {};]],
			{
				i(1, "type"),
				i(2, "name"),
				i(3, "visibility"),
				rep(1),
				rep(2),
				i(6, "value"),
			}
		)
	),
	s(
		"addFunction",
		fmt(
			[[
    {} function {}(): {}
    {{
        {}
    }}
    ]],
			{
				i(1, "visibility"),
				i(2, "funcName"),
				i(3, "returnType"),
				i(4, "Type some code here"),
			}
		)
	),
})

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("i", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
-- keymap("i", "<C-m>", '<cmd>lua require("luasnip.extras.select_choice")()<cr><C-c><C-c>', opts)
-- keymap("s", "<C-m>", '<cmd>lua require("luasnip.extras.select_choice")()<cr><C-c><C-c>', opts)
