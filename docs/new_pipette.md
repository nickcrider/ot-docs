# Using Pipettes

When writing a protocol, you must inform the Protocol API about the
pipettes you will be using on your OT-2. The Protocol API then creates
software objects called `InstrumentContext`, that represent the attached pipettes.

Pipettes are loaded into a specific mount (`'left'` or `'right'`) on the
OT-2 using the function `ProtocolContext.load_instrument()` from the `ProtocolContext` class.
This will return an `InstrumentContext` object. See [Building Block Commands](new_atomic_commands.md)
 and [Complex Commands](new_complex_commands.md) for liquid handling commands from the
`InstrumentContext` class.

## Loading A Pipette

Pipettes are specified in a protocol using the method
`ProtocolContext.load_instrument()`.
This method requires the model of the instrument to load, the mount to
load it in, and (optionally) a list of associated tipracks:

```python
from opentrons import protocol_api

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    # Load a P50 multi on the left slot
    left = protocol.load_instrument('p50_multi', 'left')
    # Load a P1000 Single on the right slot, with two racks of tips
    tiprack1 = protocol.load_labware('opentrons_96_tiprack_1000ul', 1)
    tiprack2 = protocol.load_labware('opentrons_96_tiprack_1000ul', 2)
    right = protocol.load_instrument('p1000_single', 'right',
                                     tip_racks=[tiprack1, tiprack2])
```

_New in version 2.0_

!!! Caution
    When you load a pipette in a protocol, you inform the OT-2 that you want
    the specified pipette to be present. Even if you do not use the pipette
    anywhere else in your protocol, the Opentrons App and the OT-2 will not
    let your protocol proceed until all pipettes loaded with
    `load_instrument` are attached to the OT-2.

## Pipette Models

This table lists the model names, which are passed to
`load_instrument()`,
for each model of pipette sold by Opentrons.

| Pipette           | Range         | Model Name            |
| ----------------- | ------------- | --------------------- |
| P20 Single GEN2   | 1 - 20 µL     | `'p20_single_gen2'`   |
| P300 Single GEN2  | 20 - 300 µL   | `'p300_single_gen2'`  |
| P1000 Single GEN2 | 100 - 1000 µL | `'p1000_single_gen2'` |
| P300 Multi GEN2   | 20-300 µL     | `'p300_multi_gen2'`   |
| P20 Multi GEN2    | 1-20 µL       | `'p20_multi_gen2'`    |
| P10 Single        | 1 - 10 µL     | `'p10_single'`        |
| P10 Multi         | 1 - 10 µL     | `'p10_multi'`         |
| P50 Single        | 5 - 50 µL     | `'p50_single'`        |
| P50 Multi         | 5 - 50 µL     | `'p50_multi'`         |
| P300 Single       | 30 - 300 µL   | `'p300_single'`       |
| P300 Multi        | 30 - 300 µL   | `'p300_multi'`        |
| P1000 Single      | 100 - 1000 µL | `'p1000_single'`      |

## Using Multi-Channel Pipettes

All building block and advanced commands work with both single-channel
(like `'p20_single_gen2'`) and multi-channel (like `'p20_multi_gen2'`)
pipettes. To keep the interface to the Opentrons API consistent between
single and multi-channel pipettes, commands treat the *backmost channel*
(furthest from the door) of a multi-channel pipette as the location of
the pipette. Location arguments to building block and advanced commands
are specified for the backmost channel. This also means that offset
changes (such as `Well.top()` or `Well.bottom()`) can be applied to the
single specified well, and each channels of the pipette will be at the
same position relative to the well that it is over.

Because there is only one motor in a multi-channel pipette,
multi-channel pipettes will always aspirate and dispense on all channels
simultaneously.

For instance, to aspirate from the first column of a 96-well plate you
would write:

```python
from opentrons import protocol_api

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    # Load a tiprack for 300uL tips
    tiprack1 = protocol.load_labware('opentrons_96_tiprack_300ul', 1)
    # Load a wellplate
    plate = protocol.load_labware('corning_96_wellplate_360ul_flat')

    # Load a P300 Multi GEN2 on the right mount
    right = protocol.load_instrument(
        'p300_multi_gen2', 'right', tip_rack=tiprack1)

    # Specify well A1 for pick_up_tip. The backmost channel of the
    # pipette moves to A1, which means the rest of the wells are above the
    # rest of the wells in column 1.
    right.pick_up_tip(tiprack1['A1'])

    # Similarly, specifying well A2 for aspirate means the pipette will
    # position its backmost channel over well A2, and the rest of the
    # pipette channels are over the rest of the wells of column 1
    right.aspirate(300, plate['A2'])

    # Dispense into column 3 of the plate with all 8 channels of the
    # pipette at the top of their respective wells
    right.dispense(300, plate['A3'].top())
```

In general, you should specify wells in the first row of a labware when
you are using multi-channel pipettes. One common exception to this rule
is when using 384-well plates. The spacing between the wells in a
384-well plate and the space between the nozzles of a multi-channel
pipette means that a multi-channel pipette accesses every other well in
a column. Specifying well A1 accesses every other well starting with the
first (rows A, C, E, G, I, K, M, and O); specifying well B1 similarly
accesses every other well, but starting with the second (rows B, D, F,
H, J, L, N, and P).

```python
from opentrons import protocol_api

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    # Load a tiprack for 300uL tips
    tiprack1 = protocol.load_labware('opentrons_96_tiprack_300ul', 1)
    # Load a wellplate
    plate = protocol.load_labware('corning_384_wellplate_112ul_flat')

    # Load a P300 Multi GEN2 on the right mount
    right = protocol.load_instrument(
        'p300_multi_gen2', 'right', tip_rack=tiprack1)

    # pick up a tip in preparation for aspiration
    right.pick_up_tip()

    # Aspirate from wells A1, C1, E1, G1, I1, K1, M1, and O1
    right.aspirate(300, plate['A1'])
    # Dispense in wells B1, D1, F1, H1, J1, L1, N1, and P1
    right.dispense(300, plate['B1'])
```

This pattern of access applies to both building block commands and
advanced commands.



## Tip Racks & Tip Tracking

When you load a pipette, you can optionally specify a list of tip racks
you will use to supply the pipette. This is done with the optional
parameter `tip_racks` to
`ProtocolContext.load_instrument()`.
This parameter accepts a *list* of tiprack labware objects, allowing you
to specify as many tipracks as you want. Associating tipracks with your
pipette allows for automatic tip tracking throughout your protocol. This
removes the need to specify tip locations in
`InstrumentContext.pick_up_tip()`.

For instance, in this protocol you can see the effects of specifying
tipracks:

```python
from opentrons import protocol_api

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    tiprack_left = protocol.load_labware('opentrons_96_tiprack_300ul', '1')
    tiprack_right = protocol.load_labware('opentrons_96_tiprack_300ul', '2')
    left_pipette = protocol.load_instrument('p300_single', 'left')
    right_pipette = protocol.load_instrument(
        'p300_multi', 'right', tip_racks=[tiprack_right])

    # You must specify the tip location for the left pipette, which was
    # loaded without specifying tip_racks
    left_pipette.pick_up_tip(tiprack['A1'])
    left_pipette.drop_tip()

    # And you have to do it every time you call pick_up_tip, doing all
    # your own tip tracking
    left_pipette.pick_up_tip(tiprack['A2'])
    left_pipette.drop_tip()
    left_pipette.pick_up_tip(tiprack['A3'])
    left_pipette.drop_tip()

    # Since you specified tip_racks when loading the right pipette, it will
    # automatically pick up from A1 of its associated tiprack
    right_pipette.pick_up_tip()
    right_pipette.drop_tip()

    # And further calls to pick_up_tip will automatically progress through
    # the tips in the rack
    right_pipette.pick_up_tip()
    right_pipette.drop_tip()
    right_pipette.pick_up_tip()
    right_pipette.drop_tip()
```

This is further discussed in [Building Block Commands](new_atomic_commands.md) and [Complex Commands](new_complex_commands.md).

_New in version 2.0_

