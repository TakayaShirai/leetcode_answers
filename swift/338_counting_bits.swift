class Solution {
  func countBits(_ n: Int) -> [Int] {
    var dp = Array(repeating: 0, count: n + 1)
    var offset: Int = 1

    for i in 1..<(n + 1) {
      if offset * 2 == i {
        offset = i
      }

      dp[i] = 1 + dp[i - offset]
    }

    return dp

    //         var res = [Int]()

    //         for i in 0...n {
    //             var cur = i
    //             res.append(0)

    //             while cur > 0 {
    //                 cur = cur & (cur - 1)
    //                 res[i] += 1
    //             }
    //         }

    //         return res
  }
}
