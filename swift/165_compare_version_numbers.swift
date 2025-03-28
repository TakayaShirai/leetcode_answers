class Solution {
  func compareVersion(_ version1: String, _ version2: String) -> Int {
    let v1 = version1.split(separator: ".").compactMap { Int($0) }
    let v2 = version2.split(separator: ".").compactMap { Int($0) }

    let maxCount = max(v1.count, v2.count)
    for curIdx in 0..<maxCount {
      let num1 = curIdx < v1.count ? v1[curIdx] : 0
      let num2 = curIdx < v2.count ? v2[curIdx] : 0
      if num1 != num2 {
        return num1 > num2 ? 1 : -1
      }
    }

    return 0
  }
}
