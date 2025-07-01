local utils = require("config.utils")

local snakeCamelMap = {
  foo         = "foo",
  foo1        = "foo1",
  foo_1       = "foo1",
  _foo_1      = "_foo1",
  _foo_1_     = "_foo1_",
  foo_bar     = "fooBar",
  _foo_bar    = "_fooBar",
  __foo_bar   = "__fooBar",
  __foo_bar_  = "__fooBar_",
  __foo_bar__ = "__fooBar__",
  a_b         = "aB",
  a_b_c       = "aBC",
  hello_world = "helloWorld",
}

local camelSnakeMap = {
  foo         = "foo",
  foo1        = "foo1",
  _foo1       = "_foo1",
  _foo1_      = "_foo1_",
  fooBar      = "foo_bar",
  FooBar      = "foo_bar",
  _fooBar     = "_foo_bar",
  __fooBar    = "__foo_bar",
  __fooBar_   = "__foo_bar_",
  __fooBar__  = "__foo_bar__",
  aB          = "a_b",
  aBC         = "a_b_c",
  aBCd        = "a_b_cd",
  _helloWorld = "_hello_world",
  helloWorld  = "hello_world",
}

local function test_snake_to_camel(map)
  for key, expected in pairs(map) do
    local toggled = utils.toggle_case(key)
    assert(toggled == expected, string.format("Failed: %s should be %s, but got %s", key, expected, toggled))
  end
end


local function test_camel_to_snake(map)
  for key, expected in pairs(map) do
    local toggled = utils.toggle_case(key)
    assert(toggled == expected, string.format("Failed: %s should be %s, but got %s", key, expected, toggled))
  end
end

test_snake_to_camel(snakeCamelMap)
test_camel_to_snake(camelSnakeMap)

local word = "hello_world"
if word:find("%w+_%w+") then
  print("The string contains an underscore between words.")
else
  print("The string does not contain an underscore between words.")
end
