# Utility Commands

This section describes some useful commands that help control the flow 
of your protocol, or help interact with the OT-2.

## Move To

You can use `move_to()` to move a pipette to any location on the deck.

For example, you can move to the first tip in your tip rack:

```python
pipette.move_to(tiprack['A1'].top())
```

Unlike commands that require labware, like
[Aspirate](liquid_control.md#aspirate) or
[Dispense](liquid_control.md#dispense),
`move_to()` deals with `Location` instances,
which combine positions in [Deck Coordinates](../new_protocol_api.md#deck-coordinates) and associated `Labware`
instances. You don't have to create them yourself; this is what is
returned from methods such as `Well.top()` and `Well.bottom()`. It
does mean, however, that you can't move to a well directly; you must
use `Well.top()` or build a `Location` yourself.

You can also specify at what height you would like the robot to move to
inside of a location using `Well.top()`
and `Well.bottom()` methods on that
location (more on these methods and others like them in the
[Specifying Position Within Wells](../labware/positioning.md) section):

```python
pipette.move_to(plate['A1'].bottom())  # move to the bottom of well A1
pipette.move_to(plate['A1'].top())     # move to the top of well A1
pipette.move_to(plate['A1'].bottom(2)) # move to 2mm above the bottom of well A1
pipette.move_to(plate['A1'].top(-2))   # move to 2mm below the top of well A1
```

The above commands will cause the robot's head to first move upwards,
then over to above the target location, then finally downwards until the
target location is reached. If instead you would like the robot to move
in a straight line to the target location, you can set the movement
strategy to `'direct'`.

```python
pipette.move_to(plate['A1'].top(), force_direct=True)
```

!!! Warning
    Moving without an arc will run the risk of colliding with things on your
    deck. Be **very** careful when using this option.


Usually the above option is useful when moving inside of a well. Take a
look at the below sequence of movements, which first move the head to a
well, and use 'direct' movements inside that well, then finally move
on to a different well.

```python
pipette.move_to(plate['A1'].top())
pipette.move_to(plate['A1'].bottom(1), force_direct=True)
pipette.move_to(plate['A1'].top(-2), force_direct=True)
pipette.move_to(plate['A2'].top())
```

_New in version 2.0_

## Delay

Sometimes you need to pause your protocol, for instance to wait for
something to incubate. You can use
`delay()` to pause your
protocol for a specific amount of time. `delay()` is a method of
`ProtocolContext` since it concerns
the protocol and the OT-2 as a whole.

The value passed into `delay()` is the number of minutes or seconds the
OT-2 will wait until moving on to the next command.

```python
protocol.delay(seconds=2)             # pause for 2 seconds
protocol.delay(minutes=5)             # pause for 5 minutes
protocol.delay(minutes=5, seconds=2)  # pause for 5 minutes and 2 seconds
```

## User-Specified Pause

The method `ProtocolContext.pause()`
will pause protocol execution at a specific step. You can resume by
pressing 'resume' in your Opentrons App. You can optionally specify a
message that will be displayed in the Opentrons App when protocol
execution pauses.

```python
from opentrons import protocol_api

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    # The start of your protocol goes here...

    # The OT-2 stops here until you press resume. It will display the message in
    # the Opentrons App. You do not need to specify a message, but it makes things
    # more clear.
    protocol.pause('Time to take a break')
```

_New in version 2.0_

## Homing

You can manually request that the OT-2 home during protocol execution.
This is typically not necessary; however, if at any point you will
disengage motors or move the gantry with your hand, you may want to
command a home afterwards.

To home the entire OT-2, you can call
`ProtocolContext.home()`.

To home a specific pipette's Z axis and plunger, you can call
`InstrumentContext.home()`.

To home a specific pipette's plunger only, you can call
`InstrumentContext.home_plunger()`.

None of these functions take any arguments:

```python
from opentrons import protocol_api, types

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    pipette = protocol.load_instrument('p300_single', 'right')
    protocol.home() # Homes the gantry, z axes, and plungers
    pipette.home()  # Homes the right z axis and plunger
    pipette.home_plunger() # Homes the right plunger
```

_New in version 2.0_

## Comment

The method `ProtocolContext.comment()`
lets you display messages in the Opentrons App during protocol
execution:

```python
from opentrons import protocol_api, types

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    protocol.comment('Hello, world!')
```

_New in version 2.0_

## Control and Monitor Robot Rail Lights

You can turn the robot rail lights on or off in the protocol using
`ProtocolContext.set_rail_lights()`:

```python
from opentrons import protocol_api

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    # turn on robot rail lights
    protocol.set_rail_lights(True)

    # turn off robot rail lights
    protocol.set_rail_lights(False)
```

_New in version 2.5_

You can also check whether the rail lights are on or off in the protocol
using `ProtocolContext.rail_lights_on`:

```python
protocol.rail_lights_on  # returns True when the lights are on,
                         # False when the lights are off
```

_New in version 2.5_


## Monitor Robot Door

The door safety switch feature flag has been added to the OT-2 software
since the 3.19.0 release. Enabling the feature flag allows your robot to
pause a running protocol and prohibit the protocol from running when the
robot door is open.

![image](../assets/images/feature_flags/door_safety_switch.png)

You can also check whether or not the robot door is closed at a specific
point in time in the protocol using
`ProtocolContext.door_closed`:

```python
protocol.door_closed  # return True when the door is closed,
                      # False when the door is open
```

!!! Note
    Both the top window and the front door must be closed in order for the
    robot to report the door is closed.


!!! Warning
    If you chose to enable the door safety switch feature flag, you should
    only use `ProtocolContext.door_closed`
    as a form of status check, and should not use it to control robot
    behavior. If you wish to implement custom method to pause or resume
    protocol using `ProtocolContext.door_closed`, make sure you have first disabled the feature flag.

_New in version 2.5_
