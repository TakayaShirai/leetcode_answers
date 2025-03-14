class Solution {
  func kLengthApart(_ nums: [Int], _ k: Int) -> Bool {
    var prevOneIdx: Int = -(k + 1)

    for (idx, num) in nums.enumerated() {
      if num == 1 {
        print(idx, prevOneIdx)
        guard idx - prevOneIdx - 1 >= k else { return false }
        prevOneIdx = idx
      }
    }

    return true
  }
}
