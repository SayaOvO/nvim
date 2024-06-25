return {
    'altermo/ultimate-autopair.nvim',
    event={'InsertEnter','CmdlineEnter'},
    branch='v0.6', --recommended as each new version will have breaking changes
    opts = {
      tabout = {
        enable = true,
        map = '<Tab>',
        cmap = '<Tab>',
        hopout = true,
        do_nothing_if_fail = false
      }
    }
}
