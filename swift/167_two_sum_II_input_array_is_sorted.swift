class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left: Int = 0
        var right: Int = numbers.count - 1
        
        while left < right {
            if numbers[left] + numbers[right] < target {
                left += 1
            } else if numbers[left] + numbers[right] > target {
                right -= 1
            } else {
                return [left+1, right+1]
            }
        }
        
        return [-1, -1]
    }
}

