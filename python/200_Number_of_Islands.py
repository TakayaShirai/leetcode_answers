class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        count = 0
        
        for i in range(len(grid)):
            for j in range(len(grid[0])):
                if grid[i][j] == "1":
                    self.BFS(grid, [i, j])
                    count += 1
                    
        return count
    
    
    def BFS(self, grid: List[List[str]], startPos: List[int]):
        directions = [ [-1,  0],
                       [0,  1],
                       [1, 0],
                       [0, -1] ]
        
        grid[startPos[0]][startPos[1]] = "0"
        
        queue = deque()
        queue.append(startPos)
        
        while queue:
            curPos = queue.popleft()
            
            for direction in directions:
                curRow = curPos[0] + direction[0]
                curCol = curPos[1] + direction[1]
                
                if curRow < 0 or curRow >= len(grid) or curCol < 0 or curCol >= len(grid[0]) or grid[curRow][curCol] == "0":
                    continue  
                
                queue.append([curRow, curCol])
                grid[curRow][curCol] = "0"
