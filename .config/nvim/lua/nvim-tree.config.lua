require("nvim-tree").setup({
    view = {
        mappings = {
            custom_only = false,
            list = {
                {key = "h", action = "close_node" },
                {key = "j", action = "" },
                {key = "k", action = "" },
                {key = "l", action = "edit" },
                {key = "L", action = "tabnew" },
                {key = "s", action = "vsplit" },
                {key = "<Tab>", action = "preview" },
                {key = "H", action = "toggle_dotfiles" },
                {key = "a", action = "create" },
                {key = "d", action = "remove" },
                {key = "r", action = "rename" },
                {key = "x", action = "cut" },
                {key = "c", action = "copy" },
                {key = "p", action = "paste" },
                {key = "<C-r>", action = "full_rename" },
                {key = "f", action = "live_filter" },
                {key = "F", action = "clear_live_filter" },
                {key = "S", action = "search_node" },
            }
        }
    }
})
