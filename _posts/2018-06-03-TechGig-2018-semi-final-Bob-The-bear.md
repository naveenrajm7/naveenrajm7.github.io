---
title: "TechGig CG 2018: Bob the Bear"
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
Solution to semi final problem 1 Bob the bear

### Problem Statement
Bob is a grizzy bear and just lika all grizzlies he loves hunting salmon fish. Bob has a strategy for cating salmons. He stands at the edge of the river and waits for the fishes to cross him. Whenever a fish comes in the same line as that of Bob. he catches it.  
For the sake of the problem assume the river is flowing fromm left to right and bob is currently sitting at **x-coordinate = 0** (origin). Alll the fishes are swimming with the river's flow at a uniform speed of 1 from left to right. The x-coordinates increases as we move rightwards in the river and decreases as we move leftwards. **initially all the fishes has a non-positive x-coordinates.**  
YOu are given the information about **N** salomons in the two arrays len and **time**, where len[i]=length of the ith salmon and time[i] = time at which the head of the ith salmon reaches the x-coordinate = 0 (origin). So, at any time T, the ith salmon has its head at x-coordinate = T-time[i] and tail at x-coordinate = T- time[i] - len[i].  

At any point of the time Bob can catch all the salmons whose any part of body(between head and tail, both inclusive) is at origin.  
**Bob wants to catch salmons no more than twice**. What is the maximum number of salmons Bob can catch?

#### Input format.  
1st line - **N**- number of salomon  
2nd line - contains N separated integers representing the contents of array **len**.  
3rd line - contains N separated integers representing the contents of array **time**.  

#### Output format
An integer representing the maximum nu,number of salmons Bob can catch.

#### Example
![example](https://lh3.googleusercontent.com/bvbkaLKknmK-RtYPx72pChoLqrs3qhhz9B67kcPO3P8e4Fz16NvKg80mkaHCS_wkYClsDjc7koPgOcgTIFZP0WiFxvlygTjK4PolRr8yAk3nLylWVE0zcXNG7lcOHX1Si5BI22VPev32j3q1IK1DYIYJEfuznqfQbNzqAobYwRQTuuKMoPAaq2mdh0XxgNRQgwshbFwXTIboLBHnEOgZgpYAOJOgMmKF7Xn-GE2lj9yAgmQS2WRN1RJ8FLf74-11hM1xEu8YuiMmDZqNfKdCgh8uqRIPaykKaleFLrLx75CuiBofclhC-ImTZbI7TgM4q1GLXaPsh7zkOgPspLC2cnCn5f5dW-WJPH-gSZ9E_RcX-W8eVKn0pLAJe4JFhr408j9HZiSEPGK9TRMHUjyJijbUPiTgt0Rz3dp4eOZIRjGQ4Xn9lnofvln_jcFUArSrvg5ABEydblOcQ16MarllQC1om4zxx05oDbJ0xlrUFu-HgHpt4rOTCcnhgxy19Buvq5-g6Qs-krMnGJOzUqzcJfrt0gNAdRMhI1e84CvdcV-1ckx3dUKn1tmCTo2fG6A5xfV8q9k3UsM53SfLpFrCaIlDR32Gmi5zZC11t-MCM6cB0U2UH91Mg_cuR1spKcOgcDxG98vwxGZ8zfZ73Qfvm6PSKnuAp52-=w136-h133-no)
##### Input
```
5
2 4 4 2 4
1 4 1 6 4
```
##### Output
`5 `

#### Explanation
at time=1 and time=6 bob can get 5 salomons
### Solution
**Approach** :
Well, I would suggest going for Dynamic programming. You can easily check that "the best time" to go  catch salomon is time when some salomon tail lies (the point where tail lies). In our example it would be 3,5 and 8. Then what we want to do is calculate the best possible scenario of taking 2 from it. You can keep taken times in set to avoid duplicates of salomn and after you have finished your 2-steps just check its size and the biggest one is the solution.


#### Implementation
```python
import collections
import itertools

n = int(input())

l = [int(x) for x in input().split(' ')]

end_set = set()
interval = []
end_dict = collections.defaultdict(list)
i =0
fish_set = set()
maxf = 0

for x in input().split(' '):
    end_set.add(int(x)+l[i])
    interval.append((int(x), int(x)+l[i]))
    i += 1

#print("end_set",end_set)
#print("interval",interval)

for e in end_set:
    for i, r in enumerate(interval):
        if r[0] <= e <= r[1]:
            end_dict[e].append(i)

#print("end_dict",end_dict)

for t in itertools.combinations_with_replacement(end_set, 2):
    fish_set.clear()
    fish_set.update(end_dict[t[0]])
    fish_set.update(end_dict[t[1]])
    if len(fish_set) > maxf:
        maxf = len(fish_set)

print(maxf)
```
