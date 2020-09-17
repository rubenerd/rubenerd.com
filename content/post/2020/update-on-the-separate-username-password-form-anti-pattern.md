---
title: "Update on split username-password forms"
date: "2020-08-15T09:27:03+10:00"
abstract: "They were always a bad idea, but this latest mitigation of their accessibility flaws is even more absurd!"
year: "2020"
category: Internet
tag:
- accessibility
- design
location: Sydney
---
I've mentioned before the anti-pattern of having people use two separate forms for their username and password. Whereas previously you would:

1. Type your username and password
2. Press Submit

Sites now require you to:

1. Type your username
2. Press Submit
3. Wait
4. Type your password
5. Press Submit

There are a few reasons why they could be doing this, and none of them are any good. There's the Titanic lifeboat defence, where having two fields makes the login page *look too cluttered*. There's the mutiple-auth system defence, which shouldn't preclude having two fields for everyone else. But the worst is seeing sites validate people's usernames independent of passwords, which is such an egregious form of data leakage that I immediately cease using any sites I catch doing it, and encourage you to do so too.

The good news is some sites are waking up to the fact that these split forms are also a huge step backwards for accessibility. But I nearly fell out of my chair when I saw their proposed solution! Okay I lied, I was using my standing desk, like a gentleman:

<p><img src="https://rubenerd.com/files/2020/bad-login-form-change.png" alt="Log in form showing a label for the username, and a link with the word 'Change' next to it." style="width:440px" /></p>

That's right, they've kept the redundant form, but they've added a link to let you edit your username if you made a mistake. But... hold on, you know another form element that lets you edit things? *A username text box!*

I'm going to call anti-patterns of this nature *busywork*.

