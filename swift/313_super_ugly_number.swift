class Solution {
  func nthSuperUglyNumber(_ n: Int, _ primes: [Int]) -> Int {
    guard n > 1 else { return 1 }

    var superUglyNums = Array(repeating: 0, count: n)
    superUglyNums[0] = 1

    var nextMinPrimePointers = Array(repeating: 0, count: primes.count)

    for curUglyNumIdx in 1..<n {
      var smallestCand: Int = Int.max

      for primeIdx in 0..<primes.count {
        let uglyNumIdx: Int = nextMinPrimePointers[primeIdx]
        let curPrimeNum = primes[primeIdx]
        let baseUglyNum = superUglyNums[uglyNumIdx]

        let cand: Int = baseUglyNum * curPrimeNum
        smallestCand = min(smallestCand, cand)
      }

      superUglyNums[curUglyNumIdx] = smallestCand

      for primeIdx in 0..<primes.count {
        let uglyNumIdx: Int = nextMinPrimePointers[primeIdx]
        let curPrimeNum = primes[primeIdx]
        let baseUglyNum = superUglyNums[uglyNumIdx]

        if baseUglyNum * curPrimeNum == smallestCand {
          nextMinPrimePointers[primeIdx] += 1
        }
      }
    }

    return superUglyNums[n - 1]
  }
}
