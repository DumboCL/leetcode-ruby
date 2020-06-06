# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

# TC: O(l1) + O(l2) + O(l3)
def add_two_numbers_1(l1, l2)
  l1_arr = []
  l2_arr = []
  loop do
    break unless l1

    l1_arr.unshift(l1.val)
    l1 = l1.next
  end
  loop do
    break unless l2

    l2_arr.unshift(l2.val)
    l2 = l2.next
  end

  l3 = (l1_arr.join.to_i + l2_arr.join.to_i).to_s.reverse.chars.map(&:to_i)
end

# TC: O(max(l1, l2))
def add_two_numbers_2(l1, l2)
  l3 = []
  carry = 0
  while l1 || l2
    x = l1 ? l1.val : 0
    y = l2 ? l2.val : 0
    sum = x + y + carry
    tens, ones = sum.divmod(10)
    carry = tens
    l3 << ones
    l1 = l1.next || nil if l1
    l2 = l2.next || nil if l2
  end
  l3 << carry if carry == 1
  l3
end