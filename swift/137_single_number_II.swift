class Solution {
  func singleNumber(_ nums: [Int]) -> Int {
    let bitsInInt = 32
    let appearanceCnt = 3
    var singleNum = 0

    for bitPos in 0..<bitsInInt {
      var bitCnt = 0
      let mask = 1 << bitPos

      for num in nums {
        if num & mask != 0 {
          bitCnt += 1
        }
      }

      if bitCnt % appearanceCnt != 0 {
        singleNum |= mask
      }
    }

    if singleNum >= (1 << 31) {
      singleNum = singleNum - (1 << 32)
    }

    return singleNum
  }
}
