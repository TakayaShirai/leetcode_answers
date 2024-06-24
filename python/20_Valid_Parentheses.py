class Solution:
    def isValid(self, s: str) -> bool:
        hashMap = {')': '(', '}': '{', ']': '['}
        stack = deque()
        
        for char in s:
            if char in hashMap:
                if stack:
                    if stack.pop() != hashMap[char]:
                        return False
                else:
                    return False
            else:
                stack.append(char)
        
        return not stack
        
        
        # stack = deque()
        
        # for i in range(len(s)):
        #     if s[i] == "(" or s[i] == "{" or s[i] == "[":
        #         stack.appendleft(s[i])
        #     elif s[i] == ")" and len(stack) > 0 and stack[0] == "(":
        #         stack.popleft()
        #     elif s[i] == "}" and len(stack) > 0 and stack[0] == "{":
        #         stack.popleft()
        #     elif s[i] == "]" and len(stack) > 0 and stack[0] == "[":
        #         stack.popleft()
        #     else:
        #         return False
        
        # return len(stack) == 0
