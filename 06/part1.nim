import sequtils, strutils

var f = readFile("input.txt")
  .strip()
  .split(",")
  .mapIt(
    parseInt(it)
  )

for _ in 1..80:
  var n = newSeq[int]()
  for i in 0..f.high:
    if f[i] == 0:
      f[i] = 7
      n.add 8
    dec f[i]
  f.add n

echo f.len