class Solution {
  func decrypt(_ code: [Int], _ k: Int) -> [Int] {
    if k == 0 {
      return Array(repeating: 0, count: code.count)
    } else if k > 0 {
      return posDecrypt(code, k)
    } else {
      return negDecrypt(code, k)
    }
  }

  private func posDecrypt(_ code: [Int], _ k: Int) -> [Int] {
    let codeLen: Int = code.count
    var decryptedCode: [Int] = Array(repeating: 0, count: codeLen)

    var curSum: Int = code[1..<(k + 1)].reduce(0, +)
    decryptedCode[0] = curSum

    for left in 1..<codeLen {
      curSum = calcSum(left, curSum, k, code)
      decryptedCode[left] = curSum
    }

    return decryptedCode
  }

  private func negDecrypt(_ code: [Int], _ k: Int) -> [Int] {
    let codeLen: Int = code.count
    var decryptedCode: [Int] = Array(repeating: 0, count: codeLen)

    var curSum: Int = code[codeLen + k..<codeLen].reduce(0, +)
    decryptedCode[0] = curSum

    for left in 1..<codeLen {
      curSum = calcSum(left, curSum, k, code)
      decryptedCode[left] = curSum
    }

    return decryptedCode
  }

  private func calcSum(_ left: Int, _ prevSum: Int, _ k: Int, _ code: [Int]) -> Int {
    let codeLen: Int = code.count
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
