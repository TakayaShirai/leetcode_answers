class Solution {
  func isPalindrome(_ x: Int) -> Bool {
    guard x >= 0 else { return false }

    var curX: Int = x
    var powerTen: Int = findPowerOfTen(x)

    while curX > 0 {
      let firstDigitNum: Int = curX / powerTen
      let lastDigitNum: Int = curX % 10

      if firstDigitNum != lastDigitNum {
        return false
      }

      curX %= powerTen
      curX /= 10
      powerTen /= 100
    }

    return true

    // let digits = extractDigits(x)
    // return checkNumPalindrome(digits)

    // let strX: String = String(x)
    // let arrayS = Array(strX)

    // return checkPalindrome(arrayS)
  }

  private func findPowerOfTen(_ x: Int) -> Int {
    var curX: Int = x
    var powerTen: Int = 1

    while curX >= powerTen * 10 {
      powerTen *= 10
    }

    return powerTen
  }

  private func checkPalindrome(_ arrayS: [Character]) -> Bool {
    var left: Int = 0
    var right: Int = arrayS.count - 1

    while left < right {
      if arrayS[left] != arrayS[right] {
        return false
      }

      left += 1
      right -= 1
    }

    return true
  }

  private func checkNumPalindrome(_ arrayNum: [Int]) -> Bool {
    var left: Int = 0
    var right: Int = arrayNum.count - 1

    while left < right {
      if arrayNum[left] != arrayNum[right] {
        return false
      }

      left += 1
      right -= 1
    }

    return true
  }

  private func extractDigits(_ x: Int) -> [Int] {
    var digits: [Int] = []
    var curX: Int = x

    while curX > 0 {
      let digit = curX % 10
      digits.append(digit)
      curX /= 10
    }

    return digits
  }
}
