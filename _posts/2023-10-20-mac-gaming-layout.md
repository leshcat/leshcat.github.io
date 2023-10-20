---
layout: single
title:  "Introducing app: \"Mac Gaming Layout\""
date:   2023-10-20 # date
categories: posts
tags: games apple applescript keyboard mouse

toc: true
toc_sticky: true
toc_label: Table of Contents

excerpt: >-
  Bacause gaming on Mac with mouse and keyboard should not be a pain!
---

## Preamble

{:style="text-align:center;"}
![dev-containers-logo](/assets/images/mgl-3.png){: width="50%"}

Hola!

With the:
* Rise of [Native Mac Gaming](https://www.youtube.com/watch?v=63Ne0YmW-1o){:target="_blank"} (oh yes, it comes in fast)
* Great tools as [*Crossover*](https://www.codeweavers.com/crossover){:target="_blank"}
* Direct help from Apple with its [*Game Porting Toolkit*](https://developer.apple.com/videos/play/wwdc2023/10123/){:target="_blank"}

Automated approach to have a pc-like keyboard and mouse behavior on Mac so you can deliver a proper headshots in Far Cry 5 or [Counter Strike 2](https://www.youtube.com/watch?v=B9ICADmj_1Q){:target="_blank"} and gain a teammates chant of approval became an increasing **necessity**.

However, the [Gaming Mode](https://support.apple.com/en-us/HT213658){:target="_blank"} that Apple advertised works only on the set of Native Games and does not do anything in terms of layout, basically proposing using gamepad...

Gamepad in [Resident Evil: Village](https://apps.apple.com/pl/app/resident-evil-village-for-mac/id1640627334?mt=12){:target="_blank"} or CS2, really???

Hell No! Oldschool mouse and keyboard - definitely Yes!

-----

## Mac Gaming Layout

Beyond doubt, original Apple layout is great for productivity and accessibility: toggle brighness, control music, mute the sound and so on. 

But lets face it - it has little to none value when it comes to gaming.

Sure, we can go with manually changing settings every single time you plan to game...

But why bother? 

Let **Mac Gaming Layout (MGL)** app make it for you in automated fashion!

The app itself is an Applescript bundled as an Automator Application that will manipulate system settings purely with GUI scripting (without any hidden shell commands) by temporately converting your keyboard and mouse layout to PC-like behavior.

In details, it will:

* Toggle built-in TrackPad (enable/disable when external mouse is connected)
* Toggle "Fn (Globe)" action (do nothing / switch input source)
* Toggle "Use F1, F2, etc. keys with standard function keys" (so you can switch spells or abilities in RPGs like Diablo 2)
* Swap bindings - "Fn (Globe)" and "Control" buttons (so you can crouch better in FPS)

**Mac Gaming Layout (MGL)** app is designed to read the current state of your settings, meaning:

* when you need to play - just hit it and let it change your keyboard and mouse settings on your behalf
* once you've done gaming - hit it again and it will revert your settings to an original Apple values

Since it is pure Applescript, you can easily check the code by opening it in build-in MacOS 'Automator' application.

### What do you need

* Download latest version: [https://github.com/leshcat/mac-gaming-layout/releases](https://github.com/leshcat/mac-gaming-layout/releases){:target="_blank"}
* Put it anywhere on your Mac (I recommend *Documents* folder to avoid problems)
* (optional) Add the proper icon
* (optional) Put it in Dock
* Provide [Accessibility Permissions](https://www.macworld.com/article/347452/how-to-fix-macos-accessibility-permission-when-an-app-cant-be-enabled.html){:target="_blank"}
* When started **MGL**, you will be promted to approve "Documents Access" (so MGL can write state file)
* Enjoy!

See installation instuctions with screenshots here: [https://github.com/leshcat/mac-gaming-layout](https://github.com/leshcat/mac-gaming-layout){:target="_blank"}

## Caveats

For some reason random games register '*FN*' button that was swapped to '*Control*' as a non-existent on most macs **right** '*Control*' button. 

It is easily mitigated in your game controls settings by remapping it to **left** '*Control*' button once, but you've been warned!


## Demo time!

{% include video id="8JWIsc-aldk" provider="youtube" %}


## Conclusion

That's it!

With the help of **MGL**, performing proper CS2 headshots while crouching using the left '*Control*' button as it is supposed to be with touchpad disabled on Mac has never been that easy!

Stay Frosty,

L.

