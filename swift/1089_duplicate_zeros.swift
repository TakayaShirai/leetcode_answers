class Solution {
  func duplicateZeros(_ arr: inout [Int]) {
    var length: Int = arr.count - 1
    var lastFillPos: Int = arr.count - 1
    var curPos: Int = 0

    while curPos <= lastFillPos {
      if arr[curPos] == 0 {
        guard curPos != lastFillPos else {
          arr[length] = 0
          length -= 1
          lastFillPos -= 1
          break
        }
        lastFillPos -= 1
      }

      curPos += 1
    }

    var shift: Int = length - lastFillPos

    for curPos in (0...lastFillPos).reversed() {
      let curNum: Int = arr[curPos]
      if curNum == 0 {
        arr[curPos + shift] = 0
        arr[curPos + shift - 1] = 0
        shift -= 1
      } else {
        arr[curPos + shift] = curNum
      }
    }
  }
}
