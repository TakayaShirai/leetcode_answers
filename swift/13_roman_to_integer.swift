class Solution {
  func romanToInt(_ s: String) -> Int {
    let arrayS = Array(s)
    var romanIntMap: [Character: Int] = [
      "I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000,
    ]
    var curSum: Int = 0

    for curIdx in 0..<(arrayS.count - 1) {
      guard let curNum = romanIntMap[arrayS[curIdx]] else { break }
      guard let nextNum = romanIntMap[arrayS[curIdx + 1]] else { break }

      if curNum < nextNum {
        curSum -= curNum
      } else {
        curSum += curNum
      }
    }

    guard let lastNum = romanIntMap[arrayS[arrayS.count - 1]] else { return curSum }
    curSum += lastNum

    return curSum

    // while curIdx < arrayS.count {
    //   let curChar = arrayS[curIdx]
    //   guard let curNum = romanIntMap[curChar] else { break }

    //   if curChar == "I" {
    //     if curIdx + 1 < arrayS.count && (arrayS[curIdx + 1] == "V" || arrayS[curIdx + 1] == "X") {
    //       guard let nextNum = romanIntMap[arrayS[curIdx + 1]] else { break }
    //       curSum += nextNum - curNum
    //       curIdx += 2
    //     } else {
    //       curSum += curNum
    //       curIdx += 1
    //     }
    //   } else if curChar == "X" {
    //     if curIdx + 1 < arrayS.count && (arrayS[curIdx + 1] == "L" || arrayS[curIdx + 1] == "C") {
    //       guard let nextNum = romanIntMap[arrayS[curIdx + 1]] else { break }
    //       curSum += nextNum - curNum
    //       curIdx += 2
    //     } else {
    //       curSum += curNum
    //       curIdx += 1
    //     }
    //   } else if curChar == "C" {
    //     if curIdx + 1 < arrayS.count && (arrayS[curIdx + 1] == "D" || arrayS[curIdx + 1] == "M") {
    //       guard let nextNum = romanIntMap[arrayS[curIdx + 1]] else { break }
    //       curSum += nextNum - curNum
    //       curIdx += 2
    //     } else {
    //       curSum += curNum
    //       curIdx += 1
    //     }
    //   } else {
    //     curSum += curNum
    //     curIdx += 1
    //   }
    // }

    // return curSum
  }
}
