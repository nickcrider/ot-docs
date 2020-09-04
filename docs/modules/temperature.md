# Temperature Module

The Temperature Module acts as both a cooling and heating device. It can
control the temperature of its deck between 4 °C and 95 °C with a
resolution of 1 °C.

Temperature Modules are represented in code by
`TemperatureModuleContext` objects.

The Temperature Module has the following methods that can be accessed
during a protocol. For the purposes of this section, assume there is the
following already:

```python
from opentrons import protocol_api

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

def run(protocol: protocol_apiProtocolContext):
    temp_mod = protocol.load_module('temperature module', '1')
    plate = temp_mod.load_labware('corning_96_wellplate_360ul_flat')
    # The code from the rest of the examples in this section goes here
```

_New in version 2.0_

## Set Temperature

To set the Temperature Module to 4 °C do the following:

```python
temp_mod.set_temperature(4)
```

This function will pause your protocol until your target temperature is
reached.

!!! Note
    This is unlike version 1 of the Python API, in which you would have to
    use the separate function `wait_for_temperature` to block protocol
    execution until the Temperature Module was ready.


_New in version 2.0_

## Read the Current Temperature

You can read the current real-time temperature of the Temperature Module
using the `TemperatureModuleContext.temperature` property:

```python
temp_mod.temperature
```

_New in version 2.0_

## Read the Target Temperature

You can read the current target temperature of the Temperature Module
using the `TemperatureModuleContext.target` property:

```python
temp_mod.target
```

_New in version 2.0_

## Check the Status

The `TemperatureModuleContext.status`
property is a string that's one of `'heating'`, `'cooling'`,
`'holding at target'` or `'idle'`.

```python
temp_mod.status
```

## Deactivate

This function will stop heating or cooling and will turn off the fan on
the Temperature Module.

```python
temp_mod.deactivate()
```

!!! Note
    You can also deactivate your temperature module through the Opentrons
    App by clicking on the `Pipettes & Modules` tab. Your Temperature Module
    will automatically deactivate if another protocol is uploaded to the
    app. Your Temperature Module will *not* deactivate automatically when
    the protocol ends, is cancelled, or is reset.


After deactivating your Temperature module, you can later call
`TemperatureModuleContext.set_temperature()` to heat or cool phase again.

_New in version 2.0_
