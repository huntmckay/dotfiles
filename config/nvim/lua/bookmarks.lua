local M = {}
local json = vim.fn.stdpath("config") .. "/bookmarks.json"

-- Load JSON bookmarks
local function load_bookmarks()
  local f = io.open(json, "r")
  if not f then return {} end
  local content = f:read("*a")
  f:close()
  return vim.json.decode(content)
end

-- Open bookmark by category + tag
function M.open(category, tag)
  local bookmarks = load_bookmarks()
  local cat = bookmarks[category]
  if not cat then
    print("No category: " .. category)
    return
  end
  local url = cat[tag]
  if url then
    vim.fn.jobstart({ "xdg-open", url }, { detach = true })
  else
    print("No bookmark: " .. tag .. " in " .. category)
  end
end

-- Completion: suggest categories first, then tags
function M.complete(arg_lead, cmd_line, _)
  local bookmarks = load_bookmarks()
  local args = vim.split(cmd_line, "%s+")
  local n = #args - 1 -- number of arguments already typed

  if n == 0 then
    -- suggest categories
    return vim.tbl_keys(bookmarks)
  elseif n == 1 then
    -- suggest tags for given category
    local cat = bookmarks[args[2]]
    if cat then
      return vim.tbl_keys(cat)
    end
  end
  return {}
end

return M
