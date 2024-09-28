class Solution {
  func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    guard !arr1.isEmpty else { return [] }

    let maxElement: Int = arr1.max()!
    var countMap = Array(repeating: 0, count: maxElement + 1)
    var res: [Int] = []

    for num in arr1 {
      countMap[num] += 1
    }

    for num in arr2 {
      while countMap[num] > 0 {
        res.append(num)
        countMap[num] -= 1
      }
    }

    for num in 0..<(maxElement + 1) {
      while countMap[num] > 0 {
        res.append(num)
        countMap[num] -= 1
      }
    }

    return res
  }
}
