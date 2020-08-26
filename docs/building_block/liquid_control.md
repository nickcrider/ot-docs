# Liquid Handling

This section describes the `InstrumentContext`'s liquid-handling commands.

The examples in this section should be inserted in the following:

```python
metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol):
    tiprack = protocol.load_labware('corning_96_wellplate_360ul_flat', 2)
    plate = protocol.load_labware('opentrons_96_tiprack_300ul', 3)
    pipette = protocol.load_instrument('p300_single_gen2', mount='left', tip_racks=[tiprack])
    pipette.pick_up_tip()
    # example code goes here
```

This loads a [Corning 96 Well
Plate](https://labware.opentrons.com/corning_96_wellplate_360ul_flat) in
slot 2 and a [Opentrons 300ul
Tiprack](https://labware.opentrons.com/opentrons_96_tiprack_300ul) in
slot 3, and uses a P300 Single GEN2 pipette.

## Aspirate

To aspirate is to pull liquid up into the pipette's tip. When calling
`aspirate()` on a pipette, you can specify the volume to aspirate in µL, 
where to aspirate from, and how fast to aspirate liquid.

```python
pipette.aspirate(50, plate['A1'], rate=2.0)  # aspirate 50uL from plate:A1
```

Now the pipette's tip is holding 50 µL.

The `location` parameter is either a well (like `plate['A1']`) or a
position within a well, like the return value of `plate['A1'].bottom()`.

The `rate` parameter is a multiplication factor of the pipette's
default aspiration flow rate. The default aspiration flow rate for all
pipettes is in the [Defaults](../pipettes/defaults.md) section.

You can also simply specify the volume to aspirate, and not mention a
location. The pipette will aspirate from its current location (which we
previously set as `plate['A1'])`.

```python
pipette.aspirate(50)                     # aspirate 50uL from current position
```

Now our pipette's tip is holding 100 µL.

!!! Note
    In version 1 of this API, `aspirate()` (and `dispense()`) would inspect the
    types of the `volume` and `location` arguments and do the right thing if
    you specified only a location or specified location and volume out of
    order. In this and future versions of the Python Protocol API, this is
    no longer true. Like any other Python function, if you are specifying
    arguments by position without using their names, you must always specify
    them in order.

!!! Note
    By default, the OT-2 will move to 1mm above the bottom of the target
    well before aspirating. You can change this by using a well position
    function like `Well.bottom()` (see
    [Specifying Position Within Wells](../labware/positioning.md) every time you
    call `aspirate`, or - if you want to change the default throughout your
    protocol - you can change the default offset with
    `InstrumentContext.well_bottom_clearance` (see [Default Positions Within Wells](../pipettes/behaviors.md#default-positions-within-wells)). 


_New in version 2.0_

## Dispense

To dispense is to push out liquid from the pipette's tip. The usage of
`dispense()` in the
Protocol API is similar to
`aspirate()`, in that
you can specify volume in µL and location, or only volume.

```python
pipette.dispense(50, plate['B1'], rate=2.0) # dispense 50uL to plate:B1 at twice the normal rate
pipette.dispense(50)              # dispense 50uL to current position at the normal rate
```

The `location` parameter is either a well (like `plate['A1']`) or a
position within a well, like the return value of `plate['A1'].bottom`.

The `rate` parameter is a multiplication factor of the pipette's
default dispense flow rate. The default dispense flow rate for all
pipettes is in the [Defaults](../pipettes/defaults.md) section.

!!! Note
    By default, the OT-2 will move to 1mm above the bottom of the target
    well before dispensing. You can change this by using a well position
    function like `Well.bottom()` (see
    [Specifying Position Within Wells](../labware/positioning.md)) every time you
    call `dispense()`, or - if you want to change the default throughout your
    protocol - you can change the default offset with
    `InstrumentContext.well_bottom_clearance` (see [Default Positions Within Wells](../pipettes/behaviors.md#default-positions-within-wells)).


!!! Note
    In version 1 of this API, `dispense()` (and `aspirate()`) would inspect the
    types of the `volume` and `location` arguments and do the right thing if
    you specified only a location or specified location and volume out of
    order. In this and future versions of the Python Protocol API, this is
    no longer true. Like any other Python function, if you are specifying
    arguments by position without using their names, you must always specify
    them in order.

_New in version 2.0_

## Blow Out

To blow out is to push an extra amount of air through the pipette's
tip, to make sure that any remaining droplets are expelled.

When calling `blow_out()`, you can specify a location to blow out the remaining
liquid. If no location is specified, the pipette will blow out from its
current position.

```python
pipette.blow_out()            # blow out in current location
pipette.blow_out(plate['B3']) # blow out in current plate:B3
```

_New in version 2.0_

## Touch Tip

To touch tip is to move the pipette's currently attached tip to four
opposite edges of a well, to knock off any droplets that might be
hanging from the tip.

When calling `touch_tip()` on a pipette, you have the option to specify a location
where the tip will touch the inner walls.

`touch_tip()` can
take up to 4 arguments: `touch_tip(location, radius, v_offset, speed)`.

```python
pipette.touch_tip()            # touch tip within current location
pipette.touch_tip(v_offset=-2) # touch tip 2mm below the top of the current location
pipette.touch_tip(plate['B1']) # touch tip within plate:B1
pipette.touch_tip(plate['B1'], speed=100) # touch tip within plate:B1 at 100 mm/s
pipette.touch_tip(plate['B1'], # touch tip in plate:B1, at 75% of total radius and -2mm from top of well
                  radius=0.75,
                  v_offset=-2)
```

_New in version 2.0_

## Mix

To mix is to perform a series of `aspirate()` and `dispense()` commands in a
row on a single location. Instead of having to write those commands out
every time, you can call `mix()`.

The `mix` command takes up to three arguments:
`mix(repetitions, volume, location)`:

```python
# mix 4 times, 100uL, in plate:A2
pipette.mix(4, 100, plate.['A2'])
# mix 3 times, 50uL, in current location
pipette.mix(3, 50)
# mix 2 times, pipette's max volume, in current location
pipette.mix(2)
```

!!! Note
    In API Versions 2.2 and earlier, mixes consist of aspirates and then
    immediate dispenses. In between these actions, the pipette moves up and
    out of the target well. In API Version 2.3 and later, the pipette will
    not move between actions.


_New in version 2.0_

## Air Gap

When dealing with certain liquids, you may need to aspirate air after
aspirating the liquid to prevent it from sliding out of the pipette's
tip. A call to `air_gap()` with a volume in µL will aspirate that much air into the
tip. `air_gap()` takes up to two arguments: `air_gap(volume, height)`:

```python
pipette.aspirate(100, plate['B4'])
pipette.air_gap(20)
pipette.drop_tip()
```

_New in version 2.0_
