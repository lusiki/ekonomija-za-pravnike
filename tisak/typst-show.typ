#set document(title: [$title$])
#set text(font: "Literata", size: 10.5pt, lang: "hr")
#set par(leading: 4pt, spacing: 7pt)
#set page(paper: "iso-b5", margin: (inside: 22mm, outside: 33mm, top: 21mm, bottom: 23mm),
  footer: context align(end, text(font: "JetBrains Mono", size: 8pt, counter(page).display())))
#set heading(numbering: "1.1")
#show raw: set text(font: "JetBrains Mono", ligatures: false)
#show figure.caption: set text(font: "Jost", size: 9pt)
#show table.cell.where(y: 0): set text(font: "Jost", weight: "medium")
#show table.cell: it => if it.y > 0 { text(font: "JetBrains Mono", size: 9pt, it) } else { it }
#let part-name = state("dio", [])
#let part-count = counter("dio")
#let appendix-mode = state("dodatak", false)
#let part(body) = {
  part-count.step()
  part-name.update(body)
  pagebreak(weak: true)
  v(3em)
  context text(font: "Jost", size: 11pt, tracking: 1pt, [DIO #part-count.display("I")])
  v(1.5em)
  block(text(font: "Jost", size: 32pt, lower(body)))
  v(1em)
  line(length: 100%, stroke: 2.4pt)
  pagebreak()
}
#let appendices(label, hide-parent: true, body) = {
  set heading(numbering: "A.1")
  appendix-mode.update(true)
  counter(heading).update(0)
  show heading.where(level: 1, numbering: none): it => []
  body
}
#show heading.where(level: 1): it => context {
  pagebreak(weak: true)
  let appendix = appendix-mode.get()
  if it.numbering != none {
    let n = counter(heading).get().first()
    let id = if appendix { numbering("A", n) } else { if n < 10 { "0" + str(n) } else { str(n) } }
    let section-name = if appendix { [Dodatak] } else { part-name.get() }
    block(grid(columns: (16mm, 1fr), gutter: 4mm, align: horizon,
      circle(radius: 8mm, fill: black, text(font: "Jost", fill: white, size: 17pt, id)),
      stack(spacing: 2mm, text(font: "Jost", size: 9pt, upper(section-name)), line(length: 100%, stroke: .8pt))))
    v(1em)
  }
  block(text(font: "Jost", weight: "regular", size: 30pt, if appendix or it.numbering == none { it.body } else { lower(it.body) }))
  v(.7em)
  line(length: 100%, stroke: 1.2pt)
}
#show heading.where(level: 2): it => block(above: 15pt, below: 7pt, sticky: true)[
  #line(length: 100%, stroke: 1.2pt)
  #v(3pt)
  #context text(font: "Jost", weight: "medium", size: 15pt)[#counter(heading).display(if appendix-mode.get() {"A.1"} else {"1.1"}) #h(3pt) #it.body]
]
#show heading.where(level: 3): set text(font: "Jost", weight: "medium", size: 12pt)
#page(margin: 0mm, footer: none, fill: rgb("#3b1749"))[
  #place(top + right, image("dizajn/ravnoteza.svg", width: 78mm))
  #place(top + left, dx: 15mm, dy: 17mm, text(font: "Jost", size: 10pt, fill: white, tracking: 1pt)[RADNO IZDANJE])
  #place(left + horizon, dx: 15mm, block(width: 140mm)[
    #text(font: "Jost", size: 42pt, fill: white, lower([$title$]))
    #v(5mm)
    #text(font: "Literata", style: "italic", size: 15pt, fill: rgb("#dcf2e7"), [$subtitle$])
  ])
  #place(bottom, rect(width: 100%, height: 6mm, fill: rgb("#dcf2e7"), stroke: none))
]
#outline(title: [Sadržaj], depth: 2)

