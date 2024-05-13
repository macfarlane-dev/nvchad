local tsj_utils = require('treesj.langs.utils')
local java = require('treesj.langs.java')

return {
  langs = {
      groovy = tsj_utils.merge_preset(java, {})
  }
}
