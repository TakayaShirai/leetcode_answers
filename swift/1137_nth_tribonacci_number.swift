class Solution {
  func tribonacci(_ n: Int) -> Int {
    if n == 0 {
      return 0
    } else if n == 1 || n == 2 {
      return 1
    }

    var tn: Int = 0
    var tn1: Int = 1
    var tn2: Int = 1

    for _ in 2..<n {
      let curNum = tn + tn1 + tn2
      tn = tn1
      tn1 = tn2
      tn2 = curNum
    }

    return tn2

    //         var tribonacciSequence: [Int] = [0, 1, 1]

    //         for i in 3..<n+1 {
    //             let curNum = tribonacciSequence[i-3] + tribonacciSequence[i-2] + tribonacciSequence[i-1]
    //             tribonacciSequence.append(curNum)
    //         }

    //         return tribonacciSequence[n]
  }
}
