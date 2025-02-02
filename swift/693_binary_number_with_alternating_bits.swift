class Solution {
  func hasAlternatingBits(_ n: Int) -> Bool {
    var xorN = n ^ (n >> 1)
    return xorN & (xorN + 1) == 0

    // var curN: Int = n
    // var prevBit: Int = 0

    // while curN > 0 {
    //     if curN == n {
    //         prevBit = curN % 2
    //         curN /= 2
    //     }

    //     let curBit: Int = curN % 2
    //     guard curBit != prevBit else { return false }
    //     curN /= 2
    //     prevBit = curBit
    // }

    // return true
  }
}
