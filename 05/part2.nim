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

iterator count[T: SomeInteger](x, y: T): T =
  if x < y:
    for n in countup(x, y): yield n
  else:
    for n in countdown(x, y): yield n

for l in p:
  let xs = toSeq(count(l[0].x, l[1].x))
  let ys = toSeq(count(l[0].y, l[1].y))
  for i in 0..max(xs.high, ys.high):
    inc b[ys[i mod ys.len]][xs[i mod xs.len]]

var c = 0
for r in b:
  c += r.countIt(it > 1)

echo c