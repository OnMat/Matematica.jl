# Matematica.jl
Um caderno digital em Julia para o ensino de matemática básica

Acesse o livro [aqui](https://onmat.github.io/Matematica.jl/)!

## Como executar os cadernos

Os cadernos usam a linguagem [Julia](https://julialang.org/) (versão 1.10) no Jupyter.
Depois de instalar a Julia, instale os pacotes no REPL:

```julia
using Pkg
Pkg.add(["IJulia", "Plots"])
```

O `IJulia` registra o kernel da Julia no Jupyter, e o `Plots` é usado no jogo do triângulo
(`geometria/`). Os demais cadernos usam só a biblioteca padrão da Julia.

Os desafios do triângulo (`geometria/Atividade03.ipynb`) carregam os códigos do jogo com
`include("triangulo.jl")`. Esses códigos também aparecem na página *Área de Códigos*
(`geometria/atividade02.ipynb`): ao alterar um deles, altere também o outro.

Quase todos os cadernos leem dados digitados pelo aluno (`readline()`), por isso precisam
ser executados célula a célula. Antes de publicar uma alteração, execute de novo as células
modificadas para atualizar as saídas que aparecem no site.

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
