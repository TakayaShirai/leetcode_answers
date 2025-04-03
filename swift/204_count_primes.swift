class Solution {
  func countPrimes(_ n: Int) -> Int {
    guard n >= 2 else { return 0 }

    var isPrimes = Array(repeating: true, count: n)
    isPrimes[0] = false
    isPrimes[1] = false

    for num in 2..<Int(Double(n).squareRoot()) + 1 {
      guard isPrimes[num] else { continue }

      var curNum = num + num

      while curNum < n {
        isPrimes[curNum] = false
        curNum += num
      }
    }

    return isPrimes.filter { $0 }.count
  }
}
