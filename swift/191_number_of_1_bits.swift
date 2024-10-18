class Solution {
  func hammingWeight(_ n: Int) -> Int {
    var res: Int = 0
    var n = n

    while n > 0 {
      n = n & (n - 1)
      res += 1
    }

    return res

    //         var res: Int = 0
    //         var n = n

    //         while n > 0 {
    //             let cur = n % 2
    //             n = n / 2
    //             res += cur
    //         }

    //         return res
  }
}
