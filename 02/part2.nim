import strutils, sequtils

var l = readFile("input.txt")
  .strip()
  .splitLines()
  .mapIt(
    (
      d: it.split(" ")[0],
      v: it.split(" ")[1].parseInt()
    )
  )

var (h, d, a) = (0, 0, 0)

for m in l:
  case m.d
  of "forward":
    h += m.v
    d += m.v * a
  of "down":
    a += m.v
  of "up":
    a -= m.v
  else:
    discard

echo h * d