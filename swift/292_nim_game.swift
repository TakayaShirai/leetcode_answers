class Solution {
  func canWinNim(_ n: Int) -> Bool {
    return n % 4 != 0

    //     if n <= 3 {
    //         return true
    //     }

    //     var canWin: [Bool] = Array(repeating: false, count: n)

    //     for i in 0..<3 {
    //         canWin[i] = true
    //     }

    //     for i in 3..<n {
    //         for j in 1...3 {
    //             if canWin[i - j] == false {
    //                 canWin[i] = true
    //                 break
    //             }

    //             if j == 3 {
    //                 canWin[i] = false
    //             }
    //         }
    //     }

    //     return canWin[n - 1]
  }
}
