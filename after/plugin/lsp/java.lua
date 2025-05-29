require('java').setup({
	jdk = {
		auto_install = false,
	},
})
require('lspconfig').jdtls.setup({
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "Java 21.0.2",
						path = "/Users/pgl/.sdkman/candidates/java/21.0.2-tem",
						default = true,
					}
				}
			}
		}
	}
})
