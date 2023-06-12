-- telescope 

local G = require("G")

-- HACK:1 修复telescope 打开的文件无法进行代码折叠的问题 https://github.com/nvim-telescope/telescope.nvim/issues/559
local function stopinsert(callback)
    return function(prompt_bufnr)
        vim.cmd.stopinsert()
        vim.schedule(function()
            callback(prompt_bufnr)
        end)
    end
end

G.map_to_key({

    {'n', '<leader>ff', ':lua require("telescope.builtin").find_files({hidden=true, no_ignore=true})<cr>', {noremap = true, desc = "Telescope find_files in pwd"}},
    {'n', '<leader>fg', ':lua require("telescope.builtin").current_buffer_fuzzy_find({skip_empty_lines = true})<cr>', {noremap = true, desc = "Telescope current_buffer_fuzzy_find"}},
    {'n', '<leader>fb', ':lua require("telescope.builtin").buffers()<cr>', {noremap = true, desc = "Telescope buffers" }},
    {'n', '<leader>fh', ':lua require("telescope.builtin").oldfiles()<cr>', {noremap = true, desc = "Telescope history"}},
    {'n', '<leader>fm', ':lua require("telescope.builtin").help_tags()<cr>',{noremap = true, desc = "Telescope help_tags"}},
    {'n', '<leader>fe', ':lua require("telescope.builtin").treesitter()<cr>', {noremap = true, desc = "Telescope treesitter"}},
})


return {
    'nvim-telescope/telescope.nvim',

    dependencies = {
        { 'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'}
    },

    config = function()
        -- You dont need to set any of these options. These are the default ones. Only
        -- the loading is important
        require('telescope').setup({

        defaults = {
            mappings = {
                i = {
                    ["<Tab>"] = require("telescope.actions.layout").toggle_preview,
                    ["<CR>"] = stopinsert(require("telescope.actions").select_default), -- for HACK 1

                }
            },
            preview = {
                hide_on_startup = true, -- hide previewer when picker starts
                -- truncated file big than max_bytes
                filesize_hook = function(filepath, bufnr, opts)
                    local max_bytes = 10000
                    local cmd = {"head", "-c", max_bytes, filepath}
                    require('telescope.previewers.utils').job_maker(cmd, bufnr, opts)
                end
            },

        },

        pickers = { },

        extensions = {
            fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        },

        })        
        -- To get fzf loaded and working with telescope, you need to call
        -- load_extension, somewhere after setup function:
        require('telescope').load_extension('fzf')
    end
}
