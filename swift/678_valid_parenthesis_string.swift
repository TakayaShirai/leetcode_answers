class Solution {
  func checkValidString(_ s: String) -> Bool {
    // Greedy
    let arrayS = Array(s)

    var leftMin: Int = 0
    var leftMax: Int = 0

    for char in arrayS {
      if char == "(" {
        leftMin += 1
        leftMax += 1
      } else if char == ")" {
        leftMin -= 1
        leftMax -= 1
      } else {
        leftMin -= 1
        leftMax += 1
      }

      if leftMax < 0 {
        return false
      }

      if leftMin < 0 {
        leftMin = 0
      }
    }

    return leftMin == 0

    // DP
    //         let n = s.count
    //         let arrayS = Array(s)

    //         var dp = Array(repeating: Array(repeating: false, count: n + 1), count: n + 1)
    //         dp[n][0] = true

    //         for i in (0..<n).reversed() {
    //             for open in 0..<n {
    //                 var res = false
    //                 if arrayS[i] == "*" {
    //                     res = dp[i + 1][open + 1]
    //                     if open > 0 {
    //                         res = res || dp[i + 1][open - 1]
    //                     }
    //                     res = res || dp[i + 1][open]
    //                 } else if arrayS[i] == "(" {
    //                     res = dp[i + 1][open + 1]
    //                 } else if open > 0 {
    //                     res = dp[i + 1][open - 1]
    //                 }
    //                 dp[i][open] = res
    //             }
    //         }

    //         return dp[0][0]
  }
}
