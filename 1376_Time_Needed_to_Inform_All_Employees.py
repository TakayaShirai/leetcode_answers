class Solution:
    def numOfMinutes(self, n: int, headID: int, manager: List[int], informTime: List[int]) -> int:
        adjList = [[] for _ in range(n)]
        
        for i in range(n):
            man = manager[i]
            if man != -1:
                adjList[man].append(i)
    
        return self.dfs(headID, adjList, informTime)
    
    def dfs(self, currentId: int, adjList: List[int], informTime: List[int]) -> int:
        if not adjList[currentId]:
            return 0
        
        MaxTime = 0
        subordinates = adjList[currentId]
        
        for i in range(len(subordinates)):
            MaxTime = max(MaxTime, self.dfs(subordinates[i], adjList, informTime))
        
        return MaxTime + informTime[currentId]
