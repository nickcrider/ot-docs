Labware
=======

When writing a protocol, you must inform the Protocol API about the
labware you will be placing on the OT-2's deck.

When you load labware, you specify the name of the labware (e.g.
`'corning_96_wellplate_360ul_flat'`), and the slot on the OT-2's deck
in which it will be placed (e.g. `'2'`). The first place to look for the
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

If you have a piece of labware that is not in the Labware Library, you
can create your own definition using the [Opentrons Labware
Creator](https://labware.opentrons.com/create/). Before using the
Labware Creator, you should read the introduction article
[here](https://support.opentrons.com/en/articles/3136504-creating-custom-labware-definitions).

Once you have created your labware and saved it as a `.json` file, you
can add it to the Opentrons App by clicking "More" and then
"Labware". Once you have added your labware to the Opentrons App, it
will be available to all Python Protocol API version 2 protocols
uploaded to your robot through that Opentrons App. If other people will
be using this custom labware definition, they must also add it to their
Opentrons App. You can find a support article about this custom labware
process
[here](https://support.opentrons.com/en/articles/3136506-using-labware-in-your-protocols).

Accessing Wells in Labware
--------------------------

### Well Ordering

When writing a protocol, you will need to select which wells to transfer
liquids to and from.

Rows of wells (see image below) on a labware are typically labeled with
capital letters starting with `'A'`; for instance, an 8x12 96 well plate
will have rows `'A'` through `'H'`.

Columns of wells (see image below) on a labware are typically labeled
with numerical indices starting with `'1'`; for instance, an 8x12 96
well plate will have columns `'1'` through `'12'`.

For all well accessing functions, the starting well will always be at
the top left corner of the labware. The ending well will be in the
bottom right, see the diagram below for further explanation.

![image](../img/well_iteration/Well_Iteration.png)


!!! Note
    Examples in this section expect the following:

    ``` python
    metadata = {'apiLevel': '|apiLevel|'}

    def run(protocol):

        plate = protocol.load_labware('corning_24_wellplate_3.4ml_flat', slot='1')
    ```

_New in version 2.0_

### Accessor Methods

There are many different ways to access wells inside labware. Different
methods are useful in different contexts. The table below lists out the
methods available to access wells and their differences.


| Method Name                                    |   Returns                                                            |
| -----------------------------------------------| -------------------------------------------------------------------- |
| `wells()`       | List of all wells, i.e. `[labware:A1, labware:B1, labware:C1...]`    |
| `rows()`        | List of a list ordered by row, i.e `[[labware:A1, labware:A2...], [labware:B1, labware:B2..]]`    |
| `columns()`     | List of a list ordered by column, i.e. `[[labware:A1, labware:B1..], [labware:A2, labware:B2..]]` |
| `wells_by_name()` |     Dictionary with well names as keys, i.e.`{'A1': labware:A1, 'B1': labware:B1}`  |
| `rows_by_name()`  |      Dictionary with row names as keys, i.e. `{'A': [labware:A1, labware:A2..], 'B': [labware:B1, labware:B2]}` |
| `columns_by_name()`  |   Dictionary with column names as keys, i.e. `{'1': [labware:A1, labware:B1..], '2': [labware:A2, labware:B2..]}`  |


### Accessing Individual Wells

#### Dictionary Access

Once a labware is loaded into your protocol, you can easily access the
many wells within it by using dictionary indexing. If a well does not
exist in this labware, you will receive a `KeyError`. This is equivalent
to using the return value of
`wells_by_name()`:

``` python
a1 = plate['A1']
d6 = plate.wells_by_name()['D6']
```

_New in version 2.0_

#### List Access From `wells`

Wells can be referenced by their name, as demonstrated above. However,
they can also be referenced with zero-indexing, with the first well in a
labware being at position 0.

``` python
plate.wells()[0]   # well A1
plate.wells()[23]  # well D6
```

!!! Tip
    You may find well names (e.g. `"B3"`) to be easier to reason with,
    especially with irregular labware (e.g.
    `opentrons_10_tuberack_falcon_4x50ml_6x15ml_conical` ([Labware
    Library](https://labware.opentrons.com/opentrons_10_tuberack_falcon_4x50ml_6x15ml_conical)).
    Whichever well access method you use, your protocol will be most
    maintainable if you use only one access method consistently.


_New in version 2.0_

### Accessing Groups of Wells

When describing a liquid transfer, you can point to groups of wells for
the liquid's source and/or destination. Or, you can get a group of
wells and loop (or iterate) through them.

You can access a specific row or column of wells by using the
`rows_by_name()` and
`columns_by_name()` methods on
a labware. These methods both return a dictionary with the row or column
name as the keys:

``` python
row_dict = plate.rows_by_name()['A']
row_list = plate.rows()[0] # equivalent to the line above
column_dict = plate.columns_by_name()['1']
column_list = plate.columns()[0] # equivalent to the line above

print('Column "1" has', len(column_dict), 'wells')
print('Row "A" has', len(row_dict), 'wells')
```

will print out...

```
Column "1" has 4 wells
Row "A" has 6 wells
```

Since these methods return either lists or dictionaries, you can iterate
through them as you would regular Python data structures.

For example, to access the individual wells of row `'A'` in a well
plate, you can do:

``` python
for well in plate.rows()[0]:
    print(well)
```

or,

``` python
for well_obj in plate.rows_by_name()['A'].values():
    print(well_obj)
```

and it will return the individual well objects in row A.

_New in version 2.0_

Specifying Position Within Wells
--------------------------------

The functions listed above (in the [Accessing Wells in Labware](new_labware.md#accessing-wells-in-labware) section) return objects (or lists, lists of lists,
dictionaries, or dictionaries of lists of objects) representing wells.
These are `opentrons.protocol_api.labware.Well` objects. `Well`
objects have some useful methods on them, which allow you to more
closely specify the location to which the OT-2 should move *inside* a
given well.

Each of these methods returns an object called a
`opentrons.types.Location`, which
encapsulates a position in deck coordinates (see
[Deck Coordinates](new_protocol_api.md#deck-coordinates)) and a well
with which it is associated. This lets you further manipulate the
positions returned by these methods. All
`InstrumentContext` methods that
involve positions accept these `Location` objects.

### Position Modifiers

#### Top

The method `Well.top()` returns a
position at the top center of the well. This is a good position to use
for [Blow Out](new_atomic_commands.md#blow-out) or any other operation
where you don't want to be contacting the liquid. In addition,
`Well.top()` takes an optional argument
`z`, which is a distance in mm to move relative to the top vertically
(positive numbers move up, and negative numbers move down):

``` python
plate['A1'].top()     # This is the top center of the well
plate['A1'].top(z=1)  # This is 1mm above the top center of the well
plate['A1'].top(z=-1) # This is 1mm below the top center of the well
```

_New in version 2.0_

#### Bottom

The method `Well.bottom()` returns a
position at the bottom center of the well. This is a good position to
start when considering where to aspirate, or any other operation where
you want to be contacting the liquid. In addition,
`Well.bottom()` takes an optional
argument `z`, which is a distance in mm to move relative to the bottom
vertically (positive numbers move up, and negative numbers move down):

``` python
plate['A1'].bottom()     # This is the bottom center of the well
plate['A1'].bottom(z=1)  # This is 1mm above the bottom center of the well
plate['A1'].bottom(z=-1) # This is 1mm below the bottom center of the well.
                         # this may be dangerous!
```

!!! Warning
    Negative `z` arguments to `Well.bottom()` may cause the tip to collide with the bottom of the well.
    The OT-2 has no sensors to detect this, and if it happens, the pipette
    that collided will be too high in z until the next time it picks up a
    tip.


!!! Note
    If you are using this to change the position at which the robot does
    [Aspirate](new_atomic_commands.md#aspirate) or
    [Dispense](new_atomic_commands.md#dispense) throughout the protocol,
    consider setting the default aspirate or dispense offset with
    `InstrumentContext.well_bottom_clearance()` (see [Default Positions Within Wells](new_pipette.md#default-positions-within-wells)).


_New in version 2.0_

#### Center

The method `Well.center()` returns a
position centered in the well both vertically and horizontally. This can
be a good place to start for precise control of positions within the
well for unusual or custom labware.

``` python
plate['A1'].center() # This is the vertical and horizontal center of the well
```

_New in version 2.0_

### Manipulating Positions

The objects returned by the position modifier functions are all
instances of `opentrons.types.Location`, which are [named
tuples](https://docs.python.org/3/library/collections.html#collections.namedtuple)
representing the combination of a point in space (another named tuple)
and a reference to the associated `Well` (or `Labware`, or slot
name, depending on context).

To adjust the position within a well, you can use
`Location.move()`. Pass it a
`opentrons.types.Point` representing
a 3-dimensional offset. It will return a new location, representing the
original location with that offset applied.

For example:

```python
from opentrons import types

metadata = {'apiLevel': '|apiLevel|'}

def run(protocol):
     plate = protocol.load_labware(
        'corning_24_wellplate_3.4ml_flat', slot='1')

     # Get the center of well A1.
     center_location = plate['A1'].center()

     # Get a location 1 mm right, 1 mm back, and 1 mm up from the center of well A1.
     adjusted_location = center_location.move(types.Point(x=1, y=1, z=1))

     # Move to 1 mm right, 1 mm back, and 1 mm up from the center of well A1.
     pipette.move_to(adjusted_location)
```

_New in version 2.0_
