# Changelog

The complete changelog for the Costs to Expect REST API, our changelog follows the format defined at https://keepachangelog.com/en/1.0.0/

## vNext - DATE

### Added

- Added a delay variable (`startDelayMax`) to patrolling enemies - movement will being on a random frame between 0 and `startDelayMax` to give the enemies a little bit of variety.

### Changed

- Moved some create variables to the variables tab for objects to allow more individual control on each instance.

## v0.08 - 2024-12-21

### Added

- Added player activated jump through platforms - only active when the player is on them and they switch the spite - a delayed version will come in the future

## v0.07 - 2024-12-21

### Added

- Added a showDebug var to moving platforms and patrolling enemies - shows the limit of their movement

## v0.06 - 2024-12-21

### Added

- Base object for patrolling enemies

### Changed

- Updated the readme and added a link to my son's game which shows how to use this starter project

## v0.05 - 2024-08-06

### Changed

- Slide and dash travel a fixed distance
- Slide and dash have cooldowns
- Updated the player step event, liberal comments

### Fixed

- All falling states have the correct sprite

## v0.04.0 - 2024-08-04

### Added

- Added a simple following camera

### Changed

- Reworked platform movement, you now define in x or x the distance to move and the speed
- You can only dash and slide when on the ground
- Dash and slide are committed actions, you are locked in.

## v0.03.0 - 2024-08-04

### Added

- Added a simple following camera

## v0.02.0 - 2024-08-03

### Added

- Added a player dash, runs for x frames, disables gravity and resets after speed returns to normal

## v0.01.2 - 2024-08-03

### Fixed 

- Player collisions with ground in x when on a moving platform

## v0.01.1 - 2024-08-03

### Fixed 

- Moving platforms should no longer move you into ground above you.


## v0.01.0 - 2024-08-03

### Added

- Player moment - left, right, jump
- Gravity setting and terminal velocity setting
- Max jumps setting
- Moving jump through platforms, move in x and/or y
- Player collision with ground
- Player collision with jump through platforms
- Player collision with moving jump through platforms
- Players can drop through jump through platforms with down + jump
- Players can drop through moving jump through platforms with down + jump
- Player sprites for idle, running and jumping
