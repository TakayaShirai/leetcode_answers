class Solution {
  func isPowerOfThree(_ n: Int) -> Bool {
    guard n >= 0 else { return false }

    return (log10(Double(n)) / log10(3)).truncatingRemainder(dividingBy: 1) == 0

    // var curN: Int = n

    // while curN % 3 == 0 {
    //     curN /= 3
    // }

    // return curN == 1
  }
}
