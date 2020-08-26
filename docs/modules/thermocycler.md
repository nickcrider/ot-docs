# Using a Thermocycler Module

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

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

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

## Lid Motor Control

The Thermocycler can control its temperature with the lid open or
closed. When the lid of the Thermocycler is open, the pipettes can
access the loaded labware. You can control the lid position with the
methods below.

### Open Lid

```python
tc_mod.open_lid()
```

_New in version 2.0_

### Close Lid

```python
tc_mod.close_lid()
```

_New in version 2.0_

## Lid Temperature Control

You can control when a lid temperature is set. It is recommended that
you set the lid temperature before executing a Thermocycler profile (see
[Thermocycler Profiles](#thermocycler-profiles)). The range of the
Thermocycler lid is 37 °C to 110 °C.

### Set Lid Temperature

`ThermocyclerContext.set_lid_temperature()` takes one parameter: the `temperature` you wish the lid to
be set to. The protocol will only proceed once the lid temperature has
been reached.

```python
tc_mod.set_lid_temperature(temperature)
```

_New in version 2.0_

## Block Temperature Control

To set the block temperature inside the Thermocycler, you can use the
method `ThermocyclerContext.set_block_temperature()`. It takes five parameters: `temperature`,
`hold_time_seconds`, `hold_time_minutes`, `ramp_rate` and
`block_max_volume`. Only `temperature` is required; the two `hold_time`
parameters, `ramp_rate`, and `block_max_volume` are optional.

### Temperature

If you only specify a `temperature` in °C, the Thermocycler will hold
this temperature indefinitely until powered off.

```python
tc_mod.set_block_temperature(4)
```

_New in version 2.0_

### Hold Time

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

### Block Max Volume

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

### Ramp Rate

Lastly, you can modify the `ramp_rate` in °C/sec for a given
`temperature`.

```python
tc_mod.set_block_temperature(4, hold_time_seconds=60, ramp_rate=0.5)
```

!!! Warning
    Do not modify the `ramp_rate` unless you know what you're doing.


_New in version 2.0_

## Thermocycler Profiles

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
    [block](#block) in the Thermocycler. You should set a lid
    temperature before executing the profile using
    `ThermocyclerContext.set_lid_temperature()`.


_New in version 2.0_

## Thermocycler Status

Throughout your protocol, you may want particular information on the
current status of your Thermocycler. Below are a few methods that allow
you to do that.

### Basic Status

The `.ThermocyclerContext.status`
property is one of the strings `‘holding at target’`, `‘cooling’`,
`‘heating’`, or `‘idle’`.

```python
tc_mod.status
```

_New in version 2.0_

### Lid Position

The current status of the lid position. It can be one of the strings
`'open'`, `'closed'` or `'in_between'`.

```python
tc_mod.lid_position
```

_New in version 2.0_

### Heated Lid Temperature Status

The current status of the heated lid temperature controller. It can be
one of the strings `'holding at target'`, `'heating'`, `'idle'`, or
`'error'`.

```python
tc_mod.lid_temperature_status
```

_New in version 2.0_

### Block Temperature Status

The current status of the well block temperature controller. It can be
one of the strings `'holding at target'`, `'cooling'`, `'heating'`,
`'idle'`, or `'error'`.

```python
tc_mod.block_temperature_status
```

_New in version 2.0_

## Thermocycler Deactivate

At some points in your protocol, you may want to deactivate specific
temperature controllers of your Thermocycler. This can be done with
three methods, `.ThermocyclerContext.deactivate()`, `.ThermocyclerContext.deactivate_lid()`,
`.ThermocyclerContext.deactivate_block()`.

### Deactivate

This deactivates both the well block and the heated lid of the
Thermocycler.

```python
tc_mod.deactivate()
```

### Deactivate Lid

This deactivates only the heated lid of the Thermocycler.

```python
tc_mod.deactivate_lid()
```

_New in version 2.0_

### Deactivate Block

This deactivates only the well block of the Thermocycler.

```python
tc_mod.deactivate_block()
```

_New in version 2.0_
