#import "comum.typ": *
#set page(width: 210mm, height: 297mm, margin: 0pt)
#pontos(cor: luma(234))
// três pontos discretos nos cantos, fora da mancha de texto
#let p = tres-pontos(r: 1.5mm, cores: (luma(225), luma(225), luma(225)))
#place(top + left, dx: 2 * 7mm, dy: 1.3 * 7mm, p)
#place(top + right, dx: -2 * 7mm, dy: 1.3 * 7mm, p)
#place(bottom + left, dx: 2 * 7mm, dy: -1.3 * 7mm, p)
#place(bottom + right, dx: -2 * 7mm, dy: -1.3 * 7mm, p)
