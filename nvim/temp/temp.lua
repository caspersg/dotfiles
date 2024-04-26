-- refactorEvenNumbers to take a parameter
local function addEvenNumbers(max)
  local sum = 0
  for i = 0, max, 2 do
    sum = sum + i
  end
  return sum
end
addEvenNumbers(100)
-- rewrite test to use parameter with a range of values
local function testAddEvenNumbers()
  local result = addEvenNumbers(100)
  assert(result == 2550, "Expected 2550, got " .. result)
  local result = addEvenNumbers(50)
  assert(result == 650, "Expected 650, got " .. result)
end
testAddEvenNumbers()
