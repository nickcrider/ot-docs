# Overview

Building block, or basic, commands are the smallest individual actions
that can be completed on an OT-2. For example, the complex command
`transfer` (see [Complex Commands](new_complex_commands.md))
executes a series of `pick_up_tip()`, `aspirate()`, `dispense()` and
`drop_tip()` basic commands.

The examples here will use a [Corning 96 Well Plate](https://labware.opentrons.com/corning_96_wellplate_360ul_flat) 
in slot 2 and a [Opentrons 300 µL Tiprack](https://labware.opentrons.com/opentrons_96_tiprack_300ul) 
in slot 3, and uses a P300 Single GEN2 pipette. Or, in code:

``` python
from opentrons import protocol_api

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    tiprack = protocol.load_labware('corning_96_wellplate_360ul_flat', 2)
    plate = protocol.load_labware('opentrons_96_tiprack_300ul', 3)
    pipette = protocol.load_instrument('p300_single_gen2', mount='left')
    # the example code goes here, inside the run function
```

In the following sections we'll cover:

- [Tip handling](building_block/tip_handling.md), like `pick_up_tip()` 
- [Liquid handling](building_block/liquid_control.md), like `aspirate()` and `dispense()`
- [Utility commands](building_block/utility.md), like `pause()`





