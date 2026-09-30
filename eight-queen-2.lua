require 'lulu.table'

N = 8 -- board size
isplaceok_count = 0


-- check whether position (n,c) is free from attacks
function isplaceok (a, n, c)
  isplaceok_count = isplaceok_count + 1
  local i
  for i = 1, n-1 do -- for each queen already placed
    if (a[i] == c) or           -- same column?
       (a[i] - i == c - n) or   -- same diagonal?
       (a[i] + i == c + n) then -- same diagonal?
      return false              -- vulnerable
    end
  end
  return true -- not vulnerable
end

function isboardok(a)
  local i
  for i = 1, N do
    if not isplaceok(a, i, a[i]) then
      return false
    end
  end
  return true
end

-- print a board
function printsolution(a)
  for i = 1, N do    -- for each row
    for j = 1, N do -- and for each column
      -- write "X" or "-" plus a space
      io.write(a[i] == j and "x" or "-", " ")
    end
    io.write("\n")
  end
  io.write("\n")
end

--[[
-- add to boards 'a' all queens from 'n' to 'N'
function addqueen(a, n)
  if n > N then -- all queens have been placed?
    printsolution(a)
  else -- try to place n-th queen
    for c = 1, N do
      if isplaceok(a, n, c) then
        a[n] = c  -- place n-th queen at column 'c'
        addqueen(a, n + 1)
      end
    end
  end
end

--]]

function addrowperms(b, a, n)
  if n > N then
    table.insert(b, a)
  else
    for i = 1, N do
      a[n] = i
      addrowperms(b,table.clone(a),n+1)
    end
  end
end
  
allperms = {}
addrowperms(allperms,{},1)

okcount=0

for i = 1, #allperms do
  if isboardok(allperms[i]) then
    okcount = okcount + 1
    printsolution(allperms[i])
  end
end

print("OK count:", okcount)
print("Permutation Count:", #allperms)
print("isplaceok count:", isplaceok_count)

