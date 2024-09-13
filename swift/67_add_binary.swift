class Solution {
  func addBinary(_ a: String, _ b: String) -> String {
    let arrayOfA = Array(a)
    let arrayOfB = Array(b)

    var curAIndex: Int = a.count - 1
    var curBIndex: Int = b.count - 1
    var carrier: Int = 0

    var ABSum: [Character] = []

    while curAIndex >= 0 || curBIndex >= 0 || carrier == 1 {
      let aDigit = curAIndex >= 0 ? arrayOfA[curAIndex] : "0"
      let bDigit = curBIndex >= 0 ? arrayOfB[curBIndex] : "0"

      let sum = Int(String(aDigit))! + Int(String(bDigit))! + carrier

      if sum >= 2 {
        ABSum.append(Character(String(sum % 2)))
        carrier = 1
      } else {
        ABSum.append(Character(String(sum)))
        carrier = 0
      }

      curAIndex -= 1
      curBIndex -= 1
    }

    return String(ABSum.reversed())
  }
}
