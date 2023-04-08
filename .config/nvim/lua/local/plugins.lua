local packer = require('packer')

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    }
}

return packer.startup(
    function(use)
        use "wbthomason/packer.nvim"
        use "nvim-lua/plenary.nvim"
        use "windwp/nvim-autopairs" 
        use "nvim-tree/nvim-tree.lua"
        use "nvim-tree/nvim-web-devicons"
        use 'moll/vim-bbye' 
        use "akinsho/bufferline.nvim"

        -- Colorscheme
        use {"morhetz/gruvbox"}
    end
)
