---
title: Familiarização com a Julia e o Jupyter
subject: Sequência Didática
---

Antes de iniciar efetivamente as sequências didáticas, é necessário apresentar aos estudantes as metodologias e os recursos que serão utilizados ao longo das aulas. Essa etapa inicial tem como objetivo familiarizá-los com o ambiente de programação (neste caso, o Jupyter Notebook) e com a linguagem Julia. Além disso, serão discutidas as diferentes formas de interação com os cadernos digitais, promovendo um uso consciente e funcional das ferramentas computacionais.

## Conteúdos abordados


- Noções básicas sobre o _Jupyter Notebook_:
    - Interface do ambiente: atalhos principais.
    - Tipos de células: texto (_Markdown_) e código;
    - Organização e execução das células.
- Fundamentos da linguagem Julia:
    - Operadores básicos: adição, subtração, multiplicação, divisão, potência e módulo;
    - Tipos, declaração e manipulação de variáveis;
    - Comandos de entrada e saída: `println`, `parse` e `readline`;
    - Controle de fluxo: `if`, `else`, `elseif`;
    - Estrutura de repetição: `for`.

## Carga horária

Quatro aulas de 50 minutos.

## Desenvolvimento

Durante esta aula, será adotada uma abordagem expositiva e demonstrativa, com intervenções práticas que permitam aos alunos experimentarem diretamente os conceitos apresentados. A familiarização com o ambiente Jupyter Notebook é essencial para o desenvolvimento autônomo dos desafios computacionais que serão propostos nas etapas seguintes.

Neste primeiro momento, é recomendável limitar-se às operações básicas e à declaração de variáveis, de modo a não sobrecarregar os estudantes com estruturas mais complexas. Tópicos como estruturas condicionais e comandos de repetição serão aprofundados posteriormente, à medida que surgirem demandas específicas.

Para cumprir com este momento, recomenda-se que os alunos realizem os três problemas a seguir.

```{exercise}
:label: familiarizacao-sucant
Desenvolva um programa que solicite ao usuário um número inteiro. O programa deve calcular e exibir o antecessor e o sucessor desse número de forma clara e organizada.
```

````{solution} familiarizacao-sucant
:class: dropdown
```{code-block} julia
println(repeat("*", 25))
println("* ANTECESSOR E SUCESSOR *")
println(repeat("*", 25))
# Solicita um número inteiro ao usuário
println("Digite um número inteiro: ")
num = parse(Int,readline())
# Calcula o antecessor e o sucessor
ant = num - 1
suc = num + 1
# Exibe o resultado de forma clara
println("O número digitado foi $num.")
println("Seu antecessor é $ant.")
println("Seu sucessor é $suc.")
```
````

```{exercise}
:label: familiarizacao-tabuada
Crie uma tabuada de multiplicação interativa. O programa deve solicitar um número inteiro ao usuário e imprimir a tabuada completa desse número como saída.
```

````{solution} familiarizacao-tabuada
:class: dropdown
```{code-block} julia
println("Você deseja calcular a tabuada de qual número?: ")
a = parse(Int, readline())
println("* TABUADA DE MULTIPLICAÇÃO DO $a *" )
println("1 x $a = $(1*a)" )
println("2 x $a = $(2*a)" )  
println("3 x $a = $(3*a)" )
println("4 x $a = $(4*a)" )
println("5 x $a = $(5*a)" )
println("6 x $a = $(6*a)" )
println("7 x $a = $(7*a)" )
println("8 x $a = $(8*a)" )
println("9 x $a = $(9*a)" )
println("10 x $a = $(10*a)")
```
````

```{exercise}
:label: familiarizacao-tabuada-for
Refaça o [](#familiarizacao-tabuada) usando o comando `for`.
```

````{solution} familiarizacao-tabuada-for
:class: dropdown
```{code-block} julia
println("Você deseja calcular a tabuada de qual número?: ")
a = parse(Int, readline())
println("* TABUADA DE MULTIPLICAÇÃO DO $a *")
for i in 1:10
    println("$i x $a = $(i*a)")
end
```
````