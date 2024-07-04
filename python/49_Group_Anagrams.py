class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        anagrams = {}
        
        for str in strs:
            counts = [0] * 26
            
            for char in str:
                counts[ord(char) - ord("a")] += 1
            
            if tuple(counts) in anagrams:
                anagrams[tuple(counts)].append(str)
            else:
                anagrams[tuple(counts)] = [str]
        
        return anagrams.values()
        
        # mp = {}
        
        # for word in strs:
        #     sorted_word = ''.join(sorted(word))
        #     if sorted_word not in mp:
        #         mp[sorted_word] = []
        #     mp[sorted_word].append(word)
        
        # return list(mp.values())
        
