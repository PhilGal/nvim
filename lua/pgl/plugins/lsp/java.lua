local home = vim.fn.expand("~")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.local/share/nvim/jdtls/workspaces/" .. project_name

require("lspconfig").jdtls.setup({
  cmd = { "jdtls" },
  -- root_dir = require("lspconfig").util.root_pattern(".git", "mvnw", "gradlew"),
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "Java 21.0.2",
            path = "/Users/pgl/.sdkman/candidates/java/current",
            default = true,
          },
        },
      },
    },
    workspace_dir = workspace_dir,
  },
})
