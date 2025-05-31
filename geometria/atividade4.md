---
title: 🎮 Jogo do Ângulo Complementar
subject: Convivendo com a Geometria
---


O jogo é uma implementação em Julia beseado em:
**Definição:** Sejam $\alpha$ e $\beta$ ângulos compreendidos entre $0^\circ$ e $90^\circ$. Dizemos que eles são complementares se $\alpha + \beta = 90^\circ$.

## Descritores

Lorem ipsum dolor sit amet, consectetur adipiscing elit.

## Objetivo

Neste desafio, o código vai fornecer a medida de **um ângulo** compreendido entre 0 e 90 graus. Seu objetivo é **descobrir** e **informar** a medida do **ângulo complementar** a esse, com base na definição de ângulo complementar.



## Materiais necessários

* Lorem ipsum dolor sit amet, consectetur adipiscing elit.
* Lorem ipsum dolor sit amet, consectetur adipiscing elit.

:::{note}
Use uma tesoura bem afiada para garantir cortes perfeitos.
:::

## Como jogar

1. O código gerará um ângulo aleatório entre 0 e 90 graus, múltiplos de 5.
2. Você deve calcular o valor do **ângulo complementar**.
3. O código verificará sua resposta e fornecerá um feedback.

## Início do jogo

println(repeat("*", 34))
println("🏆 JOGO DO ÂNGULO COMPLEMENTAR 🏆")
println(repeat("*", 34))

α = rand(0:90)
println("Qual o ângulo COMPLEMENTAR de $α graus? ")
β = parse(Int, readline())

if α + β == 90
    println("Parabéns, você acertou! 👏👏👏👏👏👏👏👏👏👏")
else
    println("Não foi dessa vez! 😭😭😭😭😭😭😭")
end

## Fim do jogo

Lorem ipsum dolor sit amet, consectetur adipiscing elit.

:::{seealso}
Confira outros jogos ...
:::
