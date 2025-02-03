class Solution {
  func isOneBitCharacter(_ bits: [Int]) -> Bool {
    var curIdx: Int = 0

    while curIdx <= (bits.count - 2) {
      if bits[curIdx] == 1 {
        curIdx += 2
      } else {
        curIdx += 1
      }
    }

    return curIdx == bits.count - 1
  }
}
