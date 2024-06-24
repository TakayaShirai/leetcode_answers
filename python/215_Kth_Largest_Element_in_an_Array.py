class Solution:
    def findKthLargest(self, nums: List[int], k: int) -> int:
        minHeap = []
        
        for num in nums:
            heappush(minHeap, num)
            if len(minHeap) > k:
                heappop(minHeap)
        
        return minHeap[0]
                
        
## Hoare's Quickselect Algorithm
#     def findKthLargest(self, nums: List[int], k: int) -> int:
#         indexToFind = len(nums) - k
#         return self.quickSelect(nums, 0, len(nums) - 1, indexToFind)
    
#     def quickSelect(self, nums, left, right, idx) -> int:
#         partitionIndex = self.getPartition(nums, left, right)
        
#         if partitionIndex == idx:
#             return nums[idx]
#         elif partitionIndex > idx:
#             return self.quickSelect(nums, left, partitionIndex - 1, idx)
#         else:
#             return self.quickSelect(nums, partitionIndex + 1, right, idx)
            
#     def getPartition(self, nums, start, pivot) -> int:
#         pivotElement = nums[pivot]
#         partitionIndex = start
        
#         for j in range(start, pivot):
#             if nums[j] <= pivotElement:
#                 nums[partitionIndex], nums[j] = nums[j], nums[partitionIndex]
#                 partitionIndex += 1
        
#         nums[partitionIndex], nums[pivot] = nums[pivot], nums[partitionIndex]
        
#         return partitionIndex
        
        
## Quick Sort Algorithm     
#     def findKthLargest(self, nums: List[int], k: int) -> int:
#         self.quickSort(nums, 0, len(nums) - 1)
        
#         return nums[len(nums) - k]
    
#     def quickSort(self, nums, left, right) -> List[int]:
#         if left < right:
#             partitionIndex = self.getPartition(nums, left, right)
            
#             self.quickSort(nums, left, partitionIndex - 1)
#             self.quickSort(nums, partitionIndex + 1, right)
    
#     def getPartition(self, nums, start, pivot) -> int:
#         pivotElement = nums[pivot]
#         partitionIndex = start
        
#         for j in range(start, pivot):
#             if nums[j] <= pivotElement:
#                 nums[partitionIndex], nums[j] = nums[j], nums[partitionIndex]
#                 partitionIndex += 1
        
#         nums[partitionIndex], nums[pivot] = nums[pivot], nums[partitionIndex]
        
#         return partitionIndex
    
        
        
        
