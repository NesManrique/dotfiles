local M = {}

local opts = {
    noremap = true,
    silent = true
}

M.NormalRemap = function(mapping, command)
    vim.api.nvim_set_keymap('n', mapping, command, opts)
end

M.VisualRemap = function(mapping, command)
    vim.api.nvim_set_keymap('v', mapping, command, opts)
end

M.AddUserCommand = function(alias, cmd)
    vim.cmd(string.format('command! %s %s', alias, cmd))
end

M.Map = function(mode, l, r, opt)
    opts = opt or {}
    vim.keymap.set(mode, l, r, opt)
end

return M
