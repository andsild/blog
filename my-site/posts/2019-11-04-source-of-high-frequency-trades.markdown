---
title: A Source of High Frequency Trading
---

The WSJ reported that the number of trades and orders on eurodollar futures recently exploded at the Chicago Mercantile Exchange. If you're lucky to pass the paywall, you can read the full article at https://www.wsj.com/articles/futures-exchange-reins-in-runaway-trading-algorithms-11572377375?mod=searchresults&page=1&pos=3. The increase in order placement and trades was caused by the discovery that market-information was distributed in a queue, where the market maker with the biggest quote would get notified 10 to 20 microseconds earlier than the rest. While small, it is was still enough to create a benefit for algotraders. Thus, orders were being placed, and as soon as someone else saw that your quote was bigger than theirs, they would post another quote slightly larger than yours. When the quotes reached a maximum size they reset at a low number. What made this event special, was that it lasted throughout the entire October.
