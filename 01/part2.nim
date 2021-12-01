import strutils, sequtils, math
var (c, l) = (0, readFile("input.txt").strip().splitLines().mapIt(parseInt(it)))
for i, _ in l[0..^4]:
  if sum(l[i..i+2]) < sum(l[i+1..i+3]): inc(c)
echo c