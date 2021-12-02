import strutils, sequtils
var (h, d, l) = (0, 0,
  readFile("input.txt").strip().splitLines().mapIt(
    (d: it.split(" ")[0], v: it.split(" ")[1].parseInt())
  )
)
for m in l:
  case m.d
  of "forward": h += m.v
  of "down": d += m.v
  of "up": d -= m.v
  else: discard
echo h * d