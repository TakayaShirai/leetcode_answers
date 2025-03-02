class Solution {
  func subsets(_ nums: [Int]) -> [[Int]] {
    var curSubset: [Int] = []
    var subsets: [[Int]] = []
    backtrack(nums: nums, curIdx: 0, curSubset: &curSubset, subsets: &subsets)
    return subsets
  }

  private func backtrack(nums: [Int], curIdx: Int, curSubset: inout [Int], subsets: inout [[Int]]) {
    guard curIdx != nums.count else {
      subsets.append(curSubset)
      return
    }

    curSubset.append(nums[curIdx])
    backtrack(nums: nums, curIdx: curIdx + 1, curSubset: &curSubset, subsets: &subsets)

    curSubset.removeLast()
    backtrack(nums: nums, curIdx: curIdx + 1, curSubset: &curSubset, subsets: &subsets)
  }
}
