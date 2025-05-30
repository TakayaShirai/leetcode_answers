class Solution {
  func singleNumber(_ nums: [Int]) -> [Int] {
    var xorAll = 0

    for num in nums {
      xorAll ^= num
    }

    let diffBit = xorAll & -xorAll

    var singleNum1 = 0
    var singleNum2 = 0

    for num in nums {
      if (num & diffBit) == 0 {
        singleNum1 ^= num
      } else {
        singleNum2 ^= num
      }
    }

    return [singleNum1, singleNum2]
  }
}
