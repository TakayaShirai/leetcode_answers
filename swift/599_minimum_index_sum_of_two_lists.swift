class Solution {
  func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
    let list1StrIdxMap: [String: Int] = createStringIdxMap(strList: list1)

    var minIdxSum: Int = list1.count + list2.count
    var leastIdxSumStrs: [String] = []

    for (list2Idx, list2Str) in list2.enumerated() {
      if let list1Idx = list1StrIdxMap[list2Str] {
        let curIdxSum: Int = list1Idx + list2Idx

        if curIdxSum == minIdxSum {
          leastIdxSumStrs.append(list2Str)
        } else if curIdxSum < minIdxSum {
          minIdxSum = curIdxSum
          leastIdxSumStrs = []
          leastIdxSumStrs.append(list2Str)
        }
      }
    }

    return leastIdxSumStrs
  }

  private func createStringIdxMap(strList: [String]) -> [String: Int] {
    var strIdxMap: [String: Int] = [:]

    for (idx, str) in strList.enumerated() {
      if strIdxMap[str] == nil {
        strIdxMap[str] = idx
      }
    }

    return strIdxMap
  }
}
