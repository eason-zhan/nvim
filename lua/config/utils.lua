local M = {}

local function snake_case_to_CamelCase(word)
  local new_word = ""

  local offset = 0
  while word:sub(offset + 1, offset + 1) == "_" do
    offset = offset + 1
  end

  if offset > 0 then
    new_word = word:sub(1, offset)
  end

  local i = offset + 1
  while i <= #word do

    local c = word:sub(i, i)
    local n = word:sub(i + 1, i + 1)
    if i ~= #word and c == "_" and n ~= "_" then
      new_word = new_word .. n:upper()
      i = i + 2
    else
      new_word = new_word .. c
      i = i + 1
    end
  end

  return new_word
end

local function camelCaseTo_snake_cake(word)
  return (word:sub(1,1) .. word:sub(2):gsub("(%u)", "_%1")):lower()
end

function M.toggle_case(word)
  if #word == 0 then
    return word
  end

  if word:find("%w+_%w+") then
    return snake_case_to_CamelCase(word)
  else
    return camelCaseTo_snake_cake(word)
  end
end

return M
