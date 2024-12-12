class Solution {
  func isHappy(_ n: Int) -> Bool {
    guard n != 1 else { return true }

    // Two Pointers
    var slow: Int = n
    var fast: Int = calcSumOfSquares(n)

    while slow != fast {
      slow = calcSumOfSquares(slow)
      fast = calcSumOfSquares(fast)
      fast = calcSumOfSquares(fast)

      if slow == 1 {
        return true
      }
    }

    return false

    // HashSet
    //         var seenSquare: Set<Int> = []
    //         var curSumOfSquDigits: Int = 0
    //         var curNum: Int = n

    //         while curSumOfSquDigits != 1 {
    //             curSumOfSquDigits = calcSumOfSquares(curNum)

    //             if seenSquare.contains(curSumOfSquDigits) {
    //                 return false
    //             } else {
    //                 curNum = curSumOfSquDigits
    //                 seenSquare.insert(curNum)
    //             }
    //         }

    return true
  }

  private func calcDigits(_ n: Int) -> [Int] {
    var n = n
    var digits: [Int] = []

    while n > 0 {
      let digit: Int = n % 10
      digits.append(digit)
      n /= 10
    }

    return digits
  }

  private func calcSumOfSquares(_ n: Int) -> Int {
    var digits: [Int] = calcDigits(n)
    var sum: Int = 0

    for digit in digits {
      sum += digit * digit
    }

    return sum
  }
}
