class Solution {
  func reverseStr(_ s: String, _ k: Int) -> String {
    var curS: String = s
    var curReverseStartIdx: Int = 0

    while curReverseStartIdx < s.count {
      let curReverseEndIdx: Int = min(curReverseStartIdx + k - 1, s.count - 1)
      curS = reverseStr(curS, from: curReverseStartIdx, to: curReverseEndIdx)
      curReverseStartIdx += 2 * k
    }

    return curS
  }

  private func reverseStr(_ str: String, from startIdx: Int, to endIdx: Int) -> String {
    var inputChars = Array(str)

    var left: Int = startIdx
    var right: Int = endIdx

    while left < right {
      let tmp: Character = inputChars[left]
      inputChars[left] = inputChars[right]
      inputChars[right] = tmp

      left += 1
      right -= 1
    }

    return String(inputChars)
  }
}
