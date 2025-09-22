local function load_configs()
  local config_path = vim.fn.stdpath('config') .. '/lua/config'
  local files = vim.fn.readdir(config_path)

  for _, file in ipairs(files) do
    if file:match("%.lua$") then     -- Ensures only Lua files are processed
      local module = file:sub(1, -5) -- Removes the '.lua' extension
      if module ~= "init" then
        require("config." .. module)
      end
    end
  end
end

load_configs()
