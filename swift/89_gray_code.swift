class Solution {
  func grayCode(_ n: Int) -> [Int] {
    let maxNum: Int = 1 << n
    var grayCodeSeq: [Int] = []

    for num in 0..<maxNum {
      let grayCode: Int = converToGrayCode(num)
      grayCodeSeq.append(grayCode)
    }

    return grayCodeSeq
  }

  private func converToGrayCode(_ num: Int) -> Int {
    return num ^ (num / 2)
  }
}
