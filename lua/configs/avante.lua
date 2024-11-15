local options = {
  ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
    -- Recommend using Claude
    provider = "openai",
    -- Since auto-suggestions are a high-frequency operation and therefore expensive, 
    -- it is recommended to specify an inexpensive provider or even a free provider: copilot
    auto_suggestions_provider = "openai",
    behaviour = {
      auto_suggestions = false, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
}

return options
