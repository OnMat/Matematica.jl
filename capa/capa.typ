#import "comum.typ": *
#set page(width: 210mm, height: 297mm, margin: 0pt)
#set text(font: "Libertinus Serif", lang: "pt")
#pontos()

#place(top + center, dy: 30mm, block(width: 160mm, align(center)[
  #text(12pt, tracking: 2pt, fill: roxo.lighten(15%), upper[Produto educacional])
  #v(6mm)
  #text(44pt, weight: "bold", fill: roxo)[Matematica#text(fill: j-roxo)[.jl]]
  #v(4mm)
  #line(length: 60mm, stroke: 1.5pt + roxo)
  #v(4mm)
  #text(15pt, fill: luma(60))[Um caderno digital em Julia para o ensino de matemática \ nos anos finais do ensino fundamental]
]))

// um caderno com uma célula para cada sequência didática
#place(top + center, dy: 118mm, caderno())

#place(bottom + center, dy: -24mm, block(width: 160mm, align(center)[
  #text(14pt, fill: luma(40))[José Jailton Azevedo do Nascimento]
  #v(1.5mm)
  #text(11.5pt, fill: luma(70))[Orientador: Prof. Dr. Vicente Helano F. Batista Sobrinho]
  #v(3mm)
  #text(11pt, fill: luma(90))[PROFMAT · Universidade Federal do Cariri · 2025]
]))
