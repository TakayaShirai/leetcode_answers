class Solution {
  func addBinary(_ a: String, _ b: String) -> String {
    let reversedA: [Character] = Array(a.reversed())
    let reversedB: [Character] = Array(b.reversed())
    var curIdx: Int = 0
    var carry: Int = 0
    var addRes: String = ""

    while curIdx < a.count || curIdx < b.count || carry == 1 {
      let bitA: Int = curIdx < a.count ? Int(String(reversedA[curIdx]))! : 0
      let bitB: Int = curIdx < b.count ? Int(String(reversedB[curIdx]))! : 0
      let sum: Int = bitA + bitB + carry

      let curDigit: Int = sum % 2
      carry = sum / 2
      addRes += String(curDigit)

      curIdx += 1
    }

    return String(addRes.reversed())
  }
}
