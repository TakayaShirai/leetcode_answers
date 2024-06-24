class Solution:

## Topological sort approach
## T: O(p + n^2) ( p == len of prerequisites)
## S: O(n^2)
    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        adjList = [ [] for _ in range(numCourses)]
        inDegrees = [ 0 for _ in range(numCourses)]
        
        for pre in prerequisites:
            adjList[pre[1]].append(pre[0])
            inDegrees[pre[0]] += 1
        
        queue = deque()
        
        for i in range(numCourses):
            if inDegrees[i] == 0:
                queue.append(i)
                
        count = 0
        
        while queue:
            cur = queue.popleft()
            count += 1
            
            for adj in adjList[cur]:
                inDegrees[adj] -= 1
                
                if inDegrees[adj] == 0:
                    queue.append(adj)
        
        return count == numCourses
    

## Brute force approach
## T: O(p + n^3) ( p == len of prerequisites)
## S: O(n^2)
        
#     def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
#         adjList = self.createAdjList(numCourses, prerequisites)
        
#         for i in range(numCourses):
#             queue = deque()
#             seen = {}
            
#             for adj in adjList[i]:
#                 queue.append(adj)
            
#             while queue:
#                 cur = queue.popleft()
#                 if cur == i: 
#                     return False
                
#                 seen[cur] = 1
                
#                 for adj in adjList[cur]:
#                     if adj not in seen:
#                         queue.append(adj)
        
#         return True
                
#     def createAdjList(self, n: int, prerequisites: List[List[int]]) -> List[List[int]]:
#         adjList = [ [] for _ in range(n) ]
        
#         for pre in prerequisites:
#             adjList[pre[1]].append(pre[0])
        
#         return adjList
    
        
