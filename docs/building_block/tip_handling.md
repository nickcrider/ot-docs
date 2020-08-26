# Tip Handling

When the OT-2 handle liquids with, it constantly exchanges old, used
tips for new ones to prevent cross-contamination between wells. The API 
will automatically track the tips used and remaining so you don't have to 
worry about keeping track of them yourself.

Tip handling uses the functions
`InstrumentContext.pick_up_tip()`,
`InstrumentContext.drop_tip()`, and
`InstrumentContext.return_tip()`.

## Pick Up Tip

Before any liquid handling can be done, your pipette must have a tip on
it. The command `pick_up_tip()` will move the pipette over to the specified tip, then press
down into it to create a seal. The below example picks up the tip
at location `'A1'` of the tiprack previously loaded in slot 3.

``` python hl_lines="9"
from opentrons import protocol_api

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    tiprack = protocol.load_labware('corning_96_wellplate_360ul_flat', 2)
    plate = protocol.load_labware('opentrons_96_tiprack_300ul', 3)
    pipette = protocol.load_instrument('p300_single_gen2', mount='left')
    pipette.pick_up_tip(tiprack['A1'])
```

If you have associated a tiprack with your pipette like you saw in the
[first example](../get_started.md) or then you can simply call:

``` python
pipette.pick_up_tip()
```

This will use the next available tip from the list of tipracks passed in
to the `tip_racks` argument of
`load_instrument()`.

_New in version 2.0_

## Drop Tip

Once finished with a tip, the pipette will remove the tip when we call
`drop_tip()`. You can
specify where to drop the tip by passing in a location. The below
example drops the tip back at its original location on the tip rack. If
no location is specified, the OT-2 will drop the tip in the fixed trash
in slot 12 of the deck.

```python
pipette.pick_up_tip()
pipette.drop_tip(tiprack['A1'])  # drop back in A1 of the tiprack
pipette.pick_up_tip()
pipette.drop_tip()  # drop in the fixed trash on the deck
```

_New in version 2.0_

## Return Tip

To return the tip to the original location, you can call
`return_tip()`. The example below will automatically return 
the tip to `'A3'` on the tip rack.

```python
pipette.pick_up_tip(tiprack['A3'])
pipette.return_tip()
```
!!! Note
    The behavior of `return_tip()` was changed in API Version 2.2 
    to incorporate tip tracking. In prior versions, `return_tip()` 
    would not advance the tip tracking logic.
    
    === "In API Version 2.2 or above"

        ```python
        tip_rack = protocol.load_labware(
                'opentrons_96_tiprack_300ul', 1)
        pipette = protocol.load_instrument(
            'p300_single_gen2', mount='left', tip_racks=[tip_rack])

        pipette.pick_up_tip() # picks up tip_rack:A1
        pipette.return_tip()
        pipette.pick_up_tip() # picks up tip_rack:B1
        ```

    === "In API Versions 2.0 and 2.1"

        ```python
        tip_rack = protocol.load_labware(
                'opentrons_96_tiprack_300ul', 1)
        pipette = protocol.load_instrument(
            'p300_single_gen2', mount='left', tip_racks=[tip_rack])

        pipette.pick_up_tip() # picks up tip_rack:A1
        pipette.return_tip()
        pipette.pick_up_tip() # picks up tip_rack:A1
        ```

## Iterating Through Tips

For this section, instead of using the protocol defined earlier, consider
this setup:

```python
from opentrons import protocol_api

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    plate = protocol.load_labware(
        'corning_96_wellplate_360ul_flat', 2)
    tip_rack_1 = protocol.load_labware(
        'opentrons_96_tiprack_300ul', 3)
    tip_rack_2 = protocol.load_labware(
        'opentrons_96_tiprack_300ul', 4)
    pipette = protocol.load_instrument(
        'p300_single_gen2', mount='left', tip_racks=[tip_rack_1, tip_rack_2])
```

This loads a [Corning 96 Well
Plate](https://labware.opentrons.com/corning_96_wellplate_360ul_flat) in
slot 2 and two [Opentrons 300ul
Tiprack](https://labware.opentrons.com/opentrons_96_tiprack_300ul) in
slots 3 and 4 respectively, and uses a P300 Single GEN2 pipette.

When a list of tip racks is associated with a pipette in its `tip_racks`
argument, the pipette will automatically pick up the next unused tip in
the list whenever you call `pick_up_tip()`. The
pipette will first use all tips in the first tiprack, then move on to
the second, and so on:

```python
pipette.pick_up_tip()  # picks up tip_rack_1:A1
pipette.return_tip()
pipette.pick_up_tip()  # picks up tip_rack_1:A2
pipette.drop_tip()     # automatically drops in trash

# use loop to pick up tips tip_rack_1:A3 through tip_rack_2:H12
tips_left = 94 + 96 # add up the number of tips leftover in both tipracks
for _ in range(tips_left):
    pipette.pick_up_tip()
    pipette.return_tip()
```

If you try to `pick_up_tip()` again when all the tips have been used, the Protocol API
will show you an error:

```python
# this will raise an exception if run after the previous code block
pipette.pick_up_tip()
```

To change the location of the first tip used by the pipette, you can use
`starting_tip`:

```python
pipette.starting_tip = tip_rack_1.well('C3')
pipette.pick_up_tip()  # pick up C3 from "tip_rack_1"
pipette.return_tip()
```

To reset the tip tracking, you can call
`reset_tipracks()`:

```python
# Use up all tips
for _ in range(96+96):
     pipette.pick_up_tip()
     pipette.return_tip()

# Reset the tip tracker
pipette.reset_tipracks()

# Picks up a tip from well A1 of the first tip rack
pipette.pick_up_tip()
```

_New in version 2.0_