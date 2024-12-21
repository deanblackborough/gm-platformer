# Game Maker Platformer (Starter project)

## Description

A basic platformer starter project for Game Maker. I'm creating this as a starting point for myself and my kids, I'll get all the basics working for them and then we can all create our own games.

I'm adding many more comments than I would normally, these are to explain what each section of code does so my kids can easily see which parts of the code they may need to modify.

I'm only building the basics of each feature, if you decide to use this starter project you are probably going to need to tweak things here and there.

Check out a game my Son is building using this starter kit [here](https://github.com/jackblackborough/platformer-starter) - it will gives you an idea on how to use the Project - you should put your stuff in a `MyGame` group and extend the base objects and inherit the create event to make changes to sprites.

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
- Moving jump through platforms, move in x and/or y, set speed a target
- Player collision with ground 
- Player collision with jump through platforms
- Player collision with moving jump through platforms
- Player can drop through jump through platforms with down + jump
- Player can drop through moving jump through platforms with down + jump
- Player single ground dash (gravity disabled during dash) 
- Player single ground slide
- Ground slide and ground dash have a cooldown
- Player sprites for idle, running, jumping (up and down), dashing & slide
- Patrolling enemy base class - similar to moving platforms, set speed and target
- Added `showDebug` variable for moving platforms and patrolling enemies to show the movement limits

## How to run

- Download Game Maker
- Download the Project
- Open the Project in Game Maker and press play

## Bugs & issues

There are three know bugs currently - these will be fixed at some point

- If a moving jump through platform is moving in x and y there is a little player wobble when the platform moves in positive x and y
- You can get stuck if you are right at the edge of a moving platform and connect with a ground object
- You can dash and slide at the same time if you are quick

## Credits

Player character is by https://zegley.itch.io/ - check his page for this asset [here](https://zegley.itch.io/2d-platformermetroidvania-asset-pack)
