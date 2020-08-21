Hardware Modules
================

Modules are peripherals that attach to the OT-2 to extend its
capabilities.

We currently support the Temperature, Magnetic and Thermocycler Modules.

Module Setup
------------

### Loading Your Module Onto the Deck

Like labware and pipettes, you must inform the Protocol API of the
modules you will use in your protocol.

Use `ProtocolContext.load_module()` to
load a module. It will return an object representing the module.

```python
from opentrons import protocol_api

metadata = {'apiLevel': '|apiLevel|'}

def run(protocol: protocol_apiProtocolContext):
     # Load a Magnetic Module GEN2 in deck slot 1.
     magnetic_module = protocol.load_module('magnetic module gen2', 1)

     # Load a Temperature Module GEN1 in deck slot 3.
     temperature_module = protocol.load_module('temperature module', 3)
```

!!! Note
    When you load a module in a protocol, you inform the OT-2 that you want
    the specified module to be present. Even if you do not use the module
    anywhere else in your protocol, the Opentrons App and the OT-2 will not
    let your protocol proceed until all modules loaded with `load_module()`
    are attached to the OT-2.


_New in version 2.0_

#### Available Modules

The first parameter to
`ProtocolContext.load_module()`, the
module's *load name,* specifies the kind of module to load. Check the
table below for the proper load name to use for each kind of module.

Some modules were added to the Protocol API later than others. Make sure
you use a [Protocol API version](versioning.md) high enough to support all the modules you want to use.

| Module       | Load Name  | Minimum API Version   |
| ------------ | ---------- | :-------------------: | 
| Temperature Module GEN1 | `temperature module` or `tempdeck` | 2.0 |
| Temperature Module GEN2 | `temperature module gen2` | 2.3 |
| Magnetic Module GEN1 | `magnetic module` or `magdeck` | 2.0 |
| Magnetic Module GEN2 | `magnetic module gen2` | 2.3 |
| Thermocycler Module  | `thermocycler module` or `thermocycler` | 2.0 |

### GEN1 vs. GEN2 Modules

GEN2 modules are newer. They have improvements that make them more
reliable and easier to use.

#### Identifying a GEN2 Module

You can determine if your module is a GEN2 model by inspecting the sides
of the device for a label that specifies _GEN2_.

#### Changes with the GEN2 Temperature Module

The GEN2 Temperature Module has a plastic insulating rim around the
plate, and plastic insulating shrouds designed to fit over our aluminum
blocks. This mitigates an issue where the GEN1 Temperature Module would
have trouble cooling to very low temperatures, especially if it shared
the deck with a running Thermocycler.

#### Changes with the GEN2 Magnetic Module

The GEN2 Magnetic Module uses smaller magnets than the GEN1 version.
This mitigates an issue where beads would be attracted even when the
magnets were retracted.

This means it will take longer for the GEN2 module to attract beads.

Recommended Magnetic Module GEN2 bead attraction time:

   -   Total liquid volume <= 50 uL: 5 minutes
   -   Total liquid volume > 50 uL: 7 minutes

### Loading Labware Onto Your Module

Like specifying labware that will be present on the deck of the OT-2,
you must specify labware that will be present on the module you have
just loaded. You do this using
 `ModuleContext.load_labware()`. For
instance, to load a Temperature Module and specify an [aluminum block
for 2 mL
tubes](https://labware.opentrons.com/opentrons_24_aluminumblock_generic_2ml_screwcap?category=aluminumBlock),
you would do:

```python
from opentrons import protocol_api

metadata = {'apiLevel': '|apiLevel|'}

def run(protocol: protocol_apiProtocolContext):
     module = protocol.load_module('Temperature Module', slot)
     my_labware = module.load_labware('opentrons_24_aluminumblock_generic_2ml_screwcap',
                                      label='Temperature-Controlled Tubes')
```

Notice that when you load labware on a module, you don't specify the
labware's deck slot. The labware is loaded on the module, on whichever
deck slot the module occupies.

_New in version 2.0_

#### Module and Labware Compatibility

It's up to you to make sure that the labware and module you chose make
sense together. The Protocol API won't stop you from making nonsensical
combinations, like a tube rack on a Thermocycler.

See: [What labware can I use with my
modules?](https://support.opentrons.com/en/articles/3540964-what-labware-can-i-use-with-my-modules)

#### Loading Custom Labware Into Your Module

Any custom labware added to your Opentrons App (see
[Custom Labware](new_labware.md#custom-labware)) is accessible when
loading labware onto a module.

_New in version 2.1._

!!! Note
    In API version 2.0,  `ModuleContext.load_labware()` only took a `load_name` argument. In API version 2.1
    (introduced in Robot Software version 3.15.2) or higher you can now
    specify a label, version, and namespace (though most of the time you
    won't have to).


Using a Temperature Module
--------------------------

The Temperature Module acts as both a cooling and heating device. It can
control the temperature of its deck between 4 °C and 95 °C with a
resolution of 1 °C.

Temperature Modules are represented in code by
`TemperatureModuleContext` objects.

The Temperature Module has the following methods that can be accessed
during a protocol. For the purposes of this section, assume we have the
following already:

```python
from opentrons import protocol_api

metadata = {'apiLevel': '|apiLevel|'}

def run(protocol: protocol_apiProtocolContext):
    temp_mod = protocol.load_module('temperature module', '1')
    plate = temp_mod.load_labware('corning_96_wellplate_360ul_flat')
    # The code from the rest of the examples in this section goes here
```

_New in version 2.0_

### Set Temperature

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

### Read the Current Temperature

You can read the current real-time temperature of the Temperature Module
using the `TemperatureModuleContext.temperature` property:

```python
temp_mod.temperature
```

_New in version 2.0_

### Read the Target Temperature

You can read the current target temperature of the Temperature Module
using the `TemperatureModuleContext.target` property:

```python
temp_mod.target
```

_New in version 2.0_

### Check the Status

The `TemperatureModuleContext.status`
property is a string that is one of `'heating'`, `'cooling'`,
`'holding at target'` or `'idle'`.

```python
temp_mod.status
```

### Deactivate

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

Using a Magnetic Module
-----------------------

The Magnetic Module controls a set of permanent magnets which can move
vertically. When the magnets are raised or engaged, they induce a
magnetic field in the labware on the module. When they are lowered or
disengaged, they do not.

The Magnetic Module is represented by a
`MagneticModuleContext` object.

For the purposes of this section, assume we have the following already:

```python
from opentrons import protocol_api

metadata = {'apiLevel': '|apiLevel|'}

def run(protocol: protocol_apiProtocolContext):
    mag_mod = protocol.load_module('magnetic module', '1')
    plate = mag_mod.load_labware('nest_96_wellplate_100ul_pcr_full_skirt')
    # The code from the rest of the examples in this section goes here
```

_New in version 2.0_

### Engage

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
    There is a +/- 1 mmm variance across magnetic module units, using
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
    Module. If a labware that does not have a defined engage height is
    loaded on the Magnetic Module (or if no labware is loaded), then
    `height_from_labware` (since version 2.2) or `height`, must be
    specified.


_New in version 2.0_

### Disengage

```python
mag_mod.disengage()
```

The Magnetic Module will disengage when the device is turned on. It will
not auto-disengage otherwise unless you call
`MagneticModuleContext.disengage()` in
your protocol.

_New in version 2.0_

### Check the Status

The `MagneticModuleContext.status`
property is a string that is one of `'engaged'` or `'disengaged'`.

```python
mag_mod.status
```

Using a Thermocycler Module
---------------------------

The Thermocycler Module allows users to perform complete experiments
that require temperature sensitive reactions such as PCR.

There are two heating mechanisms in the Thermocycler. One is the block
in which samples are located; the other is the lid heating pad.

The block can control its temperature between 4 °C and 99 °C to the
nearest 1 °C.

The lid can control its temperature between 37 °C to 110 °C. Please see
our [support
article](https://support.opentrons.com/en/articles/3469797-thermocycler-module)
on controlling the Thermocycler in the Opentrons App.

For the purposes of this section, assume we have the following already:

```python
from opentrons import protocol_api

metadata = {'apiLevel': '|apiLevel|'}

def run(protocol: protocol_apiProtocolContext):
    tc_mod = protocol.load_module('Thermocycler Module')
    plate = tc_mod.load_labware('nest_96_wellplate_100ul_pcr_full_skirt')
```

!!! Note
    When loading the Thermocycler, it is not necessary to specify a slot.
    This is because the Thermocycler has a default position that covers
    Slots 7, 8, 10, and 11. This is the only valid location for the
    Thermocycler on the OT-2 deck.

_New in version 2.0_

### Lid Motor Control

The Thermocycler can control its temperature with the lid open or
closed. When the lid of the Thermocycler is open, the pipettes can
access the loaded labware. You can control the lid position with the
methods below.

#### Open Lid

```python
tc_mod.open_lid()
```

_New in version 2.0_

#### Close Lid

```python
tc_mod.close_lid()
```

_New in version 2.0_

### Lid Temperature Control

You can control when a lid temperature is set. It is recommended that
you set the lid temperature before executing a Thermocycler profile (see
[Thermocycler Profiles](new_modules.md#thermocycler-profiles)). The range of the
Thermocycler lid is 37 °C to 110 °C.

#### Set Lid Temperature

`ThermocyclerContext.set_lid_temperature()` takes one parameter: the `temperature` you wish the lid to
be set to. The protocol will only proceed once the lid temperature has
been reached.

```python
tc_mod.set_lid_temperature(temperature)
```

_New in version 2.0_

### Block Temperature Control

To set the block temperature inside the Thermocycler, you can use the
method `ThermocyclerContext.set_block_temperature()`. It takes five parameters: `temperature`,
`hold_time_seconds`, `hold_time_minutes`, `ramp_rate` and
`block_max_volume`. Only `temperature` is required; the two `hold_time`
parameters, `ramp_rate`, and `block_max_volume` are optional.

#### Temperature

If you only specify a `temperature` in °C, the Thermocycler will hold
this temperature indefinitely until powered off.

```python
tc_mod.set_block_temperature(4)
```

_New in version 2.0_

#### Hold Time

If you set a `temperature` and a `hold_time`, the Thermocycler will hold
the temperature for the specified amount of time. Time can be passed in
as minutes or seconds.

With a hold time, it is important to also include the `block_max_volume`
parameter. This is to ensure that the sample reaches the target
temperature before the hold time counts down.

In the example below, the Thermocycler will hold the 50 µl samples at
the specified temperature for 45 minutes and 15 seconds.

If you do not specify a hold time the protocol will proceed once the
temperature specified is reached.

```python
tc_mod.set_block_temperature(4,
                             hold_time_seconds=15,
                             hold_time_minutes=45,
                             block_max_volume=50)
```

_New in version 2.0_

#### Block Max Volume

The Thermocycler's block temperature controller varies its behavior
based on the amount of liquid in the wells of its labware. Specifying an
accurate volume allows the Thermocycler to precisely track the
temperature of the samples. The `block_max_volume` parameter is
specified in µL and is the volume of the most-full well in the labware
that is loaded on the Thermocycler's block. If not specified, it
defaults to 25 µL.

```python
tc_mod.set_block_temperature(4, hold_time_seconds=20, block_max_volume=80)
```

_New in version 2.0_

#### Ramp Rate

Lastly, you can modify the `ramp_rate` in °C/sec for a given
`temperature`.

```python
tc_mod.set_block_temperature(4, hold_time_seconds=60, ramp_rate=0.5)
```

!!! Warning
    Do not modify the `ramp_rate` unless you know what you're doing.


_New in version 2.0_

### Thermocycler Profiles

The Thermocycler can rapidly cycle through temperatures to execute
heat-sensitive reactions. These cycles are defined as profiles.

Thermocycler profiles are defined for the Protocol API as lists of
dicts. Each dict should have a `temperature` key, which specifies the
temperature of a profile step, and either or both of `hold_time_seconds`
or `hold_time_minutes`, which specify the duration of the step. For
instance, this profile commands the Thermocycler to drive its
temperature to 10 °C for 30 seconds, and then 60 °C for 45 seconds:

```python
profile = [
  {'temperature': 10, 'hold_time_seconds': 30},
  {'temperature': 60, 'hold_time_seconds': 45}]
```

Once you have written your profile, you command the Thermocycler to
execute it using
`ThermocyclerContext.execute_profile()`. This function executes your profile steps multiple times
depending on the `repetitions` parameter. It also takes a
`block_max_volume` parameter, which is the same as that of the
`ThermocyclerContext.set_block_temperature()` function.

For instance, you can execute the profile defined above 100 times for a
30 µL-per-well volume like this:

```python
profile = [
  {'temperature': 10, 'hold_time_seconds': 30},
  {'temperature': 60, 'hold_time_seconds': 30}]

tc_mod.execute_profile(steps=profile, repetitions=100, block_max_volume=30)
```

!!! Note
    Temperature profiles only control the temperature of the
    [block](new_modules.md#block) in the Thermocycler. You should set a lid
    temperature before executing the profile using
    `ThermocyclerContext.set_lid_temperature()`.


_New in version 2.0_

### Thermocycler Status

Throughout your protocol, you may want particular information on the
current status of your Thermocycler. Below are a few methods that allow
you to do that.

#### Basic Status

The `.ThermocyclerContext.status`
property is one of the strings `‘holding at target’`, `‘cooling’`,
`‘heating’`, or `‘idle’`.

```python
tc_mod.status
```

_New in version 2.0_

#### Lid Position

The current status of the lid position. It can be one of the strings
`'open'`, `'closed'` or `'in_between'`.

```python
tc_mod.lid_position
```

_New in version 2.0_

#### Heated Lid Temperature Status

The current status of the heated lid temperature controller. It can be
one of the strings `'holding at target'`, `'heating'`, `'idle'`, or
`'error'`.

```python
tc_mod.lid_temperature_status
```

_New in version 2.0_

#### Block Temperature Status

The current status of the well block temperature controller. It can be
one of the strings `'holding at target'`, `'cooling'`, `'heating'`,
`'idle'`, or `'error'`.

```python
tc_mod.block_temperature_status
```

_New in version 2.0_

### Thermocycler Deactivate

At some points in your protocol, you may want to deactivate specific
temperature controllers of your Thermocycler. This can be done with
three methods, `.ThermocyclerContext.deactivate()`, `.ThermocyclerContext.deactivate_lid()`,
`.ThermocyclerContext.deactivate_block()`.

#### Deactivate

This deactivates both the well block and the heated lid of the
Thermocycler.

```python
tc_mod.deactivate()
```

#### Deactivate Lid

This deactivates only the heated lid of the Thermocycler.

```python
tc_mod.deactivate_lid()
```

_New in version 2.0_

#### Deactivate Block

This deactivates only the well block of the Thermocycler.

```python
tc_mod.deactivate_block()
```

_New in version 2.0_
