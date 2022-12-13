local M = {}

M.upper_first = function(value)
  local first = string.sub(value, 0, 1)
  local rest = string.sub(value, 2)
  return string.upper(first) .. rest
end

M.upper = string.upper

M.lower_first = function(value)
  local first = string.sub(value, 0, 1)
  local rest = string.sub(value, 2)
  return string.lower(first) .. rest
end

M.lower = string.lower

M.to_camel = function(s)
  local lower = string.lower(s)
  if string.find(s, "_") then
    local tmp = string.gsub(lower, "_(%w+)", M.upper_first)
    return tmp
  elseif string.find(s, "-") then
    local tmp = string.gsub(lower, "-(%w+)", M.upper_first)
    return tmp
  else
    return M.lower_first(s)
  end
end

M.to_pascal = function(s)
  local lower = string.lower(s)
  if string.find(s, "_") then
    local tmp = string.gsub(lower, "(%w+)_?", M.upper_first)
    return tmp
  elseif string.find(lower, "-") then
    local tmp = string.gsub(s, "(%w+)-?", M.upper_first)
    return tmp
  else
    return M.upper_first(s)
  end
end

M.to_snake = function(s) return s:gsub('%f[^%l]%u', '_%1'):gsub('%f[^%a]%d', '_%1'):gsub('%f[^%d]%a', '_%1'):gsub('(%u)(%u%l)'
    ,
    '%1_%2'):lower()
end

M.to_constant = function(s) return s:gsub('%f[^%l]%u', '_%1'):gsub('%f[^%a]%d', '_%1'):gsub('%f[^%d]%a', '_%1'):gsub('(%u)(%u%l)'
    ,
    '%1_%2'):upper()
end

M.to_kabab = function(s) return s:gsub('%f[^%l]%u', '-%1'):gsub('%f[^%a]%d', '-%1'):gsub('%f[^%d]%a', '-%1'):gsub('(%u)(%u%l)'
    ,
    '%1-%2'):lower()
end

M.to_kabab_upper = function(s) return s:gsub('%f[^%l]%u', '-%1'):gsub('%f[^%a]%d', '-%1'):gsub('%f[^%d]%a', '-%1'):gsub('(%u)(%u%l)'
    ,
    '%1-%2'):upper()
end

M.rust_type_to_struct_shorthand = function(s) return string.gsub(s, '(%w+) *: *%w+,? *\n* *', '%1,') end

return M

-- print(M.to_pascal "this_should_work")
-- print(M.to_pascal "this-should-work")
-- print(M.to_pascal "thisShouldWork")
-- print(M.to_pascal "thisShouldWork")
--
-- print(M.to_camel "this_should_work")
-- print(M.to_camel "this-should-work")
-- print(M.to_camel "ThisShouldWork")
-- print(M.to_camel "thisShouldWork")
--
-- print(M.to_snake "this_should_work")
-- print(M.to_snake "this-should-work")
-- print(M.to_snake "ThisShouldWork")
-- print(M.to_snake "thisShouldWork")
--
-- print(M.to_constant "this_should_work")
-- print(M.to_constant "this-should-work")
-- print(M.to_constant "ThisShouldWork")
-- print(M.to_constant "thisShouldWork")
--
-- print(M.to_kabab "this_should_work")
-- print(M.to_kabab "this-should-work")
-- print(M.to_kabab "ThisShouldWork")
-- print(M.to_kabab "thisShouldWork")
--
-- print(M.to_kabab_upper "this_should_work")
-- print(M.to_kabab_upper "this-should-work")
-- print(M.to_kabab_upper "ThisShouldWork")
-- print(M.to_kabab_upper "thisShouldWork")
