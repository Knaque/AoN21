import strutils, sequtils
var (c, l) = (0, readFile("input.txt").strip().splitLines().mapIt(parseInt(it)))
for i, v in l[1..^1]:
  if l[i] < v: inc(c)
echo c