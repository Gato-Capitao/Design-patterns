def fatorial(num)
    dp = Array.new(num+1)

    dp[0] = 1

    for index in 1..num
        dp[index] = index*dp[index-1]
    end

    return dp[num]
end

puts fatorial(30000)
