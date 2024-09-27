class Solution {
  func countSubstrings(_ s: String) -> Int {
    guard s.count > 1 else { return s.count }

    let arrayS = Array(s)
    let lenS: Int = arrayS.count
    var count: Int = 0

    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: lenS), count: lenS)

    for lenSubS in 1...lenS {
      for left in 0..<(lenS - lenSubS + 1) {
        let right = left + lenSubS - 1

        if arrayS[left] == arrayS[right] && (right - left + 1 <= 2 || dp[left + 1][right - 1] == 1)
        {
          dp[left][right] = 1
          count += 1
        }
      }
    }

    return count
  }
}
