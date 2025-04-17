class Solution {
  func maxArea(_ height: [Int]) -> Int {
    var left: Int = 0
    var right: Int = height.count - 1
    var curMaxArea: Int = 0

    while left < right {
      let leftHeight: Int = height[left]
      let rightHeight: Int = height[right]
      let minHeight: Int = min(leftHeight, rightHeight)

      curMaxArea = max(curMaxArea, minHeight * (right - left))

      if leftHeight > rightHeight {
        right -= 1
      } else {
        left += 1
      }
    }

    return curMaxArea
  }
}
