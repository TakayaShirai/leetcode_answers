class Solution:
    def orangesRotting(self, grid: List[List[int]]) -> int:
        
        minutes = 0
        numOfFreshOranges = 0
        
        queue = deque()
        
        for i in range(len(grid)):
            for j in range(len(grid[0])):
                if grid[i][j] == 2:
                    queue.append([i, j])
                elif grid[i][j] == 1:
                    numOfFreshOranges += 1
                    
        directions = [ [-1, 0],
                       [0, 1],
                       [1, 0],
                       [0, -1]
                     ]
        
        while queue and numOfFreshOranges > 0:
            idx = len(queue)
                
            for _ in range(idx):
                curPos = queue.popleft()

                for direction in directions:
                    curRow = curPos[0] + direction[0]
                    curCol = curPos[1] + direction[1]

                    if curRow < 0 or curRow >= len(grid) or curCol < 0 or curCol >= len(grid[0]) or grid[curRow][curCol] == 0 or grid[curRow][curCol] == 2:
                        continue
                            
                    queue.append([curRow, curCol])
                    grid[curRow][curCol] = 2
                    numOfFreshOranges -= 1
                    
            minutes += 1
        
        return minutes if numOfFreshOranges == 0 else -1
        
        
            
