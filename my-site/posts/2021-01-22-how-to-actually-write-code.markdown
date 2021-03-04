---
title: How to (actually) Write Code
---

I was playing the first-person-shooter video game Apex Legends, and I began thinking: Apex is a pretty boring video game, lots of time is spent searching for enemies and gathering equipment. These tasks take up a lot of time in most battle royale shooters, and are quite repetetive. Why am I willing to go through all that rather than write code? Could I extract some of my motivation from gaming to programming?

For me, it turns out I could. It can really be quite simple to write code. For spare time programming, I've learnt to focus on repetetive tasks with simple and tangible rewards. 
This also means avoiding some of the best practices. Yes, testing will spot bugs earlier. Yes, having merge requests reviewed will teach you a lot. Yes, singleton is an antipattern that will eventually eat your codebase. And yes, planning out your code can save you a lot of time. But if you've had a long day, it's just a lot easier to drop in on your programming projects if you know you're going to just hack out code. If you know that you can make something work with five nested `for loops`, __go ahead__. If you want to combine programming languages in a single solution, __go ahead__. It's better than leaving code to collect dust (if your goal indeed is to write more code). Anyhow, writing good code is often easier on the heels of bad code, since you'll understand more about the domain. 

[The mythical man month book](https://en.wikipedia.org/wiki/The_Mythical_Man-Month) suggests that productivity to programmers is about writing __programs__, not __programming products__. This also explains why many software projects are major undertakings; one only considers the time it would take to solve the __programming__ problems, not documenting code, testing, regressing, etc. By ignoring enterprise constraints, you're appealing more to the programmer heart. 
One important aspect of this too, in my opinion, is that a lot of developers will still write better code than they think. "Good code" is often minimized, but not inherently better. Its just adapted more for the actual requirements at the given time. "Good code" can also often exploit properties from the domain. This makes it better to a programmer with experience from the domain, but more difficult to someone outside, i.e. the next person to look at your code. Code written in a rush and not refactored might appear messy, but chances are that their code is easy to interpret, since they had no room to be clever.

 [Akin's Laws of Spacecraft Design](https://spacecraft.ssl.umd.edu/akins_laws.html) is one of my favorite web sites, and he puts what I'm trying to say much more succinct:
 14. (Edison's Law) "Better is the enemy of "good"
