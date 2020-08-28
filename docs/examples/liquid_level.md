# Impliment Liquid Level Tracking

```python
import math

def run(protocol):
    
    plate = protocol.load_labware('nest_96_wellplate_100ul_pcr_full_skirt', '1')
    tiprack = protocol.load_labware('opentrons_96_wellplate_300ul', '2')
    tuberack = protocol.load_labware('opentrons_6_tuberack_nest_50ml_conical', '3')

    p300 = protocol.load_instrument('p300_single_gen2', 'right', tip_racks=[my_tiprack])

    min_height = 1  # depth at which the pipette tip will stop descending into the tube
    compensation_coeff = 1.1  # ensures tip is below liquid level even with theoretical volume loss
    initial_heights = 50  # heights that the tubes will be filled to initially
    heights = {tube: initial_heights for tube in tuberack.wells()}

    def h_track(vol, tube):
        nonlocal heights
        
        # calculate height decrement based on volume
        dh = ((math.pi*((tube.diameter/2)**2))/vol)*compensation_coeff
        
        # make sure height decrement will not crash into the bottom of the tube
        h = heights[tube] - dh if heights[tube] - dh > min_height else min_height
        heights[tube] = h
        
        return h

    h = h_track(200, tuberack.wells()[0])
    p300.transfer(200, tuberack.wells()[0].bottom(h), plate.wells()[0])
```