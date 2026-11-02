#import "@preview/orange-book:0.7.1": book, part, chapter, appendices
#show: book.with(
  title: [$title$],
  subtitle: [$subtitle$],
  author: "Radno izdanje za nastavu",
  lang: "hr",
  paper-size: "iso-b5",
  margin: (inside: 23mm, outside: 18mm, top: 20mm, bottom: 23mm),
  font-size: 11pt,
  main-color: black,
  cover-background: rgb("#faf9fc"),
  cover: block(width: 100%, height: 100%, fill: rgb("#3b1749"))[
    #place(top + right, image("dizajn/ravnoteza.svg", width: 78mm, height: 73mm))
    #place(bottom + left, dx: 15mm, dy: -16mm, text(fill: white, size: 10pt, tracking: 1.3pt)[EKONOMIJA  /  PRAVO])
    #place(bottom + right, rect(width: 44mm, height: 7mm, fill: rgb("#dcf2e7"), stroke: none))
  ],
  supplement-chapter: "Poglavlje",
  supplement-part: "Dio",
  outline-depth: 2,
)


