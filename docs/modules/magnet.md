# Magnetic Module

The Magnetic Module controls a set of permanent magnets which can move
vertically. When the magnets are raised or engaged, they induce a
magnetic field in the labware on the module. When they're lowered or
disengaged, they don't.

The Magnetic Module is represented by a
`MagneticModuleContext` object.

The example code in this section is inserted into this `run(protoco)` function:

```python
from opentrons import protocol_api

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    mag_mod = protocol.load_module('magnetic module', '1')
    plate = mag_mod.load_labware('nest_96_wellplate_100ul_pcr_full_skirt')
    # The code from the rest of the examples in this section goes here
```

_New in version 2.0_

## Engage

The `MagneticModuleContext.engage()`
function raises the magnets to induce a magnetic field in the labware on
top of the Magnetic Module. The height of the magnets can be specified
in several different ways, based on internally stored default heights
for labware:

-   If neither `height_from_base`, `height` nor `offset` is specified
    **and** the labware is supported on the Magnetic Module, the magnets
    will raise to a reasonable default height based on the specified
    labware.

    ```python
    mag_mod.engage()
    ```

    _New in version 2.0._

-   The recommended way to specify the magnets' position is to utilize
    the `height_from_base` parameter, which allows you to raise the
    height of the magnets relative to the base of the labware.

    ```python
    mag_mod.engage(height_from_base=13.5)
    ```

    A `mag_mod.engage(height_from_base=0)` call should move the tops of
    the magnets to level with base of the labware.

    _New in version 2.2._

!!! Note
    There is a +/- 1 mm variance across magnetic module units, using
    `height_from_base=0` might not be able to get the magnets to completely
    flush with base of the labware. Please test before carrying out your
    experiment to ensure the desired engage height for your labware.


-   You can also specify `height()`, which should be a distance in mm from
    the home position of the magnets.

    ```python
    mag_mod.engage(height=18.5)
    ```

    _New in version 2.0._

-   An `offset()` can be applied to move the magnets relatively from the
    default engage height of the labware, **if** the labware is
    supported on the Magnetic Module.

    ```
    mag_mod.engage(offset=-2)
    ```

    _New in version 2.0._

!!! Note
    Only certain labwares have defined engage heights for the Magnetic
    Module. If a labware that doesn't have a defined engage height is
    loaded on the Magnetic Module (or if no labware is loaded), then
    `height_from_labware` (since version 2.2) or `height`, must be
    specified.


_New in version 2.0_

## Disengage

```python
mag_mod.disengage()
```

The Magnetic Module will disengage when the device is turned on. It will
not automatically disengage otherwise unless you call
`MagneticModuleContext.disengage()` in
your protocol.

_New in version 2.0_

## Check the Status

The `MagneticModuleContext.status`
property is a string that's one of `'engaged'` or `'disengaged'`.

```python
mag_mod.status
```