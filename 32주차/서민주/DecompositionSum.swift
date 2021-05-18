if let input = readLine(), let N = Int(input) {
    var answer = 0

    let start = N - 9 * input.count // 길이가 같고 자리수가 모두 9인 경우 고려해 최소로 설정
    for i in  start..<N {
        var (constructor, sum) = (i, i)
        while constructor > 0 && sum <= N {
            sum += constructor % 10
            constructor /= 10
        }

        if sum == N {
            answer = i
            break
        }
    }
    
    print(answer)
}
