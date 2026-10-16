// Cores: roxo do tema e as três cores do logotipo da linguagem Julia
#let roxo = rgb("#4B2A73")
#let j-vermelho = rgb("#CB3C33")
#let j-verde = rgb("#389826")
#let j-roxo = rgb("#9558B2")

// malha pontilhada de caderno, cobrindo a página A4
#let pontos(cor: luma(222), passo: 7mm, raio: 0.45pt) = {
  for i in range(1, 30) {
    for j in range(1, 43) {
      place(top + left, dx: i * passo - raio, dy: j * passo - raio,
        circle(radius: raio, fill: cor, stroke: none))
    }
  }
}

// os três pontos do logotipo da Julia
#let tres-pontos(r: 2.2mm, cores: (j-vermelho, j-verde, j-roxo)) = box(
  width: 4.6 * r, height: 4 * r, {
    place(top + left, dx: 0pt, dy: 2 * r, circle(radius: r, fill: cores.at(0), stroke: none))
    place(top + left, dx: 1.3 * r, dy: 0pt, circle(radius: r, fill: cores.at(1), stroke: none))
    place(top + left, dx: 2.6 * r, dy: 2 * r, circle(radius: r, fill: cores.at(2), stroke: none))
  })

// uma célula de caderno Jupyter (entrada e saída)
#let celula(n, entrada, saida) = {
  set text(size: 10.5pt)
  set align(left)
  show raw: set text(font: "DejaVu Sans Mono", size: 10.5pt)
  grid(columns: (20mm, 1fr), row-gutter: 2.2mm, align: horizon,
    align(right, text(font: "DejaVu Sans Mono", fill: rgb("#303F9F"))[In \[#n\]:]),
    block(width: 100%, fill: luma(246), stroke: 0.6pt + luma(215), inset: 2.4mm, radius: 1pt, raw(entrada, lang: "julia")),
    align(right, text(font: "DejaVu Sans Mono", fill: rgb("#D84315"))[Out\[#n\]:]),
    block(width: 100%, inset: (x: 2.4mm, y: 0.6mm), raw(saida)),
  )
}

// o caderno da capa e da página inicial: uma célula para cada sequência didática
#let caderno() = block(width: 150mm, fill: white, stroke: 0.8pt + luma(200),
  inset: (x: 6mm, top: 5mm, bottom: 4mm), {
  set align(left)
  grid(columns: (auto, 1fr), column-gutter: 3mm, align: horizon,
    tres-pontos(r: 1.6mm),
    text(font: "DejaVu Sans Mono", size: 9pt, fill: luma(110))[caderno.ipynb — Julia 1.10])
  v(1mm)
  line(length: 100%, stroke: 0.5pt + luma(220))
  v(2mm)
  celula(1, "3//4 + 1//2", "5//4")
  celula(2, "x = 5; 2x + 3", "13")
  celula(3, "a, b = 3, 4; sqrt(a^2 + b^2)", "5.0")
  celula(4, "3.8 * 1000  # toneladas → kg", "3800.0")
  celula(5, "notas = [7, 8, 5, 10]; sum(notas) / length(notas)", "7.5")
})
