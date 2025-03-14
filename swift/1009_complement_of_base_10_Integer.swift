class Solution {
  func bitwiseComplement(_ n: Int) -> Int {
    var mask: Int = 1

    while mask < n {
      mask <<= 1
      mask += 1
    }

    return mask ^ n
  }
}
