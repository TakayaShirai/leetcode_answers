class Solution {
  func numPrimeArrangements(_ n: Int) -> Int {
    let primesCnt = calcNumOfPrimeNums(n)
    let nonPrimesCnt = n - primesCnt
    let mod = 1_000_000_007

    return (calcFactorial(of: primesCnt) * calcFactorial(of: nonPrimesCnt)) % mod
  }

  private func calcNumOfPrimeNums(_ num: Int) -> Int {
    guard num >= 2 else { return 0 }

    var isPrime = Array(repeating: true, count: num + 1)
    isPrime[0] = false
    isPrime[1] = false

    for curNum in 2...num where isPrime[curNum] {
      var multiple = curNum * curNum
      while multiple <= num {
        isPrime[multiple] = false
        multiple += curNum
      }
    }

    return isPrime.filter { $0 }.count
  }

  private func calcFactorial(of num: Int) -> Int {
    guard num != 0 else { return 1 }
    let mod = 1_000_000_007
    return (1...num).reduce(1) { ($0 * $1) % mod }
  }
}
