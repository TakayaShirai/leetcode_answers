class Solution {
  func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    let sortedNums = nums.sorted()

    func backtrack(_ index: Int, _ subset: [Int]) {
      if index == sortedNums.count {
        res.append(subset)
        return
      }

      var subset = subset
      var index = index

      subset.append(sortedNums[index])
      backtrack(index + 1, subset)
      subset.removeLast()

      while index + 1 < sortedNums.count && sortedNums[index] == sortedNums[index + 1] {
        index += 1
      }
      backtrack(index + 1, subset)
    }

    backtrack(0, [])
    return res

    //         var hashSet: [[Int : Int] : Int] = [:]
    //         var subset: [Int] = []
    //         var res: [[Int]] = []

    //         func dfs(_ depth: Int, _ hash: [Int : Int]) {
    //             if depth == nums.count {
    //                 if let seen = hashSet[hash] {
    //                     return
    //                 } else {
    //                     res.append(subset)
    //                     hashSet[hash] = 1
    //                     return
    //                 }
    //             }

    //             var hash = hash
    //             hash[nums[depth], default: 0] += 1

    //             subset.append(nums[depth])
    //             dfs(depth + 1, hash)

    //             hash[nums[depth], default: 0] -= 1
    //             subset.removeLast()
    //             dfs(depth + 1, hash)
    //         }

    //         dfs(0, [:])
    //         return res
  }
}
