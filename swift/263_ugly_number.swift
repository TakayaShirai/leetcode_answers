class Solution {
  func isUgly(_ n: Int) -> Bool {
    // 1. Divide n by 2 while n can be divided by 2 without a remainder.
    // 2. Divide n by 3 while n can be divided by 3 without a remainder.
    // 3. Divide n by 5 while n can be divided by 5 without a remainder.
    // 4. Return true if n == 1, otherwise false.
    guard n > 0 else { return false }

    var curNum: Int = n

    while curNum % 2 == 0 {
      curNum /= 2
    }

    while curNum % 3 == 0 {
      curNum /= 3
    }

    while curNum % 5 == 0 {
      curNum /= 5
    }

    return curNum == 1
  }
}
