---
title: "TechGig CG 2018: Flood in the jungle"
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
Solution to semi final problem 2 flood in the jungle

### Problem Statement

A group of monkeys ave living Sunderbans invests There are **N** trees in Sunderbans (numbered from **0** to **N-1**) on which these monkeys live. Every year floods hit the forest of Sunderbans The monkeys have a tradition of meeting on a tree after the flood.

Last night Sunderbans has been hit hard by a sudden flood and The flood was very strong and it has submerged everything except the mighty trees on which the monkeys live

All the monkeys now have to meet on some tree. Due to the flood the trees have became weak so jumping from them is dangerous .**Whenever a monkey jumps from a tree A to a tree B, the tree A gets submerged a little while the tree B remains unaffected**. The monkeys don't know how in swim. So they move from one tree to another tree by jumping. Every tree has been assigned a 2D - co ordinate value A monkey can only jump between two tress if
the euclidean distance between them is less than or equal to c, c is called the jumping capacity of the monkeys

The trees have threshold values The threshold value of the  ith tree is given by **ti**. It means that no more than ti monkeys can jump off from the ith tree
You ave given the coordinates of the trees. their threshold values. the number of monkeys on the trees, and the jumping capacity of monkeys You have
to tell the number of the  trees on which the all monkeys can meet after the flood. the meeting can happen on a tree if all the  monkeys can come to this tree



#### Input format.  
The first line of the input contains 2 integers **N** and **C**, denoting the number of tree  and the jumping capacity of the monkeys.
Following N lines contains **xi yi mi ti** - the x-coordinate  of the ith tree, the y-coordinate of the ith tree, the number of monkeys on the ith tree and the maximum number of monkeys that can jump off the ith tree. the last line of the input is kept blank.

#### Output format

One line with space separated integers denoting the numbers of the trees on which the meeting can be held. these numbers should be in ascending order and should be from 0 to N-1 . if there is no tree on which the meeting can happen then print  -1.

#### Example
##### Input
```
3 100.0
1 10 5 5
5 10 5 1
8 10 5 4
```
##### Output
`-1 `

#### Explanation
Since there are two trees where number of monkeys are greater than threshold value of that tree the meeting can never happen.

### Solution
**Approach** :
Not a working solution :cry: . but this is what i did to get 84% test case work , by correctly identify the cases where meeting won't happen and the other test case where the meeting can happen in all trees. Any help is greatly appreciated either in comments or directly ping [me](/contact/)
#### Implementation
```python
import sys
import math

n, c = input().split(' ')
n = int(n)
c = float(c)

jun = []
cant = []
can = []

for i in range(n):
    jun.append([int(x) for x in input().split(' ')])

#print(jun)
for i in range(n):
    if jun[i][2] > jun[i][3]:
        cant.append(i)

#print(*cant)

if len(cant) >= 2:
    print(-1)
    sys.exit

else:
    for i in range(n):
        cnt = 0
        for j in range(n):
            if i != j:
                if math.sqrt( ((jun[i][0]-jun[j][0])**2)+((jun[i][1]-jun[j][1])**2) ) <= c:
                    cnt += 1
                else:
                    break

        if cnt == n-1:
            can.append(i)

    if len(can) == 0:
        print(-1)
    else:
        print(*can)
```
