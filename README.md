# Matematica.jl
Um caderno digital em Julia para o ensino de matemática básica

Acesse o livro [aqui](https://onmat.github.io/Matematica.jl/)!

## Site

O site é publicado pelo GitHub Actions a cada push na branch `main`
(`.github/workflows/deploy.yml`).

## PDF

O PDF em `exports/Matematica.jl.pdf` **não** é gerado pelo GitHub Actions: ele é gerado
localmente e versionado junto com o site, que o oferece no botão *Download PDF*.

Para regerar depois de alterar alguma página ou caderno:

```bash
jupyter book build --pdf
```

É preciso ter o [Typst](https://github.com/typst/typst) instalado. A configuração está em
`export.yml` (margens, cores, prefácio e agradecimentos), os capítulos e seções do PDF
estão em `pdf-toc.yml` e o modelo em `template/`. Ao incluir ou remover uma atividade,
atualize tanto o `toc` do `myst.yml` (site) quanto o `pdf-toc.yml` (PDF).

A capa, o fundo das páginas e a figura da página inicial são imagens em
`assets/capa.png`, `assets/fundo.png` e `assets/caderno.png`, geradas a partir dos
arquivos em `capa/`:

```bash
cd capa
typst compile --format png --ppi 150 capa.typ ../assets/capa.png
typst compile --format png --ppi 150 fundo.typ ../assets/fundo.png
typst compile --format png --ppi 150 caderno.typ ../assets/caderno.png
```

Também podem ser substituídas por imagens feitas em outro programa, desde que no
tamanho A4 (1240 × 1754 pixels a 150 ppi).
