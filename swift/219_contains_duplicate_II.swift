class Solution {
  func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    var hashMap: [Int: Int] = [:]

    for (index, num) in nums.enumerated() {
      if let lastIndex = hashMap[num], index - lastIndex <= k {
        return true
      }

      hashMap[num] = index
    }

    return false
  }
}
