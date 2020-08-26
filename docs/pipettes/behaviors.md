# Modifying Pipette Behaviors

The OT-2 has many default behaviors that are you may want to
change for a particular experiment. This section details those
behaviors and how to change them.

## Plunger Flow Rates

Opentrons pipettes aspirate or dispense at different rates. These flow
rates can be changed on a loaded `InstrumentContext` at any time, in
units of µL/sec by altering `InstrumentContext.flow_rate`. This
has the following attributes:

-   `InstrumentContext.flow_rate.aspirate`: The aspirate flow rate, in
    µL/s
-   `InstrumentContext.flow_rate.dispense`: The dispense flow rate, in
    µL/s
-   `InstrumentContext.flow_rate.blow_out`: The blow out flow rate, in
    µL/s

Each of these attributes can be altered without affecting the others:

```python
from opentrons import protocol_api

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    tiprack = protocol.load_labware('opentrons_96_tiprack_300ul', '1')
    pipette = protocol.load_instrument(
        'p300_single', 'right', tip_racks=[tiprack])
    plate = protocol.load_labware('opentrons_96_tiprack_300ul', 3)
    pipette.pick_up_tip()

    # Aspirate at the default flowrate of 150 ul/s
    pipette.aspirate(50, plate['A1'])
    # Dispense at the default flowrate of 300 ul/s
    pipette.dispense(50, plate['A1'])

    # Change default aspirate speed to 50ul/s, 1/3 of the default
    pipette.flow_rate.aspirate = 50
    # this aspirate will be at 50ul/s
    pipette.aspirate(50, plate['A1'])
    # this dispense will be the default 300 ul/s
    pipette.dispense(50, plate['A1'])

    # Slow down dispense too
    pipette.flow_rate.dispense = 50
    # This is still at 50 ul/s
    pipette.aspirate(50, plate['A1'])
    # This is now at 50 ul/s as well
    pipette.dispense(50, plate['A1'])

    # Also slow down the blow out flowrate from its default
    pipette.flow_rate.blow_out = 100
    pipette.aspirate(50, plate['A1'])
    # This will be much slower
    pipette.blow_out()

    pipette.drop_tip()
```

_New in version 2.0_

## Default Positions Within Wells

By default, the OT-2 will aspirate and dispense 1mm above the bottom of
a well. This may not be suitable for some labware geometries, liquids,
or experimental protocols. While you can specify the exact location
within a well in direct calls to
`InstrumentContext.aspirate()` and
`.InstrumentContext.dispense()` (see the
[Specifying Position Within Wells](new_labware.md#specifying-position-within-wells) section), you
cannot use this method in complex commands like
`InstrumentContext.transfer()`, and it
can be cumbersome to specify the position every time.

Instead, you can use the attribute
`InstrumentContext.well_bottom_clearance` to specify the height above the bottom of a well to either
aspirate or dispense:

1)  Editing `pipette.well_bottom_clearance.aspirate` changes the height
    of aspiration
2)  Editing `pipette.well_bottom_clearance.dispense` changes the height
    of dispense

Changing these attributes will affect *all* aspirates and dispenses,
even those executed as part of a transfer.

```python
from opentrons import protocol_api, types

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    tiprack = protocol.load_labware('opentrons_96_tiprack_300ul', '1')
    pipette = protocol.load_instrument('p300_single', 'right')
    plate = protocol.load_labware('opentrons_96_tiprack_300ul', 3)
    pipette.pick_up_tip()

    # Aspirate 1mm above the bottom of the well
    pipette.aspirate(50, plate['A1'])
    # Dispense 1mm above the bottom of the well
    pipette.dispense(50, plate['A1'])

    # Aspirate 2mm above the bottom of the well
    pipette.well_bottom_clearance.aspirate = 2
    pipette.aspirate(50, plate['A1'])
    # Still dispensing 1mm above the bottom
    pipette.dispense(50, plate['A1'])
    pipette.aspirate(50, plate['A1'])

    # Dispense high above the well
    pipette.well_bottom_clearance.dispense = 10
    pipette.dispense(50, plate['A1'])
```

_New in version 2.0_

### Gantry Speed

The OT-2's gantry usually moves as fast as it can given its
construction; this makes protocol execution faster and saves time.
However, some experiments or liquids may require slower, gentler
movements over protocol execution time. In this case, you can alter the
OT-2 gantry's speed when a specific pipette is moving by setting
`InstrumentContext.default_speed`.
This is a value in mm/s that controls the overall speed of the gantry.
Its default is 400 mm/s.

!!! Warning
    The default of 400 mm/s was chosen because it is the maximum speed
    Opentrons knows will work with the gantry. Your specific robot may be
    able to move faster, but you shouldn't make this value higher than the
    default without extensive experimentation.


```python
from opentrons import protocol_api, types

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    pipette = protocol.load_instrument('p300_single', 'right')
    # Move to 50mm above the front left of slot 5, very quickly
    pipette.move_to(protocol.deck.position_for('5').move(types.Point(z=50)))
    # Slow down the pipette
    pipette.default_speed = 100
    # Move to 50mm above the front left of slot 9, much more slowly
    pipette.move_to(protocol.deck.position_for('9').move(types.Point(z=50)))
```

_New in version 2.0_

### Per-Axis Speed Limits

In addition to controlling the overall speed of motions, you can set
per-axis speed limits for the OT-2's axes. Unlike the overall speed,
which is controlled per-instrument, axis speed limits take effect for
both pipettes and all motions. These can be set for the `X`
(left-and-right gantry motion), `Y` (forward-and-back gantry motion),
`Z` (left pipette up-and-down motion), and `A` (right pipette
up-and-down motion) using
`ProtocolContext.max_speeds`. This
works like a dictionary, where the keys are axes, assigning to a key
sets a max speed, and deleting a key or setting it to `None` resets that
axis's limit to the default:

```python
metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol):
    protocol.max_speeds['X'] = 50  # limit x axis to 50 mm/s
    del protocol.max_speeds['X']  # reset x axis limit
    protocol.max_speeds['A'] = 10  # limit a axis to 10 mm/s
    protocol.max_speeds['A'] = None  # reset a axis limit
```

You cannot set limits for the pipette plunger axes with this mechanism;
instead, set the flow rates or plunger speeds as described in
[Plunger Flow Rates](#plunger-flow-rates).

_New in version 2.0_

## GEN2 Pipette Backward Compatibility

GEN2 pipettes have different volume ranges than GEN1 pipettes. However,
each GEN2 pipette covers one or two GEN1 pipette volume ranges. For
instance, with a range of 1 - 20 µL, the P20 Single GEN2 covers the P10
Single GEN1 (1 - 10 µL). If your protocol specifies a GEN1 pipette but
you have a GEN2 pipette attached to your OT-2 with a compatible volume
range, you can still run your protocol. The OT-2 will consider the GEN2
pipette to have the same minimum volume as the GEN1 pipette, so any
advanced commands have the same behavior as before.

Specifically, the P20 GEN2s (single and multi) cover the entire P10 GEN1
range; the P300 Single GEN2 covers the entire P300 Single GEN1 range;
and the P1000 Single GEN2 covers the entire P1000 Single GEN1 range.

If you have a P50 Single specified in your protocol, there is no
automatic backward compatibility. If you want to use a GEN2 Pipette, you
must change your protocol to load either a P300 Single GEN2 (if you are
using volumes between 20 and 50 µL) or a P20 Single GEN2 (if you are
using volumes below 20 µL).

If your protocol specifies a pipette and you attach a compatible
pipette, the protocol will run, and the pipette will act the same as the
pipette specified in your protocol - altering parameters like its
minimum volume if necessary.

For instance, if your protocol specifies a P300 Multi, and you connect a
P300 Multi GEN2, the pipette will act like a P300 Multi - it will set
its minimum volume to 30 µL.