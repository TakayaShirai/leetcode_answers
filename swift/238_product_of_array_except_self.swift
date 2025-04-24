class Solution {
  func productExceptSelf(_ nums: [Int]) -> [Int] {
    var productArray: [Int] = Array(repeating: 1, count: nums.count)

    // Multiply elements to the left of current index
    var leftProduct: Int = nums[0]

    for curIdx in 1..<nums.count {
      productArray[curIdx] *= leftProduct
      leftProduct *= nums[curIdx]
    }

    // Multiply elements to the right of current index
    var rightProduct: Int = nums[nums.count - 1]

    for curIdx in (0..<nums.count - 1).reversed() {
      productArray[curIdx] *= rightProduct
      rightProduct *= nums[curIdx]
    }

    return productArray
  }
}
