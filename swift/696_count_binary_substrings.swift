class Solution {
  func countBinarySubstrings(_ s: String) -> Int {
    let inputChars: [Character] = Array(s)

    var prevGroupCnt: Int = 0
    var curGroupCnt: Int = 1
    var substrCnt: Int = 0

    for idx in 1..<inputChars.count {
      if inputChars[idx - 1] != inputChars[idx] {
        substrCnt += min(prevGroupCnt, curGroupCnt)
        prevGroupCnt = curGroupCnt
        curGroupCnt = 1
      } else {
        curGroupCnt += 1
      }
    }

    substrCnt += min(prevGroupCnt, curGroupCnt)

    return substrCnt
  }
}
