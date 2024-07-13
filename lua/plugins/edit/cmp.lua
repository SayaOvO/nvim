return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    'hrsh7th/cmp-cmdline',
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "lukas-reineke/cmp-under-comparator",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered()

      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback) -- jump to next snippet placeholder
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.jump(1)
          else
            fallback()
          end
        end, {
            "i",
            "s",
            "c"
          }
        ),
        ["<S-Tab>"] = cmp.mapping(function(fallback) -- jump to before snippet placeholder
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
            "i",
            "s",
            "c"
          }
        )
      }),
      -- sources for autocompletion
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer",
          option = {
            get_bufnrs = function()
              local bufs = {}
              for _, win in ipairs(vim.api.nvim_list_wins()) do
                bufs[vim.api.nvim_win_get_buf(win)] = true
              end
              return vim.tbl_keys(bufs)
            end,
          },
        },
        { name = "path" },
      },
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = function(entry, item)
          local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
          item = require("lspkind").cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
          })(entry, item)
          if color_item.abbr_hl_group then
            item.kind_hl_group = color_item.abbr_hl_group
              item.kind = color_item.abbr
          end
          return item
        end,
        fields = {
          "kind",
          "abbr",
          "menu"
        }
      },

      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          -- cmp.config.compare.scopes,
          cmp.config.compare.score,
          require("cmp-under-comparator").under,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          -- cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
    })


    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })
  
  end,
}
