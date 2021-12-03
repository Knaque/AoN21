import strutils, sequtils

var l = readFile("input.txt")
  .strip()
  .splitLines()

var a = '0'.repeat(l[0].len)
var b = a

for i, _ in a:
  var c = block:
    var t = newSeq[char]()
    for x in l:
      t.add x[i]
    t.count('0') < t.count('1')
  a[i] = cast[int](c).`$`[0]
  b[i] = cast[int](not c).`$`[0]

var g = parseBinInt(a)
var e = parseBinInt(b)

echo g * e