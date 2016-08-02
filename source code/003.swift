/**
 * 题意：给出一个字符串，找出其中最长的不重复子串（搞清楚子串和子字段的区别）
 * 思路：定义一个128个大小的数组，因为ascii字符有128个，每一个元素存对应序号的ascii字符上次出现的位置，遍历字符串找出最长的两个相同字符相距的长度就是答案。
 */

class Solution {
    func lengthOfLongestSubstring(s: String) -> Int {
        var lastPos = [Int](count: 128, repeatedValue: -1)
        var startPos = 0, res = 0, cnt = 0, index = 0
        for ascii in s.utf8 {
            if (lastPos[Int(ascii)] < startPos) {
                lastPos[Int(ascii)] = index
                cnt += 1
            } else {
                cnt = index - lastPos[Int(ascii)]
                startPos = lastPos[Int(ascii)]
                lastPos[Int(ascii)] = index
            }
            if cnt > res {
                res = cnt
            }
            index += 1
        }
        return res
    }
}