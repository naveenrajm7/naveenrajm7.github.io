---
title: "TechGig CG 2018: Christmas gift"
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
Solution to open round problem 2 Christmas gift

### Problem Statement
There are **N** houses in the city connected by excatly **N-1** roads. There is excatly 1 shortest path from any house to any other house. The houses are numbered from **1 to N-1**.  
Since Christmas is about to come so Santa has decided to hide gits in thses houses. Santa will come to city for **M** consecutive days. Each day he will come to house **a** first and will go till house **b** hiding a gift in each house that comes in the path.  
Can you tell the maximum number of gifts any houses has after M days.

#### Input format.  
First line of input contains 2 integers N - the number of houses in the city and M - the number of days for which Santa comes to the city. Next N-1 lines contains two integers u and v meaning there is road between house u and v, u!=v.  
Next m lines contains two integers a<sub>i</sub> and b<sub>i</sub> representing the starting and ending house on i<sup>th</sup> visit of Santa.

#### Output format
A single integer representing the maximum number of gifts in any house.

#### Example
##### Input
```
4 1
1 2
2 3
2 4
1 4
3 4
```
##### Output
`2`

#### Explanation
See the above image. the purple diamonds represent the gifts hidden during Santa's first visit and the red diamonds represent the gifts hidden during Santa's second visit. We can see the houses 2 and 4 has maximum number of gifts hidden. Both are having 2 gifts hidden, hence the answer is 2.
### Solution
**Approach** :
Direct approach (not optimal) represent the city using a graph object where houses are nodes, the applu dfs to determine the shortest distance and the houses that come between house **u** and **v** , and add 1 to all whenever they were visited . then look for node with largest gifts and print it out. Since I'm pretty sure the below code is not the effecient one possible, Any help to optimize is greatly appreciated either in comments or directly ping [me](/contact/)
#### Implementation
python 3 code

```python
#! /usr/bin/python3
from collections import defaultdict


class Graph:

    def __init__(self, n):
        ''' using default dict to store edges & weights of initialized graph'''
        self.graph = defaultdict(dict)
        self.gifts = [0]*n

    def addEdge(self, u, v, weight=1):
        ''' adding edges u->v with weight or 1 otherwise '''
        self.graph[u][v] = weight

    def addGift(self, src, des, parent):
        crawl = des
        self.gifts[crawl] += 1
        while parent[crawl] != -1:
            self.gifts[parent[crawl]] += 1
            crawl = parent[crawl]

    def traverse(self, src, des, vertex):
        ''' taverse from i to j adding 1 to all visited nodes '''
        ''' bfs traversal from vertex s '''
        visited = [False]*(vertex)  # to keep track of visted vertices
        queue = []  # data structure to hold visted vertex in FIFO fashion & acheive BFS
        parent = [-1] * (vertex)   # to track the order of visit
        queue.append(src)
        visited[src] = True

        while queue:
            s = queue.pop(0)

            for vertices in self.graph[s]:
                if not visited[vertices]:
                    queue.append(vertices)
                    visited[vertices] = True
                    parent[vertices] = s
                    if vertices == des:
                        self.addGift(src, des, parent)
                        return True  # found dest
        return False


if __name__ == "__main__":

    # print("Enter no. of cities and days of visit")
    n, m = input().strip().split(' ')
    n, m = [int(n), int(m)]
    g = Graph(n)
    # print("Enter routes u->v:w\n"%m)directed graph ,add two edges for undirec
    for edges_i in range(n-1):
        u, v = [int(edges_temp) for edges_temp in input().strip().split(' ')]
        g.addEdge(u-1, v-1)
        g.addEdge(v-1, u-1)

    for days in range(m):
        i, j = [int(start_finish) for start_finish in input().split(' ')]
        g.traverse(i-1, j-1, n)

    print(max(g.gifts))
```
