class Solution {
  func numSquares(_ n: Int) -> Int {
    guard n > 0 else { return 0 }

    var requiredSquares: [Int] = Array(repeating: n, count: n + 1)
    requiredSquares[0] = 0
    requiredSquares[1] = 1

    let squares: [Int] = findSquares(to: n)

    for num in 0...n {
      for square in squares {
        guard num - square >= 0 else { break }
        requiredSquares[num] = min(requiredSquares[num], requiredSquares[num - square] + 1)
      }
    }

    return requiredSquares[n]
  }

  private func findSquares(to num: Int) -> [Int] {
    var squares: [Int] = []
    var curNum: Int = 1

    while curNum * curNum <= num {
      squares.append(curNum * curNum)
      curNum += 1
    }

    return squares
  }
}
