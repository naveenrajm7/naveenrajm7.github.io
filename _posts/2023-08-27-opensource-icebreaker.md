---
title: "LFX Mentorship with knative: An Open-source Ice breaker"
categories:
    - DevOps
tags :
    - OpenSource
---

Despite having a decent knowledge of programming languagues and technology stack, contributing to large Open-source project always seemed to be a daunting task. the idea of navigating the complex landscape of a project, large codebase,  intricate issue with multiple depedencies easily discouraged me from getting involved in opensource project. Luckily I found LFX Mentorship Program, which is precisely designed to transform this apprehension into confidence. In this post I'll walkthrough my experience with LFX Mentorship program. 

## LFX Mentorship and CNCF

[LFX Mentorship](https://lfx.linuxfoundation.org/tools/mentorship/) is a great platform which offers Project-based Mentorship programs to help train the next generation of open source developers by serving key needs of the community. The Cloud Native Computing Foundation (CNCF) is the top organization supporters which offers mentorship programs thrice a year (Spring, Summer and Fall).

[CNCF Mentoring GitHub Repo](https://github.com/cncf/mentoring) has all the mentorship oppurtunities, so it is worthwhile to keep an eye on the upcoming projects. Based on your interest you can choose any of the proposed projects.

## Breaking the Ice - Slack Channels and Community Interaction:

While it might to diffiult to understand a project simply by glancing the README of the project repo, I have found it immensly useful to join the slack channel of the corresponding project .Simply immersing myself in the Slack channels dedicated to Knative began to demystify the project. Following conversations and updates exposed me to the basics of the project's goals, challenges, and collaborative dynamics. 

![Initial](../../assets/images/posts/slack_initial.png)

Gradually, this immersion led me to discover "good-first-issues" and simple documentation fixes. Those initial steps felt like finding solid footholds on a challenging trail.

## Start small

In order to get hang of the project setup, it is important to try to work on some "good-first-issues". Fixing even a simple documentation error or a similar low hanging fruit issues (As my mentor calls like it to call) will give great confidence to dwelve deeper into other challenging issues


![first_doc](../../assets/images/posts/first_doc.png)


## Preparation Is Key:

With an initial interaction with the project and its community under my belt, I am now shifting my focus towards writing a solid project proposals. 

Once the project of interest is identified, a series of background tasks comes into play. Researching the project's intricacies, understanding its architecture, and acquainting oneself with the existing documentation lays the groundwork for a promising proposal. In my case since the project was about running Knative Serving in Edge devices, I decided to try out installing Knative on a small form factor kubernetes like K0s. I wrote a blog about the learning from my experiments and shared with the community. Which I believe helped me in securing the acceptance becuase I had made a headstart with respect to the proposed project.

![Proposal](../../assets/images/posts/proposal_experiment.png)


## Project 

Finally, I was accepted to [Knative Project](https://mentorship.lfx.linuxfoundation.org/project/830eb064-cf8a-4a8e-bba3-97d429a6ca79) with the amazing [Reto Lehmann](https://mentorship.lfx.linuxfoundation.org/mentor/89c01c3c-192d-4173-8d6c-a17341cf64e4) and [Stavros Kontopoulos](https://mentorship.lfx.linuxfoundation.org/mentor/6bfe2773-fb29-4254-88d5-c22760c25687) as my mentors. 

Once the project was kicked off, I connected with my mentors and set up a weekly meeting cadence. Despite our non-overlapping timezones we managed to meet almost every week to share updates and get help. We maintained a Google Doc as a project Dashboard, where we could track my progress, establish milestones and even get feedback comments for my proposed ideas. 

![time_diff](../../assets/images/posts/time_diff.png)

One thing that helped in our project planning was having a clear project goal which was achievable under the mentorship period. While my project was about enabling Serverless in Edge environment , the scope was very large. Breaking down this idea and we formed two simple goals to start with. 

1. Install Knative Serving in Microshift.
2. Run Microshift Serverless in ARM machines.

Having these clear goals not only helped us to direct our effort in specific direction but they also provided a measurable milestones to evaulate during the mentorship period.

![Project](../../assets/images/posts/microshift_knative.png)


## Moving forward

While I started as a stranger to the Open-source community, I have grown to become a familiar friend. Thanks to LFX Mentorship program. It was a very fruitful experience and more importantly, it has equipped me with skills to successfuly navigate the Open-source ecosystem. Hence, I plan to continue contributing to knative project and possibly continue the cyle of giving back to the community as LFX Mentor.

Need a knative icebreaker joke ...
>if Sugar-less diet is good for health, what's good for environment ? Serverless :)

* LFX Mentorship project [Microshift-Serverless](https://github.com/naveenrajm7/microshift-serverless) 