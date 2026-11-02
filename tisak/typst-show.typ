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
  supplement-chapter: "Poglavlje",
  supplement-part: "Dio",
  outline-depth: 2,
)
