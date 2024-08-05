class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left: Int = 0
        var right: Int = nums.count - 1
        var mid: Int = 0
        
        while left <= right {
            mid = (left + right) / 2
            
            if nums[mid] == target {
                return mid
            } else if nums[left] <= nums[mid] {
                if nums[mid] < target {
                    left = mid + 1
                } else if nums[left] > target {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            } else {
                if nums[mid] > target {
                    right = mid - 1
                } else if nums[right] < target {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        
        return -1
    }
}

