class Solution {
  func checkPerfectNumber(_ num: Int) -> Bool {
    return calcDivisorsSumWithoutNumItself(num) == num
  }

  private func calcDivisorsSumWithoutNumItself(_ num: Int) -> Int {
    guard num != 1 else { return 0 }

    var curSum: Int = 1
    let sqrt: Int = Int(sqrt(Double(num)))

    guard sqrt >= 2 else { return curSum }

    for i in 2...sqrt {
      if num % i == 0 {
        curSum += i
        curSum += num / i
      }
    }

    return curSum
  }
}
