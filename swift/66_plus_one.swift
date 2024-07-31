class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var carryUp: Int = 1
        var res: [Int] = []
        
        for i in (0..<digits.count).reversed() {
            let curNum = (digits[i] + carryUp) % 10
            carryUp = (digits[i] + carryUp) / 10
            
            res.append(curNum)
        }
        
        if carryUp == 1 {
            res.append(1)
        }
        
        return res.reversed()
    }
}

