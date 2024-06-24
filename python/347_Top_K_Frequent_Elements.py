class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        mp = {}
        
        for num in nums:
            mp[num] = mp.get(num, 0) + 1
        
        minHeap = []
        
        for key, val in mp.items():
            if len(minHeap) < k:
                heapq.heappush(minHeap, (val, key))
            elif val > minHeap[0][0]:
                heapq.heappop(minHeap)
                heapq.heappush(minHeap, (val, key))
        
        ans = []
        
        while minHeap:
            ans.append(heapq.heappop(minHeap)[1])
        
        return ans
        
#         mp = {}
#         ans = []
        
#         for num in nums:
#             if num not in mp:
#                 mp[num] = 1
#             else:
#                 mp[num] += 1
        
#         cand = sorted(mp.items(), key = lambda item: item[1], reverse = True)
        
#         for i in range(k):
#             ans.append(cand[i][0])
            
#         return ans
            
