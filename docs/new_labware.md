# Loading Labware

When writing a protocol, you must inform the Protocol API about the
labware you will be placing on the OT-2's deck.

When you load labware, you specify the name of the labware (for example
`'corning_96_wellplate_360ul_flat'`), and the slot on the OT-2's deck
in which it will be placed (for example `'2'`). The first place to look for the
names of labware should always be the [Opentrons Labware
Library](https://labware.opentrons.com), where Opentrons maintains a
database of labware, their names in the API, what they look like,
manufacturer part numbers, and more. In this example, we'll use
`'corning_96_wellplate_360ul_flat'` ([an ANSI standard 96-well
plate](https://labware.opentrons.com/corning_96_wellplate_360ul_flat))
and `'opentrons_96_tiprack_300ul'` ([the Opentrons standard 300 µL
tiprack](https://labware.opentrons.com/opentrons_96_tiprack_300ul)).

In the example given in the [Overview](index.md) section, we loaded labware like this:

``` python
plate = protocol.load_labware('corning_96_wellplate_360ul_flat', '2')
tiprack = protocol.load_labware('opentrons_96_tiprack_300ul', '1')
```

which informed the protocol context that the deck contains a 300 µL
tiprack in slot 1 and a 96 well plate in slot 2.

A third optional argument can be used to give the labware a nickname to
be displayed in the Opentrons App.

``` python
plate = protocol.load_labware('corning_96_wellplate_360ul_flat',
                              location='2',
                              label='any-name-you-want')
```

Labware is loaded into a protocol using
`ProtocolContext.load_labware`, which
returns a `opentrons.protocol_api.labware.Labware` object.

Finding Labware
---------------

### Default Labware

The OT-2 has a set of labware well-supported by Opentrons defined
internally. This set of labware is always available to protocols. This
labware can be found on the [Opentrons Labware
Library](https://labware.opentrons.com). You can copy the load names
that should be passed to `protocol.load_labware` statements to get the
correct definitions.

### Custom Labware

If you have a piece of labware that's not in the Labware Library, you
can create your own definition using the [Opentrons Labware
Creator](https://labware.opentrons.com/create/). Before using the
Labware Creator, you should read the introduction article
[here](https://support.opentrons.com/en/articles/3136504-creating-custom-labware-definitions).

Once you have created your labware and saved it as a `.json` file, you
can add it to the Opentrons App by clicking "More" and then
"Labware." Once you have added your labware to the Opentrons App, it
will be available to all Python Protocol API version 2 protocols
uploaded to your robot through that Opentrons App. If other people will
be using this custom labware definition, they must also add it to their
Opentrons App. You can find a support article about this custom labware
process
[here](https://support.opentrons.com/en/articles/3136506-using-labware-in-your-protocols).


