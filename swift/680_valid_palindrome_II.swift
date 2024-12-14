class Solution {
  func validPalindrome(_ s: String) -> Bool {
    let arrayS: [Character] = Array(s)

    var left: Int = 0
    var right: Int = arrayS.count - 1

    while left < right {
      if arrayS[left] != arrayS[right] {
        return isPalindrome(Array(arrayS[left + 1...right]))
          || isPalindrome(Array(arrayS[left..<right]))
        //                 let leftSkippedArray = Array(arrayS[left+1...right])
        //                 let rightSkippedArray = Array(arrayS[left..<right])

        //                 return (leftSkippedArray == leftSkippedArray.reversed()) || (rightSkippedArray == rightSkippedArray.reversed())
      }

      left += 1
      right -= 1
    }

    return true
  }

  private func isPalindrome(_ arrayS: [Character]) -> Bool {
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
}
