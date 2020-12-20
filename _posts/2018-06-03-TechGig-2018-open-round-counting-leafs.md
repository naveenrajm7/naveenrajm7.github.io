---
title: "TechGig CG 2018: Counting Leafs"
excerpt: "Solution to TechGig Code Gladiators problems"
header:
    image: "https://static.techgig.com/Themes/Release/images/cg2018_images/cg2018-logo.png"
    image_description: "Code Gladiators"
categories:
    - programming
tags :
    - TechGig
    - Python
    - Algorithm
---
Solution to open round problem 1 counting leafs

### Problem Statement
You are given a tree with N nodes numbered from 0 to N-1. You are also given a node X which you are supposed to delete . You have tell the number of leaf nodes in the tree after deleting the given node. Now that deleting a node deletes all the nodes in the its subtree.  
In the input you are given an array A, where Is is the parent of ith node. The node with parent -1 is the root of the tree. It is guaranteed that it has exactly one root of the tree.  

#### Input format.  
First line contains an integer N - number of nodes in the tree.  
Second line contains N integers representing the array A.  
Third line contains an integer representing the nodes to delete.   

#### Output format
Print an integer representing the number of leaf node in the tree after deleting the given node.

#### Example
![img](https://lh3.googleusercontent.com/iLVJ8ZBd4HgvsnYYZfOVYrCmPAG6V0m3DoxPLGklXAOJqotB0L8usbTZPH_5axm-HFTwDK9z_FmLhPtHWOqLs_sKlUm12UbbuN6xa6pl_Tg7FPHwt5hS84nzQoQDNyPN1Jt2-OjFbZHiPXg4ubnlGt4H6kZw51gU9qrFL2zJ8ApiGNKKxh6NKRVas6exs81dhI8ORvWT2POrOMafqXwMKpUCwL4SsLUGgIZzl-ozwCdbdby9AFW-ZplBnkQoo60iGFRKfoxokIeAWdniawKtBp4UI7lzanmvQwEsBU5KlWo1mt_qxY1Jku8GzVct9o7GL2akwMlisFfUF7IzvdxQeK7AOXsVEmZClTgEWXjWxT-XETwRFZEayxYNLiMF1hXGNy6p2XMy2TpvZ08yrm1aADo4rPDOtU_O-bVs6pPjllTDUhKVFvkSY2QMQyLBMrNkfIObMCKNaYiEmkA_1o1mewadei_z_UlJgvzg6JESN8EqyfgPl21LG_X1t6hD54yldNuY7OAXwm1YqEv5RMFQI6x24lkIfu_9_SIjRhu2hNwXtgO89ksuA87aOjxCR98mHxAa0-DPw4hiVt3nS5swOBZ-e8dvbO4OTTDCNudLaCIhO08xpFfllaT2jLryTvVD1kLaQde8gtQaHuqYRjWMtUTiCKfMk-sw=w730-h785-no)
##### Input
```
5
-1 0 0 1 1
2
```
##### Output
`2`

#### Explanation
![img](https://lh3.googleusercontent.com/X3RNzicTS5VeZy3vXGiL99DiQ3Cixi5nhpyP8M0BaHi1E1NYi2vsqcKadi6Lm5r9kSGFlw8dVg3sRw0WKANWc26c9Ky29AIRg4XcAgKHa0xa-kfJ3ZAMdkey1F46pg0HlJQhsD8Y8bicGTjUtiTyuH7alYROukSH5ebaylMGNq5gSawzTbGqn22GyCS4JRZx9mCWfZL28GlKdHMFEHFw2IJLX9GUYfNaovlv6D9IKjLkdvt7Ceya8ej_CCAic1Qy3Cd7pKPCQ_aF9ukoyOXWOBf5aobzuNPeNmpsODofXtDPIZJ6LJzhPAETvHjDtY_HAeHh7DdOYsAZaIdHHgOS8zrOuQ3yJ5zDfrWoqaz4hdSkWLgxf_sgMVZyP8yZ_4b_he5yWn2LV4xbSnq8BZ8nWTvYAkTNJY7QXM3e11bRqYaMMk0Z2dKoxpv3Ojk-b77Pe6KwFxoJinFZPY9anIKK1Q2WmZHYOEC1K-PpBKUcNE3Bq_5ZsrDFknc6fQK2b1X_VpLKR8LT599E8G__RHemt4dyoZAWn8U9pc2QusCeZMZNtwo2IKsBtqhKMNjpEjX9nhCsyELlv_TfbZag7zGeSRf4FOEXSRte9wbwykeHGRYV8ngRVsWoV70rPI95fN22NBIZU-2PwJ75BhYcUlubjPK4fvNPaaQx=w723-h573-no)
The corresponding tree is shown in the problem statement above. Initially there are three leafs 2,3 and 4. If we delete the node 2, two leafs are left i,e 3 and 4. Hence the answer is 2.

### Solution
**Approach** : direct approach would be to construct a tree, traverse and find the node to be deleted, remove the link to that node and again to the traversal to find number of leaf nodes . Obviously this would be complex and difficult approach.  
Many good approach can be used for the given solution I have used following approach. Which involves just manipulating the given array and no construction of tree.

According to the question and input format ,We know that all the elements in the array are parent for some node hence the nodes not present in the array and less than N-1 (within the range 0 to N-1 ) are the leaf nodes. Now we know how to find leaf nodes all we have to do is delete the given node. For deletion of node we search if that is parent for any node and delete that node also we continue and delete all the nodes which are children of the deleting node we do the same thing for deleting nodes if they are the parents fit any nodes .


#### Implementation

```python
import collections

n = int(input())
rem_node = n
arr = [int(x) for x in input().split(' ')]  # take array
d = int(input())

# to keep all parents->[list of child]
tree = collections.defaultdict(list)
# building parent tree , O(n)
for i, r in enumerate(arr):
    tree[r].append(i)

# removing the given node
list = tree.pop(d, [])
rem_node -= 1  # remaining nodes
# traverse and remove all subsequent child of removed node
while list:
    ilist = list[:]
    list = []
    for node in ilist:
        list += tree.pop(node, [])
        rem_node -= 1

parent_nodes = len(tree)-1  # parent except root
print(rem_node - parent_nodes)  # leaf = rem - parent nodes
```
