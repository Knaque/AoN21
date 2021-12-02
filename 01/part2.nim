import strutils, sequtils, math

var l = readFile("input.txt")
  .strip()
  .splitLines()
  .mapIt(
    parseInt(it)
  )

var c = 0

for i, _ in l[0..^4]:
  var a = sum(l[i..i+2])
  var b = sum(l[i+1..i+3])
  if a < b:
    inc c

echo c