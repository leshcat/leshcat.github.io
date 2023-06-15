---
layout: single
title:  "Get back on Track: Dev Containers"
date:   2023-06-15
categories: posts
tags: devops docker dev containers development

toc: true
toc_sticky: true
toc_label: Table of Contents

excerpt: >-
  Recently I 've decided to post a new article. Naturally my blogging environment got outdated.
  Upgrade to the current version or ... else?
---
## Preamble

{:style="text-align:center;"}
![dev-containers-logo](/assets/images/dev-containers/dev-containers.png){: width="50%"}

Welcome back!

Woah, Time flies! Two years passed since my last article and at some point I have decided to continue sharing my thoughts and knowledge.

Obviously my setup with Ruby, Jekyll, its plugins and gems got outdated that effectively locked me from simply posting the articles.

Total Upgrade? Sure, that is pretty natural desire so i tried it in a first place on my local machine.

Just to learn that it's not that trivial when running Apple Silicon: Jekyll, its plugins, Ruby and Gems installation shown inconsistencies, loading wrong arch types and overall upgrade process became far more painful that it should be.

Plus, even when resolved, solution wasn't really portable across my machines. What can be done? 

And that's where Dev Containers came to the rescue!

-----

## The Dev Containers

Taken from [official website](https://containers.dev/){:target="_blank"}: 

"A Development Containers (or Dev Containers for short) allows you to use a **container** as a full-featured development environment.
It can be used to **run an application**, to separate tools, libraries, or runtimes needed for working with a codebase, and to aid in continuous integration and testing. 
Dev containers can be **run locally** or remotely, in a private or public cloud."

In other words, thats your tiny "local machine" that specifically holds only the tools and libs you need for your development, encased in Docker container. 

Lets give it a shot!

### What do you need

In essence, all you need is to:

* Install any Docker Engine provider on your local machine, free [Rancher Desktop](https://rancherdesktop.io/){:target="_blank"} will do

* Install `Dev Containers` plugin for VSCode:

  ![dev-containers-vsc-plugin](/assets/images/dev-containers/dev-containers-vsc-plugin.png)

* Create basic configuration for Dev Containers: [configuration example](https://github.com/leshcat/leshcat.github.io/blob/master/.devcontainer/devcontainer.json){:target="_blank"}

* Create Dockerfile that will download and install all tools and libs you need for your project on the base image, [here is mine as example](https://github.com/leshcat/leshcat.github.io/blob/master/Dockerfile){:target="_blank"}

You can always refer to official [getting started guide](https://code.visualstudio.com/docs/devcontainers/tutorial){:target="_blank"} for more information.

## Demo time!

{% include video id="ASio3klhC7A" provider="youtube" %}

## Conclusion

As a result of using Dev Containers, we 've got an immutable and portable dev environment that thanks to Docker isolation does not interfere with others or host system. :wink:

Stay Frosty,

L.
