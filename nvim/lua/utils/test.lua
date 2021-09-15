local M = {}

M.sayhello = function(name)
  print(string.format('Hi there, %s', name))
end


return M
