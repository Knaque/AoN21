import strutils, sequtils

var p = readFile("input.txt")
  .strip()
  .splitLines()
  .mapIt(
    it.split(" -> ")
      .mapIt(
        (
          x: it.split(",")[0].parseInt(),
          y: it.split(",")[1].parseInt()
        )
      )
  )
  .filterIt(
    it[0].x == it[1].x or it[0].y == it[1].y
  )

let (w, h) = block:
  var (w, h) = (0, 0)
  for l in p:
    w = max([w, l[0].x, l[1].x])
    h = max([w, l[0].y, l[1].y])
  (w+1, h+2)

var b = block:
  var b = newSeq[seq[int]]()
  for i in 1..h:
    b.add newSeq[int](w)
  b

for l in p:
  let xs = toSeq(min(l[0].x, l[1].x)..max(l[0].x, l[1].x))
  let ys = toSeq(min(l[0].y, l[1].y)..max(l[0].y, l[1].y))
  for i in 0..max(xs.high, ys.high):
    inc b[ys[i mod ys.len]][xs[i mod xs.len]]

var c = 0
for r in b:
  c += r.countIt(it > 1)

echo c