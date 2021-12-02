import strutils, sequtils
var (h, d, a, l) = (0, 0, 0,
  readFile("input.txt").strip().splitLines().mapIt(
    (d: it.split(" ")[0], v: it.split(" ")[1].parseInt())
  )
)
for m in l:
  case m.d
  of "forward": h += m.v; d += m.v * a
  of "down": a += m.v
  of "up": a -= m.v
  else: discard
echo h * d