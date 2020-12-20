---
title: "Winning Inaugural GitHub Actions Hackathon"
excerpt: "How I managed to build and submit a GiHub Action in a month"
header:
    image: "https://dyjpb62732.i.lithium.com/t5/image/serverpage/image-id/3752iBE0B2530265ACA8A/image-size/large?v=1.0&px=999"
    image_description: "GitHub Action"

categories:
    - DevOps
tags :
    - RPM
    - GitHub
---

It was March 10th , 2020 . When I was scrolling through my LinkedIn feed and found a post by GitHub about [GitHub Actions Hackathon](https://github.blog/2020-02-27-were-challenging-you-to-create-your-very-own-github-actions/) . Just then Nation wide lockdown had started in India , I was able to find some time to work on this and by the end of the month I was able to submit my GitHub Action which made it to the list of eligible submissions , Row No 291 ->
[Official Winners List](https://docs.google.com/spreadsheets/d/1YL6mjJXGt3-75GejQCubsOvWwtYcGaqbJA7msnsh7Tg/edit?usp=sharing).  

## What is GitHub Actions

GitHub Actions help you automate your software development workflows in the same place you store code and collaborate on pull requests and issues. You can write individual tasks, called actions, and combine them to create a custom workflow. Workflows are custom automated processes that you can set up in your repository to build, test, package, release, or deploy any code project on GitHub.

## What was my I trying to solve

I wanted to build a GitHub action which takes up source code of repository and with help of spec file builds RPM , which can be used as Release asset or uploaded as Artifact.

Check out the action in GitHub Marketplace [RPM Build Action](https://github.com/marketplace/actions/rpm-build)
