# Pre-work - *Tip Calculator*

**Tip Calculator** is a tip calculator application for iOS.

Submitted by: **Vijay Sailappan**

Time spent: **6** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://imgur.com/a/LCMV8.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** Coming from android development, UIKit in iOS looks very feature rich. With minimal effort, I get a polised look and feel in the app. The tooling in app development is very advanced when compared to Android. Swift as a language is so much better to Java especially in areas like null safety, verbosity, closures, functions etc.
Outlets and actions - Imagine every view controller to be a screen in the screen graph. Each screen will have connections by which you can communicate with the screen elements. One such connection is an outlet, which is used for reading and writing property values of views. Actions are connections which links the type of action that can be performed on a view and the callback function that could be called once the action is performed.


Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** When your class has a closure, you are creating a strong reference to it. And within the closure body, if you use 'self' reference and try to access its methods or variables, then you are creating a 'capture' which is essentially creating a strong reference to the object containing the closure. Since you have a strong reference cycle here, the object will not be de-initialized. You will have to use capture list when defining closures, basically defining self reference as unowned and delegate reference as weak to avoid this scenario.


## License

    Copyright [2017] [Vijay Sailappan]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
