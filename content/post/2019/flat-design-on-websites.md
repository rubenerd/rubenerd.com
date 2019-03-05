---
title: "Flat design on websites"
date: "2019-03-03T14:06:50+11:00"
abstract: "A GitHub design suggestion linked from Hacker News should be taken with a grain of salt."
thumb: "https://rubenerd.com/files/2019/github-resign-after@1x.jpg"
year: "2019"
category: Internet
tag:
- colour
- design
- github
location: Sydney
---
Flat UI designs did away with a lot of visual clutter, but there's enough cognitive science and evidence now to demonstrate how and why they hamper usability. *Rubenerd* can get away with basic design because all I have are blog posts and links, but an interactive web application needs visual cues.

This is a good-faith look at one such example that made it on Hacker News recently on a redesigned GitHub repo page.


### How flat UIs hamper usability

[I quoted an article] in 2017 that cited this [Nielsen Norman Group] research:

> Summary: Flat interfaces often use weak signifiers. In an eyetracking experiment comparing different kinds of clickability clues, UIs with weak signifiers required more user effort than strong ones.

People were warning as early as 2013, as [Krish Mandal wrote]\:

> That’s the bane of flat design. You have very little idea of what, exactly, is clickable, what is slidable; clues to the interactive UI elements are stripped away. Perhaps color would give you a clue. Perhaps your being savvy in the use of digital UI would override the cognitive dissonance for favorite apps that suddenly went Flat. But if I were you show you a flat design that you’ve never seen before, side by side with a non-flat design of the same site, I’m willing to bet that you pick up on the affordances inherent in the non-flat design, and are able to adopt and use that interface more quickly, because that non-flat design doesn’t ask you to “think more.” (Remember Steve Krug’s, “Don’t Make Me Think?”). Flat design makes you have to think things through as a user.

I'm reminded of that quip mis-attributed to Albert Einstein that everything should be made as simple as possible, but not simpler.


### Redesigning GitHub

So we come to this new [GitHub page proposal by Nikita Tonsky] that made the rounds on Hacker News. The thought process is interesting, though I felt the end result missed a bit. Here's what GitHub looks like currently, with the old Chrome UI removed because I didn't feel it was fair:

<figure><img src="https://rubenerd.com/files/2019/github-resign-before@1x.jpg" srcset="https://rubenerd.com/files/2019/github-resign-before@1x.jpg 1x, https://rubenerd.com/files/2019/github-resign-before@2x.jpg 2x" alt="" style="width:500px" /></figure>

And the new UI proposed by Nikita:

<figure><img src="https://rubenerd.com/files/2019/github-resign-after@1x.jpg" srcset="https://rubenerd.com/files/2019/github-resign-after@1x.jpg 1x, https://rubenerd.com/files/2019/github-resign-after@2x.jpg 2x" alt="" style="width:500px" /></figure>

### Thoughts

The second screenshot redesign does fit current design trends, which subjectively I'm painfully against. But if I were to look at it objectively, it lacks strong signifiers, to use Nielsen's terms.

Vague text with outlines are not as clear as buttons. The obvious example is the bright green **Clone or download** button in the first screenshot, which is a clear and unambiguous call-to-action. The redesign lack this entirely, which to me misses the point of GitHub as a service. That to me is indicative.

The new pseudo-tab bar also appears too cluttered with all those extra links and the resulting lack of space to delineate them. The current GitHub design has links in several places, but they clearly cluster related functions.

I'm also not a fan of highlighting tabs with just a coloured underline and subtle bold text; there's insufficient contrast between that text and unselected tabs. And why do the headings for the Files, Commits, and Statistics sections follow that same design if they're not tabs?

I think the removal of commit messages and times was a mistake; again, this seems to miss the point of what GitHub is. These are invaluable in gauging the activity of a repo beyond what an abstract activity graph shoes. The languages and statistics are less important, which is why they're hidden but accessible in the current design.

And finally, there's Nikita's comment that he used to justify his colour choices:

> But maybe it’s time to fresh it up a little? Get rid of gradients, dirty washed-out colors, unnecessary separators, add a little more air.

I agree borders aren't always necessary, and in many cases removing them is a visual improvement. But this page is altogether too busy without some separating markers, and the sections aren't visually consistent. The flat, rounded blue branch and version numbers visually overwhelm everything around them, and don't have the bold text of other bubbles around the interface, such as on the tabs.

GitHub's audience is necessarily more technical, but it still seems misguided to redesign something to be less cognitively efficient. It was a fun and thought-provoking exercise, but as a daily user of GitHub, I hope they don't implement this.

[I quoted an article]: https://rubenerd.com/flat-mobile-designs-reduce-usability/
[Krish Mandal wrote]: https://blog.tallan.com/2013/10/01/the-pendulum-swing-of-flat-design/
[Nielsen Norman Group]: https://www.nngroup.com/articles/flat-ui-less-attention-cause-uncertainty/
[GitHub page proposal by Nikita Tonsky]: http://tonsky.me/blog/github-redesign/
