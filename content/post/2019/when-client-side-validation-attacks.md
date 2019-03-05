---
title: "When client-side validation attacks"
date: "2019-02-19T10:05:44+11:00"
abstract: "StarTrack’s auto-filled forms don’t even validate."
year: "2019"
category: Internet
tag:
- australia
- databases
- validation
location: sydney
---
**Step one:** Being asked for an address by StarTrack.

<figure><p><img src="https://rubenerd.com/files/2019/screenie-startrack1@2x.png" alt="" style="width:338px;" /></p></figure>

**Step two:** Entering a postcode, and getting a list of suburbs.

<figure><p><img src="https://rubenerd.com/files/2019/screenie-startrack2@2x.png" alt="" style="width:338px;" /></p></figure>

**Step three:** Selecting and autofilling a suburb from the dropdown.

<figure><p><img src="https://rubenerd.com/files/2019/screenie-startrack3@2x.png" alt="" style="width:338px;" /></p></figure>

**Step four:** Can't progress because the autofilled value doesn't pass client validation, so use *Inspect Element* to override so you can submit the form!

I understand the need for validation, and appreciate these auto-fill address fields must have drastically decreased errors. But *wow* they're brittle.

