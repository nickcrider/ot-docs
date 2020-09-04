# Using the API

Now that you're familiar with the basic structure of protocols, 
we can start to do more than just move 100 uL from 
`'A1` to `'B1'`. The liquid handling commands in the API are 
broken into two categories: 

- [Building Block Commands](new_atomic_commands.md), and
- [Complex Commands](new_complex_commands.md)

## Building Block Commands

The Building Blocks are the simplest commands you can 
perform on the robot (generally one movement, like `aspirate()` and 
`dispense()` you saw earlier) and can be used together 
to create more complex liquid handling patterns. For example:

``` python
pipette.pick_up_tip()
pipette.aspirate(300, plate['A1'])
pipette.dispense(100, plate['B2'])
pipette.dispense(100, plate['B3'])
pipette.dispense(100, plate['B4'])
pipette.drop_tip()
```
## Complex Commands

The Complex Commands are simply functions we've created from the 
Building Block Commands for your convenience. These functions, like 
`transfer()` and `distribute()` make it easier to handle larger 
groups of wells and repetitive actions. Turning the code segment above 
into something more compact:

```python
pipette.transfer(100, plate['A1'], 
                     [plate['B2'], plate['B3'], plate['B4']])
```

## Choosing Which Command Set to Use

In general, the Building Block Commands give you the highest level 
of control over everything the robot does, while the Complex Commands make 
things a bit easier to use, at the cost of some flexibility. But, the good 
news is you don't have to stick to one or the other! Like any 
Python program you can mix and match to suit your individual needs.

After all, our `transfer()` is really just made up of a series of corresponding 
Building Block Commands. We've just chosen (what we think are) sensible defaults, 
like dropping the tip in the trash when done, rather than returning it to the box, 
or some other place. So if those defaults don't work for you, it's easy to use the 
power of Python to define your own `my_transfer()` that does exactly what you want!

## Examples

To get an idea of the differences between the Building Block Commands and the 
Complex Commands, see these examples of common liquid handling techniques:

- [Basic Transfer](examples/basic_transfer.md)
- [Dilution](examples/dilution.md)
- [Loops](examples/loops.md)
- [Multiple Air Gaps](examples/multiple_air_gaps.md)
- [Plate Mapping](examples/plate_mapping.md)

Where appropriate, these example protocols compare and contrast the two command sets.