# Códigos do jogo "Desafios do triângulo" (Matematica.jl)
# Gerado a partir de geometria/atividade02.ipynb (Área de Códigos).
# Ao alterar um código aqui, altere também o caderno.

# ---- Código 1: Gera os pontos, calcula medidas, perímetro e área ----
using Plots

# Lê um número digitado pelo aluno, aceitando vírgula ou ponto decimal
ler_numero() = parse(Float64, replace(strip(readline()), "," => "."))

gr(size=(500, 500))  # Define o backend gráfico e o tamanho da janela

# Declarar fora da função para facilitar o uso depois
global x, y, AB, AC, BC, P, S

function gerar_figura()
    global x, y, AB, AC, BC, P, S  # Necessário para modificar as variáveis globais

    # Geração dos pontos A, B e C
    a = rand(0:10)
    b = rand(0:10)
    x = [a, rand(0:10), rand(0:10), a]  # x[1]=Ax, x[2]=Bx, x[3]=Cx, x[4]=Ax
    y = [b, rand(0:10), rand(0:10), b]  # y[1]=Ay, y[2]=By, y[3]=Cy, y[4]=Ay

    # Cálculo das distâncias entre os pontos
    AB = hypot(x[1] - x[2], y[1] - y[2])
    AC = hypot(x[1] - x[3], y[1] - y[3])
    BC = hypot(x[2] - x[3], y[2] - y[3])

    # Perímetro
    P = round(AB + AC + BC, digits = 1)

    # Área (fórmula do determinante)
    S = abs((x[1]*y[2] + x[2]*y[3] + x[3]*y[1] -
             y[1]*x[2] - y[2]*x[3] - y[3]*x[1])) / 2
    return nothing # Para não “vazar” o valor de S como retorno
end

# ---- Código 2: Plota a figura ----
function plotar_figura(x,y)
    # Shape preenche o interior do triângulo (fillrange = 0 pintaria até o eixo y = 0)
    plot(Shape(x[1:3], y[1:3]),
        title = "Triângulo",
        lw = 3,
        label = false,
        xlim = (-1, 11),
        ylim = (-1, 11),
        xticks = 0:10,
        yticks = 0:10,
        aspect_ratio = :equal,
        fillalpha = 0.5, fillcolor = :yellow,
        grid = :on, gridalpha = 0.7, gridstyle = :dash)
    scatter!(x[1:3], y[1:3],
        label = false,
        annotations = (x[1:3] .+ 0.3, y[1:3] .+ 0.3, ["A", "B", "C"]))
end

# ---- Código 3: Teste de existência do triângulo ----
function existência_triângulo(S)
    println("A figura é um triângulo?:")
    println("\u270D Digite (s/n) para informar sua conclusão:")
    d1 = readline()
    # Verifica a existência através da área:
    if S>0
        exist = "s"  # Sim, o triângulo existe
    else
        exist = "n"  # Não, o triângulo não existe
    end
    if exist == d1
        println("\u2705 Você acertou!")
    else
        println("\u274C Você errou!")
        println("\U0001F501 Retorne à célula anterior e gere novas coordenadas")
    end
end

# ---- Código 4. Verifica os  vértices do triângulo ----
function verificar_vertices(x, y)
    println("Informe as coordenadas x e y do ponto A")
    x_1 = parse(Int, readline())
    y_1 = parse(Int, readline())
    println("Informe as coordenadas x e y do ponto B")
    x_2 = parse(Int, readline())
    y_2 = parse(Int, readline())
    println("Informe as coordenadas x e y do ponto C")
    x_3 = parse(Int, readline())
    y_3 = parse(Int, readline())
    println(repeat("*", 39))
    A = [x[1], y[1]]
    B = [x[2], y[2]]
    C = [x[3], y[3]]
    # Verificação das respostas
    if A == [x_1, y_1]
        println("\u2705 Ponto A!")
    else
        println("\u274C Ponto A!")
        println("\U0001F501 Tente novamente!")
    end

    if B == [x_2, y_2]
        println("\u2705 Ponto B!")
    else
        println("\u274C Ponto B!")
        println("\U0001F501 Tente novamente!")
    end
    if C == [x_3, y_3]
        println("\u2705 Ponto C!")
    else
        println("\u274C Ponto C!")
        println("\U0001F501 Tente novamente!")
    end    
end

# ---- Código 5: Teste das medidas dos lados ----
function verificar_lados(AB,AC,BC)
    # Aceita diferença de até 0,1 em cada lado: a aproximação de raízes sugerida
    # no Desafio 3 pode mudar a primeira casa decimal (√2 ≈ 1,5 em vez de 1,4)
    println("\u270D Informe a medida do lado AB")
    AB_1 = ler_numero()
    println("\u270D Informe a medida do lado AC")
    AC_1 = ler_numero()
    println("\u270D Informe a medida do lado BC")
    BC_1 = ler_numero()

    if abs(AB_1 - AB) <= 0.1
        println("O lado AB: \u2705")
    else
        println("O lado AB: \u274C")
        println("\U0001F501 Tente novamente!")
    end

    if abs(AC_1 - AC) <= 0.1
        println("O lado AC: \u2705")
    else
        println("O lado AC: \u274C")
        println("\U0001F501 Tente novamente!")
    end

    if abs(BC_1 - BC) <= 0.1
        println("O lado BC: \u2705")
    else
        println("O lado BC: \u274C")
        println("\U0001F501 Tente novamente!")
    end
end

# ---- Código 6: Teste de classificação do triângulo (lados) ----
function classificacao_lados(AB, AC, BC)
    println("\u270D Qual classificação do triângulo ABC?")
    println("1\u20E3 Equilátero")
    println("2\u20E3 Isósceles")
    println("3\u20E3 Escaleno")
    d2 = parse(Int, readline())
    # Os quadrados dos lados são inteiros (vértices de coordenadas inteiras):
    # compará-los evita erros de arredondamento das raízes
    ab, ac, bc = round.(Int, (AB^2, AC^2, BC^2))
    if ab == ac && ac == bc
        class = 1   # Equilátero
    elseif ab == ac || ab == bc || ac == bc
        class = 2   # Isósceles
    else
        class = 3   # Escaleno
    end
    if class == d2
        println("\u2705 Você acertou!")
    else
        println("\u274C Você errou!")
        println("\u27F3 Tente novamente!")
    end
end

# ---- Código 7: Cálculo dos ângulos internos ----
function ângulo_interno(AB,AC,BC,S)
    if S == 0
        println("Os pontos não formam um triângulo: gere novas coordenadas.")
        return
    end
    ab, ac, bc = round.(Int, (AB^2, AC^2, BC^2))  # quadrados exatos dos lados
    # Lei dos cossenos: acosd vai de 0° a 180°, então vale também para ângulos obtusos
    α = round(Int, acosd(clamp((ab + ac - bc) / (2 * AB * AC), -1, 1)))  # ângulo em A
    β = round(Int, acosd(clamp((ab + bc - ac) / (2 * AB * BC), -1, 1)))  # ângulo em B
    println("As medidas de dois dos ângulos internos do triângulo ABC são: $(α)° e $(β)°.")
    println("Qual a medida do terceiro ângulo?")
    γ = parse(Int, readline())
    if γ == 180 - α - β
        println("\u2705 Você acertou!")
    else
        println("\u274C Você errou!")
        println("\U0001F501 Refaça seus cálculos e tente novamente")
    end
end

# ---- Código 8: Teste de classificação do triângulo (ângulos) ----
function classificacao_ângulos(AB, AC, BC)
    println("\u270D Qual classificação do triângulo ABC?")
    println("1\u20E3 Acutângulo")     
    println("2\u20E3 Obtusângulo")   
    println("3\u20E3 Retângulo")     
    d3 = parse(Int, readline())  # Armazena a resposta do usuário

    # Quadrados dos lados (inteiros) em ordem crescente: comparar inteiros evita
    # que um triângulo retângulo seja classificado errado por arredondamento
    l = sort(round.(Int, [AB^2, AC^2, BC^2]))

    if l[3] < l[1] + l[2]
        class_a = 1  # Acutângulo
    elseif l[3] > l[1] + l[2]
        class_a = 2  # Obtusângulo
    else
        class_a = 3  # Retângulo
    end
    if class_a == d3
        println("\u2705 Você acertou!")    
    else
        println("\u274C Você errou!")      
        println("\U0001F501 Tente novamente!") 
    end
end

# ---- Código 9: Cálculo do perímetro ----
function perimetro(P)
    println("\u270D Informe a medida do perímetro do triângulo ABC:")
    d4 = ler_numero()
       
    # Aceita pequena diferença: o perímetro soma três lados aproximados
    if abs(d4 - P) <= 0.25
        println("\u2705 Sua resposta está correta!")
        println("O perímetro do triângulo ABC mede: $P unidades.")
    else
        println("\u274C Sua resposta está incorreta.")
        println("\u21BA Tente novamente!")
    end
end

# ---- Código 10: Cálculo da área ----
function area(S)
    println("\u270D Informe a medida da área do triângulo ABC:")       
    d5 = ler_numero() # Recebe o valor da área
    if d5 == S
        println("\u2705 Sua resposta está correta!")                   
        println("A área do triângulo ABC mede: $S unidades².")
        println("\u2728 PARABÉNS! \u2728")                
        println()
        println("Se você está lendo esta mensagem, significa que venceu todos os desafios!")
        println("Excelente trabalho, continue praticando e desafiando sua mente!")  
        println("Até os próximos desafios!")                       
    else
        println("\u274C Sua resposta está incorreta.")                  
        println("\u21BB Tente novamente!") 
    end
end
