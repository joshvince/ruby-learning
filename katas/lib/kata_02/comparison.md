# The Binary Chop Kata

I'm not a programmer by trade (I'm a Product Manager) but I'm working to become one. Right now, I'm focussing on learning Object Oriented patterns and paradigms by learning Ruby. As part of this, I'm trying out the [Katas by Dave Thomas](http://codekata.com/). I'd highly recommend these exercises - and generally anything that Dave writes - to anyone learning programming.

The second Kata, [Karate Chop](http://codekata.com/kata/kata02-karate-chop/), asks you to create multiple implementations of a binary chop. This was a perfect excuse for me to put some of recent learnings into (admittedly academic!) practise.

I tackled three implementations (I didn't make to five, forgive me Dave) and gave each a loosely descriptive name. In order, these were:
1. [Recursive Chop](https://github.com/joshvince/ruby-learning/blob/master/katas/lib/kata_02/recursive_chop.rb)
2. [Looper Chop](https://github.com/joshvince/ruby-learning/blob/master/katas/lib/kata_02/looper_chop.rb)
3. [Functional Chop](https://github.com/joshvince/ruby-learning/blob/master/katas/lib/kata_02/functional_chop.rb)

## Notes on each solution
This isn't really a guide to my solutions, as frankly this blog is mostly intended for me to document my learnings, but I figure that someone might stumble on it - so I'll give a tiny bit of commentary on each.

Each implementation had to be as different as possible, so my first task was to think about the constraints of a solution before beginning.

A note first: I've recently read the amazing book [99 bottles of OOP](https://www.sandimetz.com/99bottles) by Sandi Metz (another strong recommendation if you're learning) and so I set a universal rule to help me flex those TDD muscles:

**_Rule 0: Each implementation must follow the "Shameless Green" approach outlined in Chapter 1 of 99 bottles_**

_If you're not aware of the book, this boils down to the **Red/Green/Refactor** concept - the "shameless green" refers to the act of shamelessly writing code that passes a series of tests, refactoring when necessary._

In addition to the Shameless Green constraint, I set specifics for each implementation:

### Recursive Chop
#### Rules:
* _Use OO paradigms when passing state around (instance variables etc)_
* _Use recursion somewhere_

[View the code here](https://github.com/joshvince/ruby-learning/blob/master/katas/lib/kata_02/recursive_chop.rb)

#### Thoughts:
* I did this one first, which meant it took me the longest as I had to create all the boilerplate like Rspec and Benchmark, as well as it being my first run in with this algorithm, ever.
* Recursion is still my go-to concept and it clicked as easily in Ruby as it did in Elixir.
* The spaceship operator (`<=>`) was a great find, tailor made for this problem.
* This one was a challenge to write, but I'm pretty pleased with it as a first ever implementation, and I refactored quite extensively.

### Looper Chop
#### Rules:
* _Don't use recursion anywhere_
* _Use a loop somewhere (believe it or not this is massively out of my comfort zone)_

[View the code here](https://github.com/joshvince/ruby-learning/blob/master/katas/lib/kata_02/looper_chop.rb)

#### Thoughts:
* This was by far the hardest to write for me. Loops are not natural to me, as I use Iterators or recursion almost always.
* It had the most dumb errors because of my shitty handling of state inside the loop. A really good opportunity for me to code outside of my comfort zone.
* Essentially the rest of the implementation is identical, which I'm not super stoked about, but I focussed on loops rather than changing everything else for the sake of it.
* This one _feels_ the most complicated, and was also the least fun to write.

### Functional Chop
Rules:
* _Modules only_
* _Pure functions only, no shared state_
* _Build on the previous learning without repeating it_

#### Thoughts:
* It doesn't feel like The Ruby Way... 
* But it does feel very natural to write code this way, and was by far the most enjoyable one to write.
* It was also easily the fastest to implement, but that's likely because it's the third day in a row I'm implementing the same algorithm.


## Relative merits of each solution
The final part of the Kata asks you to reflect on your implementations: which was the most error prone, which was the fastest to write, which was the most fun?

#### Most Error Prone
Definitely the Recursive Chop, which was probably uncoincidentally the first implementation. I made a lot of my mistakes here.

Least was definitely the Functional Chop (the last one chronologically, again probably not a coincidence) where I pretty much only got snagged once, on an "off by one" problem that I didn't face with the other two.

I took this in a different direction, again inspired by the Sandi Metz book. I sought to measure each against four metrics:

#### Fastest To Write
No question which implementation wins this one: the Functional Chop took me orders of magnitude less than the other two. Again, most likely because I knew my way around the algorithm by this point. If I'm honest, they're not really _entirely_ different implementations, are they....

The looper took me the longest because I had actually forgotten how loops really worked, it had been so long since I'd written one in anger.

### Most Fun To Write
Once again, I enjoyed writing the Functional Chop most - partly because it felt like a cumulative effort of my research and work over the past few days, and partly because it was shortest and clicked most easily. It was especially fun when I figured out I can create a single method to achieve the search.

The looper implementation was the least fun to write. Poor Looper Chop, I've really wailed on you in this article. 


## Metrics of each solution

### Performance
The Kata tells you not to worry about performance, but seeing as this was my first encounter with this algorithm, I got curious about how I could measure performance.

To do this, I used the `Benchmark` library in ruby. This was a really pleasant find.

You can see my comparisons in the [binary_chop.rb file](https://github.com/joshvince/ruby-learning/blob/master/katas/lib/kata_02/binary_chop.rb). I had two aims: compare the implementations against a linear search to see just how much faster they are, and also to compare them against each other.

If you've not come across Benchmark before, you can just call `Benchmark.bm`. This will then allow you to call `.report` inside the block, and you'll get a result per block.

In the first benchmark, I compared my binary chop implementation with a linear search I created, providing both with a randomised number between 1 and a few million. As you can imagine, the binary chop was faster by orders of magnitude.

#### Against each other
What was interesting though, was the results of a benchmark where I pitted the implementations _against each other_. I'm going to caveat this next bit by saying **I have no idea why these results are the way they are, but I intend to find out!**

I ran benchmarks on sorted lists of 90 million records. Each implementation had the same number, to ensure it would 'tick' the same number of times. The results were stark...

| Solution        | Benchmark |
|-----------------|-----------|
| Recursive Chop  | 0.000270  |
| Looper Chop     | 0.000124  |
| Functional Chop | 0.000069  |

Our old friend Functional Chop won regularly, by a substantial margin. Again, **I have no insight to offer here, but it sure was interesting...** I intend to dig into this further with colleagues or by researching, to figure out why.

### Code "Quality"
Inspired by 99 bottles of OOP by Sandi Metz, I've also measured the performance of each solution based on three factors:
* LOC
* FLOG score
* Flog worst 'bit'

| Solution        | LOC  | FLOG | Worst FLOG  | Benchmark |
|-----------------|------|------|-------------|-----------|
| Recursive Chop  | 49   | 40.6 | 23.9        | 0.000270  |
| Looper Chop     | 48   | 44.0 | 33.5        | 0.000124  |
| Functional Chop | 21   | 21.9 | 21.9        | 0.000069  |

Summing up, it's clear that the Functional Chop implementation wins on each account: and a nice affirmation that code that felt easy and fun to write is actually decently performant and also, in relative terms, is the 'best' implementation - at least in the eyes of one framework specifically designed for the purpose.

I'm sure there would be lots of refactoring to be done to my implementation, but then again this is an academic exercise -- I'm happy leaving this as it is and moving onto the next kata, onto the next challenge!

If you're somehow reading this, firstly thank you and secondly I hope it was interesting or useful to you.