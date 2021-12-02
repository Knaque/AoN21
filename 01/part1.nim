import strutils, sequtils

var l = readFile("input.txt")
  .strip()
  .splitLines()
  .mapIt(
    parseInt(it)
  )

var c = 0

for i, v in l[1..^1]:
  if l[i] < v:
    inc c

echo c