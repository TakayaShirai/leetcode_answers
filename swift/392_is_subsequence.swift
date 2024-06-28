class Solution {
    /// isSubsequence returns true if s is a suvsequence of t, or false otherwise
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var currentIndex: String.Index = t.startIndex
        
        for char in s {
            while currentIndex < t.endIndex && char != t[currentIndex] {
                currentIndex = t.index(after: currentIndex)
            }
            
            if currentIndex == t.endIndex {
                return false
            }
            
            currentIndex = t.index(after: currentIndex)
        }
        
        return true
    }
}

