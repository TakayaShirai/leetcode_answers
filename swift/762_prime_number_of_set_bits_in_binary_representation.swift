class Solution {
  func countPrimeSetBits(_ left: Int, _ right: Int) -> Int {
    guard left <= right else { return 0 }

    var primeBitCnt: Int = 0

    for num in left...right {
      let numBitCnt: Int = countBits(of: num)

      if isPrime(numBitCnt) {
        primeBitCnt += 1
      }
    }

    return primeBitCnt
  }

  private func isPrime(_ num: Int) -> Bool {
    guard num != 1 else { return false }

    var sqrtNum: Int = Int(Double(num).squareRoot())

    guard sqrtNum >= 2 else { return true }

    for curNum in 2...sqrtNum {
      guard num % curNum != 0 else { return false }
    }

    return true
  }

  private func countBits(of num: Int) -> Int {
    guard num > 0 else { return 0 }

    var curNum: Int = num
    var bitCnt: Int = 0

    while curNum > 0 {
      curNum &= curNum - 1
      bitCnt += 1
    }

    return bitCnt
  }
}
