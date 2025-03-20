class Solution {
  func divisorGame(_ n: Int) -> Bool {
    return n % 2 == 0
    // guard n != 1 else { return false }

    // var canWinArr: [Bool] = Array(repeating: false, count: n + 1)
    // canWinArr[0] = false
    // canWinArr[1] = false

    // for num in 2...n {
    //   for div in 1..<num {
    //     if num % div == 0 && !canWinArr[num - div] {
    //       canWinArr[num] = true
    //       break
    //     }
    //   }
    // }

    // return canWinArr[n]
  }
}
