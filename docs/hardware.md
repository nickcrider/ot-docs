# Opentrons Hardware

This section shows you how to interact with hardware in the API. The API makes 
it easy to manage the pipettes attached to your robot, the labware you're using 
to hold your reagents, and (optionally) the Opentrons Hardware modules that enable 
additional workflows.

Specifically, you'll learn how the API handles:

- Opentrons Pipettes
- Labware
- Opentrons Modules

## Pipettes

Before you can move any liquids around, you need to attach pipettes to your 
OT-2 first. They come in a variety of ranges and are accessed with a simple 
load string.

| Pipette           | Range         | Model Name            |
| ----------------- | ------------- | --------------------- |
| P20 Single GEN2   | 1–20 µL     | `'p20_single_gen2'`   |
| P300 Single GEN2  | 20–300 µL   | `'p300_single_gen2'`  |
| P1000 Single GEN2 | 100–1000 µL | `'p1000_single_gen2'` |
| P300 Multi GEN2   | 20–300 µL     | `'p300_multi_gen2'`   |
| P20 Multi GEN2    | 1–20 µL       | `'p20_multi_gen2'`    |

Once you've gotten them physically attached, [the next section of the guide](new_pipette.md) will show 
you how to use them.

## Labware

Besides pipettes, the most important part of liquid handling is having 
something to put the liquids in! That's where labware comes in. The API 
needs _Labware Definitions_ so it can understand the geometry of your plates, 
tubes, etc. and know where to find and move your liquids.

We support a [growing range](https://labware.opentrons.com/) of standard 
automation compatible ([SBS footprint](https://www.slas.org/SLAS/assets/File/ANSI_SLAS_1-2004_FootprintDimensions.pdf)) 
labware. And if you don't see the labware you want to 
use in the library, you can easily [create your own using our web tool](https://labware.opentrons.com/create), 
or you can [submit a request](https://support.opentrons.com/en/articles/3137452-requesting-a-custom-labware-definition) 
to our team to have them create one for you.

In our API labware is defined in JSON files. Once you have your labware definition, 
you can follow along to learn [how to access your labware](new_labware.md).

## Opentrons Modules

If you want your OT-2 to do something more than just move liquids around, 
you can use one (or all!) of our modules right on the deck! Our range of 
modules currently includes: 

- [Temperature Module](modules/temperature.md)
- [Magnetic Module](modules/magnet.md)
- [Thermocycler](modules/thermocycler.md)