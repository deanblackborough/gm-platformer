# Game Maker 2 Platformer (Starter project)

## Description

A basic platformer starter project for Game Maker. I'm creating this as a starting point for myself and my kids, I'll get all the basics working for them and then we can all create our own platformers.

I'm adding many more comments than I would to my own projects, these are to explain what each section of the code is doing so my kids can easily see which parts of the code they may need to modify if they want to change a behaviour.

I'm only building the basics of each feature, if you decide to use this starter project you are going to need to tweak things here and there, there are variables to adjust the feel - check out `player/create`

You can see what my eldest is doing on his [profile](https://github.com/jackblackborough) - it will gives you an idea on how to use the Project. You should put your stuff in a `MyGame` or similar group, extend the base objects and inherit the create event.

## Current Progress

![Gif of Progress](current-progress.gif "Current progress animation")

### Key
- Grey - ground, solid objects
- Red & translucent - jump through platform
- Red & solid - platform
- Blue & translucent - moving jump through platform
- Blue & solid - moving solid platform (Dev in progress)
- Green & translucent - player activated jump through platform
- Green & solid - player activated platform (Dev in progress)
- Yellow and Black - Kill plane

## Controls

Check the `player/scripts/playerInput` script file, the controls should be what you expect.

## Features

- Player moment - left, right, jump, ground dash & ground slide
- Gravity setting and terminal velocity setting
- Max jumps setting
- Jump through platforms
- Solid platforms
- Moving jump through platforms, move in x and/or y, set speed a target
- Player activated jump through platforms
- Player collision with ground 
- Player collision with jump through platforms
- Player collision with moving jump through platforms
- Player can drop through jump through platforms with down + jump
- Player can drop through moving jump through platforms with down + jump
- Player single ground dash (gravity disabled during dash) 
- Player single ground slide
- Ground slide and ground dash have a cooldown
- Player sprites for idle, running, jumping (up and down), dashing & slide
- Patrolling enemy base class - similar to moving platforms, set speed, target and start delay
- `showDebug` variables on many game objects to show movements and targets etc.
- Enemy damage and collision detection
- Kill plane
- Player death animation plays on death and all input is ignored.

## In Progress
### Solid moving platforms
- You can jump up through them
- The collision is just against the top of the box
### Player activated platform
- No game logic

## Next
- Timer on player activated platforms
- Melee combat

## How to run

- Download Game Maker
- Download the Project
- Open the Project in Game Maker and press play

## Bugs & issues

There are three know bugs currently - these will be fixed at some point

- You can slide into a solid object, well finish in one (fix in progress)

## Credits

Player character is by https://zegley.itch.io/ - check his page for this asset [here](https://zegley.itch.io/2d-platformermetroidvania-asset-pack)
