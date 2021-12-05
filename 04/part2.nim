import sequtils, strutils

type
  Number = tuple[v: int, m: bool]
  Board = seq[seq[Number]]
  Turns = tuple[t, r: int]

var (inputs, boards) = block:
  var l = readFile("input.txt")
    .strip()
    .split("\n\n")
  var i = l[0]
    .split(",")
    .mapIt(
      parseInt(it)
    )
  var b: seq[Board] = l[1..^1]
    .mapIt(
      it.splitLines()
        .mapIt(
          it.split(" ")
            .filterIt(
              it != ""
            )
            .mapIt(
              (v: parseInt(it), m: false)
            )
        )
    )
  (i, b)

proc `{}`(b: Board, idx: int): seq[Number] =
  for x in 0..4:
    result.add b[x][idx]

proc sum(b: Board): int =
  for r in 0..4:
    for c in 0..4:
      if not b[r][c].m:
        result += b[r][c].v

proc `<`(a, b: Turns): bool =
  a.t < b.t

var t = newSeq[Turns](boards.len)
for v in inputs:
  for b, _ in boards:
    for r in 0..4:
      for c in 0..4:
        if boards[b][r][c].v == v:
          boards[b][r][c].m = true
        if (
          boards[b][r].allIt(it.m) or
          boards[b]{c}.allIt(it.m)
        ) and t[b].t == 0:
          t[b] = (
            t: inputs.find(v) + 1,
            r: sum(boards[b]) * boards[b][r][c].v
          )

echo t[maxIndex(t)].r