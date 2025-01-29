local options = {
  -- Built in file matchers
  builtin_matchers = {
    -- Detects Kubernetes files based on content
    kubernetes = { enabled = true },
    cloud_init = { enabled = true }
  },

  -- Additional schemas available in Telescope picker
  schemas = {
    {
      name = "Kubernetes 1.32",
      uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.32.0-standalone-strict/all.json"
    },
    {
      name = "eksctl",
      uri = vim.fn.stdpath("config") .. "/schemas/eksctl.json",
    },
    {
      name = "superset",
      uri = vim.fn.stdpath("config") .. "/schemas/helm-superset.json",
    },
  },

  -- Pass any additional options that will be merged in the final LSP config
  lspconfig = {
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
      redhat = { telemetry = { enabled = false } },
      yaml = {
        validate = true,
        format = { enable = true },
        hover = true,
        schemaStore = {
          enable = true,
          url = "https://www.schemastore.org/api/json/catalog.json",
        },
        schemaDownload = { enable = true },
        schemas = {},
        trace = { server = "debug" },
      },
    },
  },
}

return options
