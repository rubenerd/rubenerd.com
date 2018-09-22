---
draft: true
title: "Prettify JSON with jq"
date: "2018-08-11T14:45:30+10:00"
abstract: "You can set a custom space indentation, or tabs if you’re a monster"
year: "2018"
location: Sydney
category: Software
tag:
- bsd
- linux
- freebsd
- json
- netbsd
- reviews
- tools
---
[Stephen Dolan's jq] is a great little shell utility that, among other things, can prettify JSON. For example, piping this summary from VirusTotal:

    echo '{"resource":"https://rubenerd.com/","scan_date":"2018-08-11 04:33:43","positives":0,"total":67}' | jq

And you get this pretty JSON:

    {
      "resource": "https://rubenerd.com/",
      "response_code": 1,
      "scan_date": "2018-08-11 04:33:43",
      "positives": 0,
      "total": 67
    }

It also works well for multiple nested attributes. You can use `indent` option to set a custom number of spaces, or `tab` if you're a monster. The manpage(1) is also excellent.

I usually use [JSON:XS], but this works in a pinch.

[JSON::XS]: https://metacpan.org/pod/JSON::XS
[Stephen Dolan's jq]: https://github.com/stedolan/jq

