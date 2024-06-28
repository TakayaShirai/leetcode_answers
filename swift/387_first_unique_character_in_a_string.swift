class Solution {
    /// firstUniqChar returns the index of first non-repeting character in a given string
    func firstUniqChar(_ s: String) -> Int {        
        var hashT: [Character : Int] = [:]
        
        for (index, char) in s.enumerated() {
            if let _ = hashT[char] {
                hashT[char] = -1
            } else {
                hashT[char] = index
            }
        }
        
        for value in hashT.values.sorted() {
            if value != -1 {
                return value
            }
        }
        
        return -1
    }
}

