# Basic Transfer

Moving 100 µL from one well to another:

```python
from opentrons import protocol_api

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    plate = protocol.load_labware('corning_96_wellplate_360ul_flat', 1)
    tiprack_1 = protocol.load_labware('opentrons_96_tiprack_300ul', 2)
    p300 = protocol.load_instrument('p300_single', 'right', tip_racks=[tiprack_1])

    p300.transfer(100, plate['A1'], plate['B1'])
```

This accomplishes the same thing as the following basic commands:

```python
from opentrons import protocol_api

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    plate = protocol.load_labware('corning_96_wellplate_360ul_flat', 1)
    tiprack_1 = protocol.load_labware('opentrons_96_tiprack_300ul', 2)
    p300 = protocol.load_instrument('p300_single', 'right', tip_racks=[tiprack_1])

    p300.pick_up_tip()
    p300.aspirate(100, plate.wells('A1'))
    p300.dispense(100, plate.wells('B1'))
    p300.return_tip()
```