---
title: "Empty code blocks"
date: "2020-09-09T00:28:50+10:00"
abstract: "Are they worth keeping? I’m on the fence."
year: "2020"
category: Software
tag:
- design
- programming
location: Sydney
---
Jason McCreary [shared this code example](https://dev.to/gonedark/untangling-nested-code-1h0a) back in 2018. He commented that the `do nothing` block was dead code, and you should start the `if` statement at the second block:

    if (env('APP_ENV') == 'development') {
        // do nothing...
    } else {
        if ($request->getScheme() != 'https') {
            // process request...
        }
    }

My first instinct is to disagree. This is a form of inline documentation, and a reminder that *something can be done there*, both of which are useful if you're working in a team. It's also scaffolding that gives you space to add functionality later. But then again, your code would double in size if every conditional was treated this way.

I'd say it's useful if the `do nothing` comment constituted something meaningful, like a task manager ticket number, a summary of the desired feature, a `#TODO` or other [programming tag](https://en.wikipedia.org/wiki/Comment_(computer_programming)#Tags), or a link for more information. Otherwise it's probably wasted space.

