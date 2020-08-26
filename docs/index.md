# OT-2 Python Protocol API Version 2

The OT-2 Python Protocol API is a simple Python framework designed to
make writing automated biology lab protocols easy.

We've designed it in a way we hope is accessible to anyone with basic
Python and wetlab skills. As a bench scientist, you should be able to
code your automated protocols in a way that reads like a lab notebook.

## Getting Started 

Even if you've never used Python before, we hope you still might have an idea of what 
this bit of code is trying to accomplish:

```python
plate = protocol.load_labware('corning_96_wellplate_360ul_flat', '2')
tiprack = protocol.load_labware('opentrons_96_tiprack_300ul', '1')

left_pipette = protocol.load_instrument(
        'p300_single', 'left', tip_racks=[tiprack])

left_pipette.pick_up_tip()
left_pipette.aspirate(100, plate['A1'])
left_pipette.dispense(100, plate['B2'])
left_pipette.drop_tip()
```

If you said "transfer from well `'A1'` to well `'B1'`", read on to learn
more about how to get up and running with your first Python protocol!

But if you're still scratching your head, don't worry! We've got you covered, check out our 
[Using Python For Protocols](writing.md) page first before reading further.

### Prerequisites

If you want to follow along at home, (you should!) you'll need to get the Opentrons
Python package installed so you can simulate protocol files. It's as easy as:

```bash
pip install opentrons
opentrons_simulate my_protocol.py
```

Don't worry if you have no idea what that means, check out [Simulating Your Scripts](simulating.md) 
to learn more about how to get the simulation environment setup on your computer.

Then when you're ready to run your script on a robot, download our latest [desktop
app](https://www.opentrons.com/ot-app) and you can upload you file directly to the robot!

### Troubleshooting


If you encounter problems using our products please take a look at our
[support docs](https://support.opentrons.com/en/) or contact our team
via intercom on our website at [opentrons.com](https://opentrons.com).

### Feature Requests


Have an interesting idea or improvement for our software? We're all ears! Create a
ticket on GitHub by following these
[guidelines.](https://github.com/Opentrons/opentrons/blob/edge/CONTRIBUTING.md#opening-issues)

### Developer's guide


Do you want to contribute to our open-source API? You can find more
information on how to be involved
[here](https://github.com/Opentrons/opentrons/blob/edge/CONTRIBUTING.md).
