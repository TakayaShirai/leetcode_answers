class Solution {
  func characterReplacement(_ s: String, _ k: Int) -> Int {
    var array = Array(s)
    var seen: [Character: Int] = [:]
    var res: Int = 0

    var left: Int = 0
    var maxF: Int = 0

    for right in 0..<array.count {
      seen[array[right], default: 0] += 1

      maxF = max(maxF, seen[array[right]]!)

      while (right - left + 1) - maxF > k {
        seen[array[left]]! -= 1
        left += 1
      }

      res = max(res, right - left + 1)
    }

    return res
  }
}
