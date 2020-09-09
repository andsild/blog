---
title: How to Solve it by Polya, Applied for Debugging
---

Sometimes when I debug code I get lost in Alice's Wonderland. I found "How to Solve it" by Polya, written 1945, to be a long-overdue must-read.
Polya, FYI, was an accomplished professor in mathematics both at ETH Zürich and Stanford.
The jist of the book is four principles, which he drills into you with many examples from simple elementary-school level geometry and crossword puzzles. The principles are:
  * First, you have to understand the problem.
  * After understanding, make a plan.
  * Carry out the plan.
  * Look back on your work

Primarily, Polya is interested in mathematics, but I find that his approaces are general enough that I can make use of them in debugging code / solving coding problems. Here's how I map the principles:

### 1. Understanding the Problem
My personal approach to debugging has often been to dive right into the problem and look at exceptions, etc, to debug. Polya writes in his book "it is foolish to answer a question you do not understand".
The more experienced I've gotten, the more I've agreed with that quote. In debugging now I try to focus more on _when_ the problem occurs, and what the _effect_ of the bug is.
Many problems, in my experience, are often trivial, caused by small code-changes or hardware. Mapping out the entire data pipeline (data comes in -> ...  -> problem) will also make it easier to keep your mind open when - or maybe just if - you do decide to look at the code.

### 2. Make a Plan
Combine making a plan with regression/looking back on your work. It's important to have the plan clear cut out, so that it is easier to review yourself afterwards. I like to think of a principle I've picked from a podcast on [the turtle traders](https://www.turtletrader.com/it/): if you make decisions based on your emotions, then you will not be able to repeat or avoid your own behaviour. If you do e.g. make a plan to buy 100 stocks and keep them until 50 % rise in price; but sell them at 20 % because the market is looming, then what have you learned after? What will you do next year when you invest? Will that work better? Be thorough in your plans and deviations, since feelings often deceive us. In stock investments its all too easy to get cold feet and sell out early. The same goes for debugging; it can be hard to lift your head and realize that a cause is completely outside of the code, it could e.g. be hardware related, or caused by a test system going amok.

# 3. Carry out the Plan
In programming I find it hard to stick to the plan. Often as I go I discover multiple things underway, and the more I review code, the more questions and context comes into my head. I'll be honest and say that I often stray off from my plan because of this. I'd like to blame having lots of legacy code around, but I'm open to accepting that it could be poor habits. I hope its a thing that will be easier in time :) 

# 4. Look Back on Your Work
Polya makes some great examples where he is able to generalize results from solving problems, e.g. explaining how to apply pythagoras' theorem for finding the diagonal of a pararellepiped.
Looking back on my work, I often (as mentioned) review my intial plan and understanding of the problem. Did I ask enough questions? If I looked at the wrong systems, why did I do that, and what will change the next time I review?


Generalizing results can be tough in programming. [Google's SRE book](https://landing.google.com/sre/sre-book/toc/index.html) has a great analogy of a pitfall I've fallen for before, about a doctor in Africa. A child comes in with bruises after having been stampeeded by Zebras. A few years later, the doctor works somewhere else in Europe. Then a child comes in with bruises, and the doctor exclaims: "I didn't know we had Zebras in Europe!". The general lesson here is, just because you're seeing effects/errors you've seen before, it doesn't mean they have the same cause. And in programming, that can happen a lot. The easiest way to generalize, I find, is to compare the problem you just solved with a previous one that has been solved. What are the similarities, what was better/worse, etc?


Happy debugging on. I'd like to finish with another Polya quote that can be useful in debugging:
"Simplex sigillum verdi" - which means, "simple means truth"
