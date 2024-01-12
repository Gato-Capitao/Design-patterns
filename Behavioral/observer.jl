using Base

# Cria um Vector de números inteiros
vector = Base.Vector()

# Adiciona elementos ao Vector
vector = push!(vector, UInt8(1))
vector = push!(vector, UInt8(2))
vector = push!(vector, UInt8(3))

vector[1] = 2

# Imprime o Vector
println(vector)

