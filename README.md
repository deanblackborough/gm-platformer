# Game Maker Platformer (Starter project)

## Description

A basic platformer starter project for Game Maker. I'm creating this as a starting point for myself and my kids, I'll get all the basics working for them and then we can all create our own games.

I'm adding many more comments that I would normally, these are to explain what each section of code does so my kids can easily see which parts of the code they may need to modify.

I'm only building the basics of each feature, if you decide to use this starter project you are probably going to need to tweak things here and there.

I've working on `showDebug` options. The intention is if you set it to true in the create event for an object useful values and 
information will display to help explain what is happening - this is very much to do/work in progress.

## Current Progress

![Gif of Progress](current-progress.gif "Current progress animation")

### Key
- Grey - ground/solid objects
- Red - jump through platforms
- Blue - moving jump through platforms

## Controls

Check the `player/scripts/playerInput` script file, the controls should be what you expect though.

## Features

- Player moment - left, right, jump, ground dash & ground slide
- Gravity setting and terminal velocity setting
- Max jumps setting
- Jump through platforms
- Moving jump through platforms, move in x and/or y
- Player collision with ground 
- Player collision with jump through platforms
- Player collision with moving jump through platforms
- Player can drop through jump through platforms with down + jump
- Player can drop through moving jump through platforms with down + jump
- Player single ground dash (gravity disabled during dash) 
- Player single ground slide
- Ground slide and ground dash have a cooldown
- Player sprites for idle, running, jumping (up and down), dashing & slide
- Patrolling enemy base class - similar to moving platforms

## In progress

- Need to show debug values/ranges for moving platforms
- You can slide and then end up in a ground object

## How to run

- Download Game Maker
- Download the Project
- Open the Project in Game Maker and press play

## Example usage

Check out a game my Son is building using this starter kit [here](https://github.com/jackblackborough/platformer-starter)

## Bugs & issues
- If a moving jump through platform is moving in x and y there is a little player wobble when the platform moves in positive x and y
- You can get stuck if you are right at the edge of a moving platform and connect with a ground object

## Credits

Player character is by https://zegley.itch.io/ - check his page for this asset [here](https://zegley.itch.io/2d-platformermetroidvania-asset-pack)
