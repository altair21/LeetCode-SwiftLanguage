/**
 * 题意：给出两个有序数组，找出两个数组中所有元素的中间值
 * 思路：有序数组，直接遍历就好了。
 */

class Solution {
    func findMedianSortedArrays(nums1: [Int], _ nums2: [Int]) -> Double {
        let n = nums1.count, m = nums2.count
        var resArr = [Int]()
        var index1 = 0, index2 = 0
        while (index1 < n && index2 < m) {
            if nums1[index1] < nums2[index2] {
                resArr.append(nums1[index1])
                index1 += 1
            } else {
                resArr.append(nums2[index2])
                index2 += 1
            }
        }
        while index1 < n {
            resArr.append(nums1[index1])
            index1 += 1
        }
        while index2 < m {
            resArr.append(nums2[index2])
            index2 += 1
        }
        let i = (n + m) / 2 - 1
        if (n + m) % 2 == 0 {
            let ans = (Double(resArr[i]) + Double(resArr[i+1])) / 2.0
            return ans
        } else {
            return Double(resArr[i+1])
        }
    }
}