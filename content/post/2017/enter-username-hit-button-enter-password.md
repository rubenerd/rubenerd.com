---
title: "Enter username, hit button, enter password"
date: "2017-10-13T10:42:00+10:00"
abstract: "This design trend is awful, and you should feel awful for implementing or designing it."
year: "2017"
category: Internet
tag:
- security
- design
location: sydney
---
Hello web developers and designers, thanks for coming. I want you to look at this screenshot and tell me what's wrong with it.

<p><img src="https://rubenerd.com/files/2017/atlassian-badlogin@1x.png" srcset="https://rubenerd.com/files/2017/atlassian-badlogin@1x.png 1x, https://rubenerd.com/files/2017/atlassian-badlogin@2x.png 2x" alt="Atlassian login form with a single username textbox." style="width:500px" /></p>

Yes, the Google login shouldn't be there. An advertising company of their size has no business knowing even more about us. Atlassian's new logo also leaves a lot to be desired. But they're not the main issues.

Note the lack of a password field. In this scenario you ask us to:

1. Enter or autofill our username
2. Hit a button (new!)
3. Wait a few seconds (new!)
4. Enter or autofull our password
5. Hit another button

**Steps 2 and 3 are superfluous**. You're making us jump through an additional hoop we never needed to before. It's a bad design decision, and if you advocate for it, you should feel bad.

*But Ruben! We need this because different authentication systems require different credentials! Some use SSO or need different tokens! Some systems may not need a password! Or maybe we'll need to redirect people to another site! We normalise user-hostile interfaces!!!*

Nonsense. Well, except for the last point. You can start with reasonable defaults, then remove/replace/redirect fields as needed with the same dynamic controls you're using everywhere else. Otherwise, give the rest of us a normal login form we can autofill with our password manager, or use with our screen reader, and be done with it.

This is a classic anti-pattern: regardless of the dubious, ill-informed technical or design justification, it renders user experience and accessibility *worse*. That's the bottom line. We need a more robust and secure form of authentication, but shameless obfuscation isn't it.

So far I've counted Atlassian, Google, and Microsoft as being guilty of this, and I'm sure there are more.

**Stop doing this.** End of discussion.

