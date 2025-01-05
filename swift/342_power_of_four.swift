class Solution {
  func isPowerOfFour(_ n: Int) -> Bool {
    guard n != 0 else { return false }

    return n & (n - 1) == 0 && (n - 1) % 3 == 0
    // var curN: Int = n

    // while curN % 4 == 0 {
    //     curN /= 4
    // }

    // return curN == 1
  }
}
