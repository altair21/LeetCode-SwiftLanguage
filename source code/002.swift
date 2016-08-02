/**
 * 题意：输入两个链表，每一个链表组成了一个反序的数字，求和并用相同的链表方式表示
 * 思路：直接搞。。
 */
 
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func addTwoNumbers(l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var str1 = String(l1!.val), str2 = String(l2!.val)
        var ll1 = l1?.next
        while (ll1 != nil) {
            str1.appendContentsOf(String(ll1!.val))
            ll1 = ll1?.next
        }
        var ll2 = l2?.next
        while (ll2 != nil) {
            str2.appendContentsOf(String(ll2!.val))
            ll2 = ll2?.next
        }
        var cnt = (Int(String(str1.characters.reverse())) ?? 0) + (Int(String(str2.characters.reverse())) ?? 0)
        var res = ListNode(cnt % 10)
        let retRes = res
        cnt /= 10
        while (cnt > 0) {
            let resSub = ListNode(cnt % 10)
            res.next = resSub
            res = resSub
            cnt /= 10
        }
        
        return retRes
    }
}