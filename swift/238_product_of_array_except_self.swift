class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var tmp: Int = 1
        var res: [Int] = []
        
        for num in nums {
            res.append(tmp)
            tmp *= num
        }
        
        tmp = 1
        
        for i in (0..<nums.count).reversed() {
            res[i] *= tmp
            tmp *= nums[i]
        }
        
        return res
        
//         var res: [Int] = []
//         var hashT: [Int : Int] = [:]
//         var totalProduct: Int = 1
        
//         for i in 0..<nums.count {
//             if nums[i] == 0 {
//                 hashT[i] = 1
//             } else {
//                 totalProduct *= nums[i]
//             }
//         }
        
//         if hashT.count >= 2 {
//             for i in 0..<nums.count {
//                 res.append(0)
//             }
//             return res
//         } else if hashT.count == 0 {
//             for i in 0..<nums.count {
//                 res.append(totalProduct / nums[i])
//             }
//         } else {
//             for i in 0..<nums.count {
//                 if let _ = hashT[i] {
//                     res.append(totalProduct)
//                 } else {
//                     res.append(0)
//                 }
//             }
//         }
//         return res
    }
}

