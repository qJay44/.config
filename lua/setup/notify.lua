local status_ok, notify = pcall(require, 'notify')
if not status_ok then
  return vim.notify('notify', 'error', { title = 'Plugin call fail' })
end

notify.setup {
  background_colour = "Normal",
  fps = 75,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = ""
  },
  level = 2,
  minimum_width = 50,
  render = "default",
  stages = "fade_in_slide_out",
  timeout = 1000
}

vim.notify = require('notify')

