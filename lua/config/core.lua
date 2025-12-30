return {
  ---@param repo string
  ---@return string
  gh = function(repo)
    return "https://github.com/" .. repo
  end,

  ---vim.pack.add
  ---@param repos table
  packadd = function(repos)
    vim.pack.add(vim.iter(repos):flatten(1):totable())
  end,

  ---@param desc string
  ---@return table
  opt = function(desc)
    return {
      silent = true,
      desc = desc,
    }
  end,
}
