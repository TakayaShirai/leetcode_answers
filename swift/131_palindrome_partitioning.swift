class Solution {
  func partition(_ s: String) -> [[String]] {
    let arrayS = Array(s)
    var res: [[String]] = []
    var curPartition: [String] = []

    func dfs(_ sIndex: Int) {
      if sIndex == arrayS.count {
        res.append(curPartition)
        return
      }

      for rightIndex in sIndex..<arrayS.count {
        if isPalindrome(String(arrayS), sIndex, rightIndex) {
          curPartition.append(String(arrayS[sIndex...rightIndex]))
          dfs(rightIndex + 1)
          curPartition.removeLast()
        }
      }
    }

    dfs(0)
    return res
  }

  func isPalindrome(_ s: String, _ leftIndex: Int, _ rightIndex: Int) -> Bool {
    let arrayS = Array(s)
    var leftIndex = leftIndex
    var rightIndex = rightIndex

    while leftIndex < rightIndex {
      if arrayS[leftIndex] != arrayS[rightIndex] {
        return false
      }

      leftIndex += 1
      rightIndex -= 1
    }

    return true
  }
}
