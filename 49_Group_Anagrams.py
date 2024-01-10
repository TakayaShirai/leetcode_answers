class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        mp = {}
        
        for word in strs:
            sorted_word = ''.join(sorted(word))
            if sorted_word not in mp:
                mp[sorted_word] = []
            mp[sorted_word].append(word)
        
        return list(mp.values())
