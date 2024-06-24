class Solution:
    def minRemoveToMakeValid(self, s: str) -> str:
        stack = deque()
        arrayS = list(s)
        
        for i in range(len(arrayS)):
            if arrayS[i] == ")":
                if stack:
                    stack.pop()
                else:
                    arrayS[i] = ""
            else:
                if arrayS[i] == "(":
                    stack.append(i)
        
        while stack:
            deleteIndex = stack.pop()
            arrayS[deleteIndex] = ""
        
        return "".join(arrayS)
                    
