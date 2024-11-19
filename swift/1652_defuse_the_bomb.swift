class Solution {
  func decrypt(_ code: [Int], _ k: Int) -> [Int] {
    let codeLen: Int = code.count
    var decryptedCode: [Int] = Array(repeating: 0, count: codeLen)

    if k == 0 {
      return decryptedCode
    }

    var curSum: Int = 0

    if k > 0 {
      curSum = code[1..<(k + 1)].reduce(0, +)
    } else {
      curSum = code[codeLen + k..<codeLen].reduce(0, +)
    }

    decryptedCode[0] = curSum

    for left in 1..<codeLen {
      curSum = calcSum(left, curSum, k)
      decryptedCode[left] = curSum
    }

    return decryptedCode

    func calcSum(_ left: Int, _ prevSum: Int, _ k: Int) -> Int {
      var curSum: Int = prevSum
      var prevLeft: Int = 0
      var curRight: Int = 0

      if k > 0 {
        prevLeft = left
        curRight = (left + k) % codeLen
      } else {
        prevLeft = left + k - 1 >= 0 ? left + k - 1 : (left + k - 1 + codeLen) % codeLen
        curRight = left - 1 >= 0 ? left - 1 : (left - 1 + codeLen) % codeLen
      }

      curSum -= code[prevLeft]
      curSum += code[curRight]

      return curSum
    }
  }
}
