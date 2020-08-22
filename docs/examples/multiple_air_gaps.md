# Multiple Air Gaps

The OT-2 pipettes can do some things that a human cannot do with a
pipette, like accurately alternate between aspirating and creating air
gaps within the same tip. The below example will aspirate from the first
five wells in the reservoir, while creating an air gap between each
sample.

```python
from opentrons import protocol_api

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    plate = protocol.load_labware('corning_96_wellplate_360ul_flat', 1)
    tiprack_1 = protocol.load_labware('opentrons_96_tiprack_300ul', 2)
    reservoir = protocol.load_labware('usascientific_12_reservoir_22ml', 4)
    p300 = protocol.load_instrument('p300_single', 'right', tip_racks=[tiprack_1])

    p300.pick_up_tip()

    for well in reservoir.wells()[:4]:
        p300.aspirate(35, well)
        p300.air_gap(10)

    p300.dispense(225, plate['A1'])

    p300.return_tip()
```