# Transfer

The most versatile complex liquid handling function is
`transfer()`. For a majority of use cases you will most 
likely want to use this complex command.

Below you will find a few scenarios using the
`transfer()` command.

_New in version 2.0_

## Basic Usage

This example below transfers 100 µL from well `'A1'` to well `'B1'`
using the P300 Single pipette, automatically picking up a new tip and
then disposing of it when finished.

```python
pipette.transfer(100, plate.wells_by_name()['A1'], plate.wells_by_name()['B1'])
```

When you are using a multi-channel pipette, you can transfer the entire
column (8 wells) in the plate to another using:

```python
pipette.transfer(100, plate.wells_by_name()['A1'], plate.wells_by_name()['A2'])
```

!!! Note
    In API Versions 2.0 and 2.1, multichannel pipettes could only access the
    first row of a 384 well plate, and access to the second row would be
    ignored. If you need to transfer from all wells of a 384-well plate,
    please make sure to use API Version 2.2


!!! Note
    Multichannel pipettes can only access a limited number of rows in a
    plate during `transfer()`, `distribute()` and
    `consolidate()`: the first row (wells A1 - A12) of a 96-well plate, and
    (since API Version 2.2) the first two rows (wells A1 - B24) for a
    384-well plate. Wells specified outside of the limit will be ignored.


Transfer commands will automatically create entire series of
`aspirate()`, `dispense()`, and other `InstrumentContext` commands.

## Large Volumes

Volumes larger than the pipette's `max_volume` (see
[Defaults](../pipettes/defaults.md)) will automatically divide into
smaller transfers.

```python
pipette.transfer(700, plate.wells_by_name()['A2'], plate.wells_by_name()['B2'])
```

will have the steps...

```
Transferring 700 from well A2 in "1" to well B2 in "1"
Picking up tip well A1 in "2"
Aspirating 300.0 uL from well A2 in "1" at 1 speed
Dispensing 300.0 uL into well B2 in "1"
Aspirating 200.0 uL from well A2 in "1" at 1 speed
Dispensing 200.0 uL into well B2 in "1"
Aspirating 200.0 uL from well A2 in "1" at 1 speed
Dispensing 200.0 uL into well B2 in "1"
Dropping tip well A1 in "12"
```

## One to One

Transfer commands are most useful when moving liquid between multiple
wells. This will be a one to one transfer from where well `A1`'s
contents are transferred to well `A2`, well `B1`'s contents to `B2`,and
so on. This is the scenario displayed in the
[Transfer](../new_complex_commands.md#transfer-diagram) visualization.

```python
pipette.transfer(100, plate.columns_by_name()['1'], plate.columns_by_name()['2'])
```

will have the steps...

```
Transferring 100 from wells A1...H1 in "1" to wells A2...H2 in "1"
Picking up tip well A1 in "2"
Aspirating 100.0 uL from well A1 in "1" at 1 speed
Dispensing 100.0 uL into well A2 in "1"
Aspirating 100.0 uL from well B1 in "1" at 1 speed
Dispensing 100.0 uL into well B2 in "1"
Aspirating 100.0 uL from well C1 in "1" at 1 speed
Dispensing 100.0 uL into well C2 in "1"
Aspirating 100.0 uL from well D1 in "1" at 1 speed
Dispensing 100.0 uL into well D2 in "1"
Aspirating 100.0 uL from well E1 in "1" at 1 speed
Dispensing 100.0 uL into well E2 in "1"
Aspirating 100.0 uL from well F1 in "1" at 1 speed
Dispensing 100.0 uL into well F2 in "1"
Aspirating 100.0 uL from well G1 in "1" at 1 speed
Dispensing 100.0 uL into well G2 in "1"
Aspirating 100.0 uL from well H1 in "1" at 1 speed
Dispensing 100.0 uL into well H2 in "1"
Dropping tip well A1 in "12"
```

_New in version 2.0_

## One to Many

You can transfer from a single source to multiple destinations, and the
other way around (many sources to one destination).

```python
pipette.transfer(100, plate.wells_by_name()['A1'], plate.columns_by_name()['2'])
```

will have the steps...

```
Transferring 100 from well A1 in "1" to wells A2...H2 in "1"
Picking up tip well A1 in "2"
Aspirating 100.0 uL from well A1 in "1" at 1 speed
Dispensing 100.0 uL into well A2 in "1"
Aspirating 100.0 uL from well A1 in "1" at 1 speed
Dispensing 100.0 uL into well B2 in "1"
Aspirating 100.0 uL from well A1 in "1" at 1 speed
Dispensing 100.0 uL into well C2 in "1"
Aspirating 100.0 uL from well A1 in "1" at 1 speed
Dispensing 100.0 uL into well D2 in "1"
Aspirating 100.0 uL from well A1 in "1" at 1 speed
Dispensing 100.0 uL into well E2 in "1"
Aspirating 100.0 uL from well A1 in "1" at 1 speed
Dispensing 100.0 uL into well F2 in "1"
Aspirating 100.0 uL from well A1 in "1" at 1 speed
Dispensing 100.0 uL into well G2 in "1"
Aspirating 100.0 uL from well A1 in "1" at 1 speed
Dispensing 100.0 uL into well H2 in "1"
Dropping tip well A1 in "12"
```

_New in version 2.0_

## List of Volumes

Instead of applying a single volume amount to all source/destination
wells, you can instead pass a list of volumes.

```python
pipette.transfer(
    [20, 40, 60],
    plate['A1'],
    [plate.wells_by_name()[well_name] for well_name in ['B1', 'B2', 'B3']])
```

will have the steps...

```
Transferring [20, 40, 60] from well A1 in "1" to wells B1...B3 in "1"
Picking up tip well A1 in "2"
Aspirating 20.0 uL from well A1 in "1" at 1 speed
Dispensing 20.0 uL into well B1 in "1"
Aspirating 40.0 uL from well A1 in "1" at 1 speed
Dispensing 40.0 uL into well B2 in "1"
Aspirating 60.0 uL from well A1 in "1" at 1 speed
Dispensing 60.0 uL into well B3 in "1"
Dropping tip well A1 in "12"
```

_New in version 2.0_