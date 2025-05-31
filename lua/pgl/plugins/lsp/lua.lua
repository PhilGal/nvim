return {
	Lua = {
		runtime = { version = "LuaJIT" },
		workspace = {
			checkThirdParty = false,
			library = {
				vim.env.VIMRUNTIME,
			},
		},
	},
}
