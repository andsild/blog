---
title: Thoughts on logarithms
---
<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>
There's always been some simple formulas handy that show $log_b(x) = y$ is the same as $b^y = x$, from which I've survived the majority of school. Eventually logarithms pretty much just became a tool to use in making graphs show the first, smaller ranges of numbers at a higher resolution.

I've recently picked up some math and decided to have a closer look at logarithms. First: demystifying them.
Logarithms were inventet by a scotsman named Napier. He combined the greek words logos, meaning ratio, and arithmos, meaning numbers. Logarithms is, simply put, related to finding ratios of exponential growth in numbers. Supposedly, this is actually something humans are pretty good at. Experiments on people living outside of educated societies shows we don't differente between smaller numbers, such as the difference between 7 and 8 or 99 and 112. Humans can, however, always recognize bigger differences such as numbers between 2, 4, 8 or 10, 100, 1000... you get the drill.

What happens when we ask a computer or humanbeing for, say, the logarithm, base 10, of 2? How do we actually solve $10^x = 2$?

Duck typing isn't actually such a bad idea. Turns out, logarithms are defined as:
$$\int_1{^a} \frac1{x} \, dx$$
How do we know this is true? Because, said formula satisfies every property that we want from a logarithm:  

<ul>
  <li> $\ln1 = 0$ </li>
  <li> $\ln(xy) = \ln{x} + \ln{y}$</li>
  <li> $\ln{x} < ln{y} \iff 0 < x < y$ </li>
</ul>

... and a few others I dind't bother to copy from wikipedia. The properties above can be found if you play around with exponents a bit (e.g. $e^0 = 1$).

Is this why I was never taught was logarithms were in school? We didn't do intergrals until my senior year, but we did, as far as I recall, logarithms already in the second year.
Anyway, curious about how eulers digit fits in? Well, turns out $e$ is the unique number that satisfies $\ln{e} = 1$
As can be seen in this graph (look at where y = 1):
<iframe src="https://www.desmos.com/calculator/4fepgvofgc?embed" width="500px" height="500px" style="border: 1px solid #ccc" frameborder=0></iframe>
