# Writing Your First Protocol

We designed this API to make your code as readable and as easy to
understand as possible. For example, below is a short set of instructions to
transfer from well `'A1'` to well `'B1'` like you might write in your lab notebook:

> Protocol: My Protocol
> Author: A. Biologist
> Description: Simple protocol to get started using OT-2
>
> **Procedure**
>
> Add a 96 well plate, and place it in slot '2' of the robot deck
>
> Add a 300 µL tip rack, and place it in slot '1' of the robot deck
>
> Add a single-channel 300 µL pipette to the left mount, and use the 
> p300 tips.
>
> Transfer 100 µL from the plate's 'A1' well to its 'B2' well and drop 
> the tip in the trash.

If we were to rewrite this with the Python Protocol API, it would look
like the following:



``` python
from opentrons import protocol_api

# metadata
metadata = {
    'protocolName': 'My Protocol',
    'author': 'Name <email@address.com>',
    'description': 'Simple protocol to get started using OT2',
    'apiLevel': '{! version_info/apilevel.txt !}'
}

# protocol run function. the part after the colon lets your editor know
# where to look for autocomplete suggestions
def run(protocol: protocol_apiProtocolContext):

    # labware
    plate = protocol.load_labware('corning_96_wellplate_360ul_flat', '2')
    tiprack = protocol.load_labware('opentrons_96_tiprack_300ul', '1')

    # pipettes
    left_pipette = protocol.load_instrument(
         'p300_single', 'left', tip_racks=[tiprack])

    # commands
    left_pipette.pick_up_tip()
    left_pipette.aspirate(100, plate['A1'])
    left_pipette.dispense(100, plate['B2'])
    left_pipette.drop_tip()
```

## How it's Organized

When writing protocols using the Python Protocol API, there are
generally five sections:

1.  Metadata and Version Selection
2.  Run function
3.  Labware
4.  Pipettes
5.  Commands

### Metadata and Version Selection

Metadata is some helpful information about your protocol. You should have a good guess of 
what each of the fields in the `metadata` is doing.
Most metadata is not needed to run a protocol, but if present can help the Opentrons App
display additional data about the protocol currently being executed.
These optional (but recommended) fields are (`"protocolName"`,
`"author"`, and `"description"`).

!!! Warning
    The required element of the metadata is `"apiLevel"`. It is used to provide
    consistent pipetting behaviors in your protocol as we make changes to the API.

The `"apiLevel"` must contain a string specifying the major and minor version of the Python Protocol
API that your protocol is designed for. For instance, a protocol written
for version {! version_info/apilevel.txt !} of the Python Protocol API
Protocol API should have in its metadata `"apiLevel": "{! version_info/apilevel.txt !}"`.

Anytime we make a change to the API that affects pipetting behaviors, 
(e.g. tip positions, flow rates, pipette movement, etc.) we increment the `apiLevel`.
This means if you write and test your protocol on API Version {! version_info/apilevel.txt !},
it will continue to behave the same as we update the Software version.

!!! Note
    The Opentrons software version is different from the Protocol API Version.
    The current versions at the time of writing are:

    **Opentrons Software:** {! version_info/build.txt !}
    **API Version:** {! version_info/apilevel.txt !}

For more information on Python Protocol API versioning, see the
[Versioning](versioning.md) page.

### The Run Function and the Protocol Context

Protocols are structured around a function called `run(protocol)`,
defined in code like this:

``` python
from opentrons import protocol_api

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    pass
```

This function must be named exactly `run` and must take exactly one
mandatory argument (its name doesn't matter, but we recommend `protocol`
since this argument represents the protocol that the robot will
execute).

The function `run()` is the container for the code that defines your
protocol.

The object `protocol` is the *protocol context*, which represents the
robot and its capabilities. It is always an instance of the
`opentrons.protocol_api.contextsProtocolContext` class (though you'll never have to instantiate one
yourself - it is always passed in to `run()`), and it is tagged as such
in the example protocol to allow most editors to give you autocomplete.

The protocol context has two responsibilities:

1.  Remember, track, and check the robot's state
2.  Expose the functions that make the robot execute actions

The example protocol imports the definition of the protocol context to provide editors with
autocomplete sources.

### Labware

The next step is defining the labware required for your protocol. You
must tell the protocol context about what should be present on the deck,
and where. You tell the protocol context about labware by calling the
method `protocol.load_labware(name, slot)` and saving the result.

The name of a labware is a string that is different for each kind of
labware. You can look up labware to add to your protocol on the
Opentrons [Labware Library](https://labware.opentrons.com).

The slot is the labelled location on the deck in which you've placed
the labware. The available slots are numbered from 1-11.

Our example protocol above loads

-   a [Corning 96 Well Plate](https://labware.opentrons.com/corning_96_wellplate_360ul_flat)
    in slot 2:

``` python
plate = protocol.load_labware('corning_96_wellplate_360ul_flat', 2)
```

-   an [Opentrons 300µL Tiprack](https://labware.opentrons.com/opentrons_96_tiprack_300ul)
    in slot 1:

``` python
tiprack = protocol.load_labware('opentrons_96_tiprack_300ul', 1)
```

These labware can be referenced later in the protocol as `plate` and
`tiprack` respectively. Check out [the Python docs](https://docs.python.org/3/index.html) 
for further information on using variables effectively in your code.

You can find more details about handling labware in the
[Labware](new_labware.md) section.

### Pipettes

After defining labware, you define the instruments required for your
protocol. You tell the protocol context about which pipettes should be
attached, and which slot they should be attached to, by calling the
method `protocol.load_instrument(model, mount, tip_racks)` and saving
the result.

The `model` of the pipette is the kind of pipette that should be
attached; the `mount` is either `"left"` or `"right"`; and `tip_racks`
is a list of the objects representing tip racks that this instrument
should use. Specifying `tip_racks` is optional, but if you don't then
you'll have to manually specify where the instrument should pick up
tips from every time you try and pick up a tip.

See [Pipettes](new_pipette.md) for more information on
creating and working with pipettes.

Our example protocol above loads a P300 Single-channel pipette
(`'p300_single'`) in the left mount (`'left'`), and uses the Opentrons
300 µL tiprack we loaded previously as a source of tips
(`tip_racks=[tiprack]`).

### Commands

Once the instruments and labware required for the protocol are defined,
the next step is to define the commands that make up the protocol. The
most common commands are `aspirate()`, `dispense()`, `pick_up_tip()`,
and `drop_tip()`. These and many others are described in the
[Building Block Commands](new_atomic_commands.md) and
[Complex Commands](new_complex_commands.md) sections, which go
into more detail about the commands and how they work. These commands
typically specify which wells of which labware to interact with, using
the labware you defined earlier, and are methods of the instruments you
created in the pipette section. For instance, in our example protocol,
you use the pipette you defined to:

1.  Pick up a tip from the tiprack you specified: `pipette.pick_up_tip()`
2.  Aspirate 100 µL from well A1 of the 96 well plate you specified in
    slot 2: `pipette.aspirate(100, plate['A1'])`
3.  Dispense 100 µL into well A2 the same plate: `pipette.dispense(100, plate['A2'])`
4.  Drop the tip into the trash at the back right of the
    robot's deck: `pipette.drop_tip()`

## You Next Protocol

OK, so now that you sucessfully transfered some liquid from one well to another, 
you're probably ready to move on to bigger and better things! The next sections 
will show you how to add additional hardware and labware to your OT-2.