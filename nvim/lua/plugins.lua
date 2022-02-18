-- only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- solarized theme
  use 'shaunsingh/solarized.nvim'
  -- github link copy :GH
  use 'ruanyl/vim-gh-line'
  -- auto formatting
  --use 'mhartington/formatter.nvim'
  -- auto cleans up extra whitespace
  use 'McAuleyPenney/tidy.nvim'
  -- fzf
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  -- gitsigns (blame/change annotation)
  use {
    'lewis6991/gitsigns.nvim',
     requires = {
       'nvim-lua/plenary.nvim'
     },
     config = function()
       require('gitsigns').setup()
     end
  }
  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
end)

