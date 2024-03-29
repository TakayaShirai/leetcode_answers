class Solution:
    def backspaceCompare(self, s: str, t: str) -> bool:
        pointerS = len(s) - 1
        pointerT = len(t) - 1
        
        while pointerS >= 0 or pointerT >= 0:
            if s[pointerS] == "#" or t[pointerT] == "#":
                if s[pointerS] == "#":
                    backCount = 2
                    while backCount > 0:
                        backCount -= 1
                        pointerS -= 1
                        if pointerS < 0:
                            break
                        if s[pointerS] == "#":
                            backCount += 2
                if t[pointerT] == "#":
                    backCount = 2
                    while backCount > 0:
                        backCount -= 1
                        pointerT -= 1
                        if pointerT < 0:
                            break
                        if t[pointerT] == "#":
                            backCount += 2
            
            else:
                if pointerS < 0 or pointerT < 0:
                    if pointerS < 0 and pointerT < 0:
                        return True
                    else:
                        return False
            
                else:
                    if s[pointerS] != t[pointerT]:
                        return False
                    pointerS -= 1
                    pointerT -= 1
        
        return True
                
#         stackS = deque()
#         stackT = deque()
        
#         for char in s:
#             if char == "#":
#                 if stackS:
#                     stackS.pop()
#             else:
#                 stackS.append(char)
        
#         for char in t:
#             if char == "#":
#                 if stackT:
#                     stackT.pop()
#             else:
#                 stackT.append(char)

#         return stackS == stackT
        
