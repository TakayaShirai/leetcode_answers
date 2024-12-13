class Solution {
  func maxArea(_ height: [Int]) -> Int {
    var curMaxArea: Int = 0
    var leftHeightIdx: Int = 0
    var rightHeightIdx: Int = height.count - 1

    while leftHeightIdx < rightHeightIdx {
      let leftHeight = height[leftHeightIdx]
      let rightHeight = height[rightHeightIdx]

      let curArea = min(leftHeight, rightHeight) * (rightHeightIdx - leftHeightIdx)

      curMaxArea = max(curMaxArea, curArea)

      if leftHeight > rightHeight {
        rightHeightIdx -= 1
      } else {
        leftHeightIdx += 1
      }
    }

    return curMaxArea
  }
}
