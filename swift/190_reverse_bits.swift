class Solution {
  func reverseBits(_ n: Int) -> Int {
    var res: Int = 0
    var n = n

    for i in 0..<32 {
      res = res << 1
      res += n % 2
      n = n >> 1
    }

    return res
  }
}
