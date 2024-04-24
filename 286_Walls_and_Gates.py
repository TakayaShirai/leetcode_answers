## Given a 2D array containing -1's (walls), 0's (gates) and INF's (empty room).
## Fill each empty room with the number of steps to the nearest gate.
## If it is impossible to reach a gate, leave INF as the value.
## INF is equal to 2147483647.


from collections import deque
import math
from typing import List

class Solution:
  def dfsWallsAndGates(self, grid: List[List[int]]) -> List[List[int]]:
    for i in range(len(grid)):
      for j in range(len(grid[0])):
        if grid[i][j] == 0:
          self.dfs(grid, i, j, 0)
    
    return grid

  def dfs(self, grid: List[List[int]], curRow: int, curCol: int, count: int):
    if curRow < 0 or curRow >= len(grid) or curCol < 0 or curCol >= len(grid[0]) or count > grid[curRow][curCol]:
      return 

    grid[curRow][curCol] = count
      
    directions = [[-1, 0],
      [0, 1],
      [1, 0],
      [0, -1]]

    for direction in directions:
      self.dfs(grid, curRow + direction[0], curCol + direction[1], count + 1)
    
  
  def bfsWallsAndGates(self, grid: List[List[int]]) -> List[List[int]]:
    queue = deque()

    for i in range(len(grid)):
      for j in range(len(grid[0])):
        if grid[i][j] == 0:
          queue.append([i, j])


    self.bfs(grid, queue)

    return grid


  def bfs(self, grid: List[List[int]], queue: List[int]):
    directions = [[-1, 0],
                  [0, 1],
                  [1, 0],
                  [0, -1]]

    time = 0

    while queue:
      length = len(queue)
      time += 1

      for _ in range(length):
        curPos = queue.popleft()

        for direction in directions:
          curRow = curPos[0] + direction[0]
          curCol = curPos[1] + direction[1]

          if curRow < 0 or curRow >= len(grid) or curCol < 0 or curCol >= len(grid[0]) or grid[curRow][curCol] == -1 or grid[curRow][curCol] < time:
            continue

          grid[curRow][curCol] = time
          queue.append([curRow, curCol])


solution = Solution()

# grid = [[0, math.inf, math.inf, math.inf],
#   [math.inf, math.inf, math.inf, -1],
#   [math.inf, -1, math.inf, -1],
#   [math.inf, 0, -1, -1]]

grid = [[0, math.inf, math.inf, -1],
  [-1, -1, math.inf, -1],
  [-1, math.inf, 0, -1],
  [-1, -1, -1, math.inf]]

# grid = []
# grid = [[]]
# grid = [[math.inf]]

# grid = solution.bfsWallsAndGates(grid)
grid = solution.dfsWallsAndGates(grid)

print(grid)
