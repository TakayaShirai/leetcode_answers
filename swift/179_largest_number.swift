class Solution {
  func largestNumber(_ nums: [Int]) -> String {
    let strs: [String] = nums.map { String($0) }
    let sortedStrs: [String] = strs.sorted { $0 + $1 > $1 + $0 }
    let joinedStrs: String = sortedStrs.joined()
    return joinedStrs.first == "0" ? "0" : joinedStrs
  }
}
