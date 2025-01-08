class Solution {
  func myPow(_ x: Double, _ n: Int) -> Double {
    guard x != 1 else { return 1 }

    // Bit Manipulation
    var powRes: Double = 1
    var curN: Int = n > 0 ? n : -n
    var curPow: Double = n > 0 ? x : 1 / x

    while curN > 0 {
      if curN & 1 == 1 {
        powRes *= curPow
      }

      curPow *= curPow
      curN = curN >> 1
    }

    return powRes

    // Recursive
    // if n >= 0 {
    //     return helperPositivePow(x, n)
    // } else {
    //     return helperNegativePow(x, n)
    // }
  }

  private func helperPositivePow(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
      return 1
    } else if n == 1 {
      return x
    }

    if n % 2 == 0 {
      return helperPositivePow(x, n / 2) * helperPositivePow(x, n / 2)
    } else {
      return helperPositivePow(x, n / 2) * helperPositivePow(x, n / 2) * x
    }
  }

  private func helperNegativePow(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
      return 1
    } else if n == -1 {
      return 1 / x
    }

    if n % 2 == 0 {
      return helperNegativePow(x, n / 2) * helperNegativePow(x, n / 2)
    } else {
      return helperNegativePow(x, n / 2) * helperNegativePow(x, n / 2) / x
    }
  }
}
