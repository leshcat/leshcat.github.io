---
layout: single
title: "Learn DevOps The Hard Way Finale: Org Transformation"
date: 2021-08-19
categories: posts
tags: devops
toc: true
toc_label: Table of Contents
toc_sticky: true
excerpt: >-
  So we know what DevOps Methodology is and willing to apply it. So where do we Begin?
---
## Preamble

![Big things have small beginnings](/assets/images/ldhw-part-six/big-things-have-small-beginnings-small-beginnings.gif)

Sooo...where do we Begin? :slightly_smiling_face:

First, lets figure out to what type of Organizations DevOps Methodology can be applied.

-----

## Suitable Organizations

Common thing I keep hearing is that existing Organizations are unlikely to succeed in DevOps Transformation, as it's Legacy Processes, Systems and "Silo-ed" Mindset make it virtually impossible, all you can do is to perform some practices and apply the tools.

However, According to ["The DevOps Handbook"](https://www.amazon.com/DevOps-Handbook-World-Class-Reliability-Organizations/dp/1942788002/ref=sr_1_1?dchild=1&keywords=devops+handbook&qid=1623762578&s=books&sr=1-1){:target="_blank"}, ["Accelerate: The Science of Lean Software and DevOps: Building and Scaling High Performing Technology"](https://www.amazon.com/Accelerate-Software-Performing-Technology-Organizations/dp/1942788339){:target="_blank"} and many-many other sources, Real DevOps Transformation is possible in any type of Organization, regardless if its Mature Enterprise or New Born Startup.

### Observation: DevOps in existing Organizations

Hiring a bunch of "DevOps" guys and safely assuming you have DevOps now, *"just like anybody else"* - is the most common mistake existing Organizations do.

Being *"one of these"* guys, generally speaking there are two places you can fall-in:

* with very low probability you 'll be assigned to some "RnD" Team with strict Infrastructure & CI/CD activities

* with highest probability you will end up in "bit-of-everything" Team called a "DevOps" Team, covering pretty much all Engineering Activities: starting from physical networks & servers setup, laptops distributions, email and access provisioning, CI/CD, Clouds and ending up as late night deployers or/and lvl 1 support.

Regardless of your luck, by forming such Teams, Org does the same old mistake: handover from devs to ops over the wall just with extra steps.

Lack of core understanding of what DevOps Methodology is and what "DevOps Engineers", or simply "Systems Engineers following DevOps Methodology" are supposed to do - is the primary reason of this to happen.

### Observation: DevOps in Startups

Or missing entirely, or not taken seriously, which actually kinda makes sense.

To back this up, [CHAPTER 3 of "Inspired" book](https://www.amazon.com/INSPIRED-Create-Tech-Products-Customers-ebook/dp/B077NRB36N){:target="_blank"} states that Startups don't really care much about Processes and Methodologies, as their primary goal is to get the market niche and earn its first attention before they run out of money.

Nevertheless, I believe it is imperative to establish DevOps Methodology right from the start, thus ensuring rapid delivery which is pivotal for any Startup survival and solid basis for future scaling.

## Starting DevOps Transformation

It is highly unlikely you will succeed in Transforming entire Org right away just by showing some promising slides with nice numbers, obviously it takes much more than that.

However, in order to increase your chances of success, let's **Start Small** here:

- Create or re-use one or two Teams sized by ["Two Pizza Size" rule](https://landing.directorpoint.com/blog/amazon-two-pizza-rule/#:~:text=Amazon's%20Two%20Pizza%20Rule%3A%20One,one's%20ideas%20get%20drowned%20out.){:target="_blank"}

- Establish some basic process changes to facilitate the behaviour change, following [John Shook](https://www.lean.org/WhoWeAre/LeanPerson.cfm?LeanPersonId=4){:target="_blank"} quote: *"...the way to change culture is not to first change how people think, but instead to start by changing how people behave — what they do."*

- Start shifting to DevOps Mindset

### Preparing the Team(s)

#### New Product/Service Team

Form or re-use fully fledged self-sustained product/service Team with all necessary people on board: Devs, QAs, BAs, InfoSec, Ops, SM/PM/DM, etc and DevOps guys, consisting of ["innovators and early adopters"](https://www.amazon.com/DevOps-Handbook-World-Class-Reliability-Organizations-ebook/dp/B01M9ASFQ3/ref=sr_1_1?crid=EVX6LIKLWU9A&dchild=1&keywords=devops+handbook&qid=1629229560&s=digital-text&sprefix=devops+hand%2Cdigital-text%2C275&sr=1-1){:target="_blank"} whenever possible.

If assembling new Team is not possible nor viable, lets go with existing DevOps Team vast majority of Orgs have.

#### Current DevOps Team

* Ensure to read an article ["Staying on the path to high performing Teams"](https://lethain.com/durably-excellent-teams/){:target="_blank"} by Will Larson and decide if you need Hire or extend DevOps Team to the point they can actually create something new.

### Rules & Processes

Nothing crazy new will follow below, but it's important you do a self-check:

* Create entirely new "Jira/Other Software Development provider" Project with single Backlog for the Team's amusement :wink:

*  Assuming you are practicing Agile:

    * Make everyone in a Team a part of daily standups, retrospectives, grooming and planning

    * Establish rules for Tickets Creation:

      Use simple DoR (Definition of Ready), in example:

      - **Why** are we doing this: what's the Business/Technical value?
      - **What** is exactly expected: links, "just like they have", metrics etc
      - **How** it should be implemented: recommendations or restrictions of desired solution

    *  If your Sprints constantly failing due to the lack of working Prioritising Mechanism or it is simply not respected, as a workaround, instead of Sprints consider ScrumBan:

        Check out following resources for proper ScrumBan transition in terms of steps and calculating Work In Process(WIP):
        * ["Agile: Scrum, Kanban & Scrumban"](https://medium.com/@shehanb/agile-scrum-kanban-scrumban-cheatsheet-sprint-artifacts-ceremonies-software-jira-trello-scrumage-pmbok-e669d5dbf6f3){:target="_blank"}
        * ["Kanban WIP Limits"](https://kanbanzone.com/resources/kanban/wip-limits/){:target="_blank"}
        * ["Value Stream Mapping"](https://kanbanzone.com/resources/lean/value-stream-mapping/){:target="_blank"}

* Ensure your Team has 20% time reserved to solve their Tech Debt

  There is a good quote from [Project Phoenix](https://www.amazon.com/Phoenix-Project-DevOps-Helping-Business/dp/0988262592){:target="_blank"}: If the Team *"doesn’t pay down its technical debt, every calorie in the Organization can be spent just paying interest, in the form of unplanned work."*

* Ensure your Team has 20% of time for Innovations & Improvements

* Check out ["Value Stream Mapping" Book](https://www.amazon.com/Value-Stream-Mapping-Organizational-Transformation/dp/0071828915){:target="_blank"}

  VSM allows you to understand and optimise your existing Value Streams by removing wasted time and even parts of your chain

### Start shifting to DevOps Mindset

Based on experience i 've gained through the years and books combined I present to you the following steps:

1. Pretty much everything in this world we understand and master through Learning.

   Why should this case be any different?

   Make an accent that the Team is now working under [DevOps Methodology and its 3 Ways](https://miro.com/app/board/o9J_l_dQ8LQ=/?fromEmbed=3){:target="_blank"}, every single member should understand its goals and expected outcomes, spend enough time together studying it & questioning its benefits, sign up for [DevOps Culture and Mindset](https://www.coursera.org/learn/devops-culture-and-mindset){:target="_blank"} course

2. Develop and maintain the DevOps mindset:

    * Own and be responsible for the whole delivery lifecycle as a Team

    * Know how all the counterparts are stitched together for your service and how it Impacts the Whole System, recall [Systems Thinking]({{ site.url }}/posts/ldhw-part-five/){:target="_blank"}

    * Share your local knowledge with Organization by Documenting it in Org's Confluence, start ["Lunch n' Learn"](https://www.mindtools.com/pages/article/lunch-and-learn.htm){:target="_blank"} days

3. Make it your own:

   Don't try to execute all the DevOps Principles & their Practices perfectly, some things can be dropped out for now. As once pretty famous CEO said: *"In order to become a Butterfly the creature must to go through thee cattle pillar form first"*

4. Lead by example:

   Always question your decisions against 3 Ways. Note, it is absolutely fine to deviate from it for substantial quick Business win, given your solution is registered as Tech Debt afterwards

5. Practice patience: Rome wasn't built right away

6. Practice practice: try, fail, repeat

7. People of DevOps culture do not pass the work over the wall to other Teams, its a one Team mindset

8. DevOps is about a culture of collaboration

9. Leadership (with help of Management if required) is to provide recurring reports with evidence of Transformation progress Organization-wide, for better or worse

## Conclusion

Once **Start Small** actions yield positive results, you will have enough experience and knowledge to can scale-out your Transformation on other Teams, slowly but surely establishing DevOps Culture in your Org :slightly_smiling_face:

It is important to bear in mind one thing:

Improvements in software delivery by adopting Methodologies like Agile or DevOps, implementing Spotify Engineering Organizational Structure for your Org and so on and so on are only possible, as long as leadership provides consistent support: including time, actions, and resources — demonstrating a true commitment to improvement, and as long as Team members commit themselves to the work.

If you are one of the Leadership and reading this - you now know what to do :slightly_smiling_face:

If you are DevOps/Engineering Manager or even CTO in "existing Organization" described above, who wants:

* Organization to succeed in ever-rising competition
* Have a humane work/life balance
* Calmly think through the Modern Tech that will make your Org success even greater with obvious benefits for you and your colleagues

I call you to read this blog very carefully, add your thoughts, do some Nice Customer-Centric Slides for the Leadership and get to the Tops with your Plan.

In the event of failure - don't give up just yet, recall the Samuel Beckett's words:

*“Ever tried. Ever failed. No matter. Try again. Fail again. Fail better”*

Stay Frosty,

L.
