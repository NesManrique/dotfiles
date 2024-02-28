local M = {}

local default_opts = {
    noremap = true,
    silent = true
}

local merge = function(opts1, opts2)
    local c = {}
    for k,v in pairs(opts1) do c[k] = v end
    for k,v in pairs(opts2) do c[k] = v end
    return c
end

-- Remap a key in normal mode
M.NormalRemap = function(mapping, command, opts)
    vim.keymap.set('n', mapping, command, merge(default_opts, opts))
end

-- Remap a key in visual mode
M.VisualRemap = function(mapping, command, opts)
    vim.keymap.set('v', mapping, command, merge(default_opts, opts))
end

-- Add a command
M.AddUserCommand = function(alias, cmd)
    vim.cmd(string.format('command! %s %s', alias, cmd))
end

-- Add a keymap for a mode
M.Map = function(mode, l, r, opts)
    vim.keymap.set(mode, l, r, merge(default_opts, opts))
end

return M
