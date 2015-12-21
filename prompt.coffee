stdin  = process.openStdin()
stdin.setEncoding 'utf8'

inputCallback = null
stdin.on 'data', (input) -> inputCallback input


promptForTile_1 = ->
  console.log 'Please enter coordinates for the first tile'
  inputCallback = (input) ->
    promptForTile_2() if strToCoordinates input

promptForTile_2 = ->
  console.log 'Please enter coordinates for the second tile'
  inputCallback = (input) ->
    if strToCoordinates input
      console.log 'Swapping tiles done'
      promptForTile_1()

GRID_SIZE = 5
inRange  = (x, y) ->
  1 <= x < GRID_SIZE and 1 <= y < GRID_SIZE

isInteger = (num) ->
  num is Math.round(num)

strToCoordinates = (input) ->
  halves = input.split(',')
  if halves.length is 2
    x = parseFloat halves[0]
    y = parseFloat halves[1]
    if !isInteger(x) or !isInteger(y) or !inRange(x) or !inRange(y)
      console.log 'Each coordinates must be an integer'
    else
      {x, y}
  else
    console.log 'Input must be of the from `x, y`!'

console.log 'Welcome to 5x5'
promptForTile_1()
