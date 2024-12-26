class Solution {
  func divide(_ dividend: Int, _ divisor: Int) -> Int {
    if dividend == Int(Int32.min) && divisor == -1 {
      return Int(Int32.max)
    }

    let isDividendPositive: Bool = dividend >= 0
    let isDivisorPositive: Bool = divisor >= 0

    var isQuotientPositive: Bool = isDividendPositive == isDivisorPositive

    var posDividend: Int = abs(dividend)
    var posDivisor: Int = abs(divisor)
    var quotient: Int = 0

    while posDividend >= posDivisor {
      var powerTwo: Int = 0
      while posDividend > (posDivisor << (powerTwo + 1)) {
        powerTwo += 1
      }
      quotient += (1 << powerTwo)
      posDividend -= posDivisor << powerTwo
    }

    return isQuotientPositive ? quotient : -quotient

    // let isDividendPositive: Bool = dividend >= 0
    // let isDivisorPositive: Bool = divisor >= 0

    // var quotient: Int = 0

    // if isDividendPositive && isDivisorPositive {
    //   quotient = bothPositiveDivide(dividend, divisor)
    // } else if !isDividendPositive && !isDivisorPositive {
    //   quotient = bothNegativeDivide(dividend, divisor)
    // } else {
    //   quotient = positiveAndNegativeDivide(dividend, divisor)
    // }

    // return quotient
  }

  //   private func bothPositiveDivide(_ dividend: Int, _ divisor: Int) -> Int {
  //     var quotient: Int = 0
  //     var remain: Int = dividend

  //     while remain >= divisor && quotient < Int(Int32.max) {
  //       remain -= divisor
  //       quotient += 1
  //     }

  //     return quotient
  //   }

  //   private func bothNegativeDivide(_ dividend: Int, _ divisor: Int) -> Int {
  //     let posDividend: Int = -dividend
  //     let posDivisor: Int = -divisor

  //     var quotient: Int = 0
  //     var remain: Int = posDividend

  //     while remain >= posDivisor && quotient < Int(Int32.max) {
  //       remain -= posDivisor
  //       quotient += 1
  //     }

  //     return quotient
  //   }

  //   private func positiveAndNegativeDivide(_ dividend: Int, _ divisor: Int) -> Int {
  //     let posDividend: Int = abs(dividend)
  //     let posDivisor: Int = abs(divisor)

  //     var quotient: Int = 0
  //     var remain: Int = posDividend

  //     while remain >= posDivisor && quotient > Int(Int32.min) {
  //       remain -= posDivisor
  //       quotient -= 1
  //     }

  //     return quotient
  //   }
}
