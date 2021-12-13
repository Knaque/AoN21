import algorithm, strutils, math

var f: array[9, int]
for x in readFile("input.txt").strip().split(","):
  inc f[parseInt(x)]

for _ in 1..256:
  f.rotateLeft(1)
  f[^3] += f[^1]

echo sum(f)