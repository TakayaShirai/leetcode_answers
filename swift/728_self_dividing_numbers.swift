class Solution {
  func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
    var selfDivNums: [Int] = []

    for num in left...right {
      if isSelfDividingNumber(num) {
        selfDivNums.append(num)
      }
    }

    return selfDivNums
  }

  private func isSelfDividingNumber(_ num: Int) -> Bool {
    guard num != 0 else { return false }

    var curNum: Int = num

    while curNum > 0 {
      let digit: Int = curNum % 10
      guard digit != 0 && num % digit == 0 else { return false }
      curNum /= 10
    }

    return true
  }
}
