class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        
        var hashMap: [Character : Int] = [:]
        
        for char in s {
            if let _ = hashMap[char] {
                hashMap[char]! += 1
            } else {
                hashMap[char] = 1
            }
        }
        
        for char in t {
            if let _ = hashMap[char] {
                hashMap[char]! -= 1
                if hashMap[char]! < 0 {
                    return false
                }
            } else {
                return false
            }
        }
        
        return true
        
    }
}

