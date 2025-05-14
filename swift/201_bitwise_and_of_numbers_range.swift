class Solution {
  func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
    var curLeft: Int = left
    var curRight: Int = right
    var shiftCnt: Int = 0

    while curLeft < curRight {
      curLeft >>= 1
      curRight >>= 1
      shiftCnt += 1
    }

    return curLeft << shiftCnt
  }
}
