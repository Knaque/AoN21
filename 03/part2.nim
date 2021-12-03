import strutils, sequtils

var l = readFile("input.txt")
  .strip()
  .splitLines()

var a = l
var b = l

for v, p in [a.addr, b.addr]:
  for i in 0..11:
    var e = block:
      var t = newSeq[char]()
      for x in p[]:
        t.add x[i]
      var z = t.count('0')
      var o = t.count('1')
      if v == 0:
        z <= o
      else:
        z > o
    p[].keepItIf(it[i] == cast[int](e).`$`[0])
    if p[].len == 1:
      break

var o = parseBinInt(a[0])
var c = parseBinInt(b[0])

echo o * c