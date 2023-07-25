-- automatically install packer if doesn't existed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- autotically sync package
vim.cmd([[ augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- install plugin
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- nvim theme
  use "rebelot/kanagawa.nvim"

  -- nvim tree (file explorer)
  use {

	  'nvim-tree/nvim-tree.lua',
	  requires = {
		  'nvim-tree/nvim-web-devicons', -- optional
	  },
  } 

  -- nvim telescope (find file,string...)
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- treesitter (syntax)
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

  -- autopair
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end,
  }

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- lsp
  
  -- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
  use 'onsails/lspkind-nvim' -- vscode-like pictograms

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
  use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
} 
  use {"jayp0521/mason-null-ls.nvim"}
  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
  use {
    "ray-x/lsp_signature.nvim",
  }

  --float terminal
  use 'voldikss/vim-floaterm'

  
  -- visual multi
  use 'mg979/vim-visual-multi'

    --comment
  use("numToStr/Comment.nvim")


  -- dap
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }


  
  if packer_bootstrap then
		require("packer").sync()
	end
end)
