class Solution {

  struct State: Hashable {
    let depth: Int
    let target: Int
  }

  func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    var dp: [State: Int] = [:]

    func dfs(_ depth: Int, _ currentTarget: Int) -> Int {
      if depth == nums.count {
        return currentTarget == 0 ? 1 : 0
      }

      let state = State(depth: depth, target: currentTarget)

      if let cachedValue = dp[state] {
        return cachedValue
      }

      let add = dfs(depth + 1, currentTarget - nums[depth])
      let subtract = dfs(depth + 1, currentTarget + nums[depth])

      dp[state] = add + subtract
      return dp[state]!
    }

    return dfs(0, target)
  }
}

// Brute Force
// class Solution {
//     func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
//         var res: Int = 0

//         func dfs(_ depth: Int, _ target: Int) {
//             if depth == nums.count {
//                 if target == 0 {
//                     res += 1
//                 }

//                 return
//             }

//             dfs(depth+1, target + nums[depth])
//             dfs(depth+1, target - nums[depth])

//             return
//         }

//         dfs(0, target)

//         return res
//     }
// }
