class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if (x < 0) {
            return false
        }
        
        var x: Int = x
        var div: Int = 1
        
        while x >= div * 10 {
            div *= 10
        }
        
        while x != 0 {
            let leftNum = x / div
            let rightNum = x % 10
            
            if leftNum != rightNum {
                return false
            }
            
            x = (x % 10) / 10
            div /= 100
        }
        
        return true
    }
}

