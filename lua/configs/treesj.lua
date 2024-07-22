local tsj_utils = require('treesj.langs.utils')
local java = require('treesj.langs.java')
local python = require('treesj.langs.python')

return {
  langs = {
    groovy = tsj_utils.merge_preset(java, {}),
    terraform = tsj_utils.merge_preset(python, {}),
  }
}
