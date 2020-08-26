# Distribute and Consolidate

`distribute()` and `consolidate()` are
similar to `transfer()`, but optimized for specific uses.
`distribute()` is
optimized for taking a large volume from a single (or a small number) of
source wells, and distributing it to many smaller volumes in destination
wells. Rather than using one-to-one transfers, it dispense many times
for each aspirate. `consolidate()` is optimized for taking small volumes from many source
wells and consolidating them into one (or a small number) of destination
wells, aspirating many times for each dispense.

## Consolidate

Volumes going to the same destination well are combined within the same
tip, so that multiple aspirates can be combined to a single dispense.
This is the scenario described by the
[Consolidate])(../new_complex_commands.md#consolidate-diagram) graphic.

```python
pipette.consolidate(30, plate.columns_by_name()['2'], plate.wells_by_name()['A1'])
```

will have the steps...

```
Consolidating 30 from wells A2...H2 in "1" to well A1 in "1"
Transferring 30 from wells A2...H2 in "1" to well A1 in "1"
Picking up tip well A1 in "2"
Aspirating 30.0 uL from well A2 in "1" at 1 speed
Aspirating 30.0 uL from well B2 in "1" at 1 speed
Aspirating 30.0 uL from well C2 in "1" at 1 speed
Aspirating 30.0 uL from well D2 in "1" at 1 speed
Aspirating 30.0 uL from well E2 in "1" at 1 speed
Aspirating 30.0 uL from well F2 in "1" at 1 speed
Aspirating 30.0 uL from well G2 in "1" at 1 speed
Aspirating 30.0 uL from well H2 in "1" at 1 speed
Dispensing 240.0 uL into well A1 in "1"
Dropping tip well A1 in "12"
```

If there are multiple destination wells, the pipette will not combine
the transfers - it will aspirate from one source, dispense into the
target, then aspirate from the other source.

```python
pipette.consolidate(
  30,
  plate.columns_by_name()['1'],
  [plate.wells_by_name()[well_name] for well_name in ['A1', 'A2']])
```

will have the steps...

```
Consolidating 30 from wells A1...H1 in "1" to wells A1...A2 in "1"
Transferring 30 from wells A1...H1 in "1" to wells A1...A2 in "1"
Picking up tip well A1 in "2"
Aspirating 30.0 uL from well A1 in "1" at 1 speed
Aspirating 30.0 uL from well B1 in "1" at 1 speed
Aspirating 30.0 uL from well C1 in "1" at 1 speed
Aspirating 30.0 uL from well D1 in "1" at 1 speed
Dispensing 120.0 uL into well A1 in "1"
Aspirating 30.0 uL from well E1 in "1" at 1 speed
Aspirating 30.0 uL from well F1 in "1" at 1 speed
Aspirating 30.0 uL from well G1 in "1" at 1 speed
Aspirating 30.0 uL from well H1 in "1" at 1 speed
Dispensing 120.0 uL into well A2 in "1"
Dropping tip well A1 in "12"
```

_New in version 2.0_

## Distribute

Volumes from the same source well are combined within the same tip, so
that one aspirate can provide for multiple dispenses. This is the
scenario in the [Distribute](../new_complex_commands.md#distribute-diagram)
graphic.

```python
pipette.distribute(55, plate.wells_by_name()['A1'], plate.rows_by_name()['A'])
```

will have the steps...

```
Distributing 55 from well A1 in "1" to wells A1...A12 in "1"
Transferring 55 from well A1 in "1" to wells A1...A12 in "1"
Picking up tip well A1 in "2"
Aspirating 250.0 uL from well A1 in "1" at 1 speed
Dispensing 55.0 uL into well A1 in "1"
Dispensing 55.0 uL into well A2 in "1"
Dispensing 55.0 uL into well A3 in "1"
Dispensing 55.0 uL into well A4 in "1"
Blowing out at well A1 in "12"
Aspirating 250.0 uL from well A1 in "1" at 1 speed
Dispensing 55.0 uL into well A5 in "1"
Dispensing 55.0 uL into well A6 in "1"
Dispensing 55.0 uL into well A7 in "1"
Dispensing 55.0 uL into well A8 in "1"
Blowing out at well A1 in "12"
Aspirating 250.0 uL from well A1 in "1" at 1 speed
Dispensing 55.0 uL into well A9 in "1"
Dispensing 55.0 uL into well A10 in "1"
Dispensing 55.0 uL into well A11 in "1"
Dispensing 55.0 uL into well A12 in "1"
Blowing out at well A1 in "12"
Dropping tip well A1 in "12"
```

The pipette will aspirate more liquid than it intends to dispense by the
minimum volume of the pipette. This is called the `disposal_volume`, and
can be specified in the call to `distribute()`.

If there are multiple source wells, the pipette will never combine their
volumes into the same tip.

```python
pipette.distribute(
  30,
  [plate.wells_by_name()[well_name] for well_name in ['A1', 'A2']],
  plate.rows()['A'])
```

will have the steps...

```
Distributing 30 from wells A1...A2 in "1" to wells A1...A12 in "1"
Transferring 30 from wells A1...A2 in "1" to wells A1...A12 in "1"
Picking up tip well A1 in "2"
Aspirating 210.0 uL from well A1 in "1" at 1 speed
Dispensing 30.0 uL into well A1 in "1"
Dispensing 30.0 uL into well A2 in "1"
Dispensing 30.0 uL into well A3 in "1"
Dispensing 30.0 uL into well A4 in "1"
Dispensing 30.0 uL into well A5 in "1"
Dispensing 30.0 uL into well A6 in "1"
Blowing out at well A1 in "12"
Aspirating 210.0 uL from well A2 in "1" at 1 speed
Dispensing 30.0 uL into well A7 in "1"
Dispensing 30.0 uL into well A8 in "1"
Dispensing 30.0 uL into well A9 in "1"
Dispensing 30.0 uL into well A10 in "1"
Dispensing 30.0 uL into well A11 in "1"
Dispensing 30.0 uL into well A12 in "1"
Blowing out at well A1 in "12"
Dropping tip well A1 in "12"
```

_New in version 2.0_