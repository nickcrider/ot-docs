# Specifying Position Within Wells

The functions listed in the [Accessing Wells in Labware](accessing.md) section return objects (or lists, lists of lists,
dictionaries, or dictionaries of lists of objects) representing wells.
These are `opentrons.protocol_api.labware.Well` objects. `Well`
objects have some useful methods on them, which allow you to more
closely specify the location to which the OT-2 should move *inside* a
given well.

Each of these methods returns an object called a
`opentrons.types.Location`, which
encapsulates a position in deck coordinates (see
[Deck Coordinates](../new_protocol_api.md#deck-coordinates)) and a well
with which it is associated. This lets you further manipulate the
positions returned by these methods. All
`InstrumentContext` methods that
involve positions accept these `Location` objects.

## Position Modifiers

### Top

The method `Well.top()` returns a
position at the top center of the well. This is a good position to use
for [Blow Out](../new_atomic_commands.md#blow-out) or any other operation
where you don't want to be contacting the liquid. In addition,
`Well.top()` takes an optional argument
`z`, which is a distance in mm to move relative to the top vertically
(positive numbers move up, and negative numbers move down):

``` python
plate['A1'].top()     # This is the top center of the well
plate['A1'].top(z=1)  # This is 1mm above the top center of the well
plate['A1'].top(z=-1) # This is 1mm below the top center of the well
```

_New in version 2.0_

### Bottom

The method `Well.bottom()` returns a
position at the bottom center of the well. This is a good position to
start when considering where to aspirate, or any other operation where
you want to be contacting the liquid. In addition,
`Well.bottom()` takes an optional
argument `z`, which is a distance in mm to move relative to the bottom
vertically (positive numbers move up, and negative numbers move down):

``` python
plate['A1'].bottom()     # This is the bottom center of the well
plate['A1'].bottom(z=1)  # This is 1mm above the bottom center of the well
plate['A1'].bottom(z=-1) # This is 1mm below the bottom center of the well.
                         # this may be dangerous!
```

!!! Warning
    Negative `z` arguments to `Well.bottom()` may cause the tip to collide with the bottom of the well.
    The OT-2 has no sensors to detect this, and if it happens, the pipette
    that collided will be too high in z until the next time it picks up a
    tip.


!!! Note
    If you are using this to change the position at which the robot does
    [Aspirate](../new_atomic_commands.md#aspirate) or
    [Dispense](../new_atomic_commands.md#dispense) throughout the protocol,
    consider setting the default aspirate or dispense offset with
    `InstrumentContext.well_bottom_clearance()` (see [Default Positions Within Wells](positioning.md)).


_New in version 2.0_

### Center

The method `Well.center()` returns a
position centered in the well both vertically and horizontally. This can
be a good place to start for precise control of positions within the
well for unusual or custom labware.

``` python
plate['A1'].center() # This is the vertical and horizontal center of the well
```

_New in version 2.0_

## Manipulating Positions

The objects returned by the position modifier functions are all
instances of `opentrons.types.Location`, which are [named
tuples](https://docs.python.org/3/library/collections.html#collections.namedtuple)
representing the combination of a point in space (another named tuple)
and a reference to the associated `Well` (or `Labware`, or slot
name, depending on context).

To adjust the position within a well, you can use
`Location.move()`. Pass it a
`opentrons.types.Point` representing
a 3-dimensional offset. It will return a new location, representing the
original location with that offset applied.

For example:

```python
from opentrons import types

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol):
     plate = protocol.load_labware(
        'corning_24_wellplate_3.4ml_flat', slot='1')

     # Get the center of well A1.
     center_location = plate['A1'].center()

     # Get a location 1 mm right, 1 mm back, and 1 mm up from the center of well A1.
     adjusted_location = center_location.move(types.Point(x=1, y=1, z=1))

     # Move to 1 mm right, 1 mm back, and 1 mm up from the center of well A1.
     pipette.move_to(adjusted_location)
```

_New in version 2.0_
