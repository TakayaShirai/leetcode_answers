class Solution {
  func isPowerOfTwo(_ n: Int) -> Bool {
    // Bit Manupulation
    guard n != 0 else { return false }
    return n & (n - 1) == 0

    // Iterative
    // var curN: Int = n

    // while curN % 2 == 0 && curN > 0 {
    //     curN /= 2
    // }

    // return curN == 1
  }
}
