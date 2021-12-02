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

var (h, d) = (0, 0)

for m in l:
  case m.d
  of "forward":
    h += m.v
  of "down":
    d += m.v
  of "up":
    d -= m.v
  else:
    discard

echo h * d