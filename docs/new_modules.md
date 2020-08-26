# Hardware Modules

Modules are peripherals that attach to the OT-2 to extend its
capabilities.

We currently support the Temperature, Magnetic and Thermocycler Modules.

## Module Setup

### Loading Your Module Onto the Deck

Like labware and pipettes, you must inform the Protocol API of the
modules you will use in your protocol.

Use `ProtocolContext.load_module()` to
load a module. It will return an object representing the module.

```python
from opentrons import protocol_api

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

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

### Available Modules

The first parameter to
`ProtocolContext.load_module()`, the
module's *load name,* specifies the kind of module to load. Check the
table below for the proper load name to use for each kind of module.

Some modules were added to the Protocol API later than others. Make sure
you use a [Protocol API version](versioning.md) high enough to support all the modules you want to use.

| Module                  | Load Name                               | Minimum API Version |
| ----------------------- | --------------------------------------- | :-----------------: |
| Temperature Module GEN1 | `temperature module` or `tempdeck`      |         2.0         |
| Temperature Module GEN2 | `temperature module gen2`               |         2.3         |
| Magnetic Module GEN1    | `magnetic module` or `magdeck`          |         2.0         |
| Magnetic Module GEN2    | `magnetic module gen2`                  |         2.3         |
| Thermocycler Module     | `thermocycler module` or `thermocycler` |         2.0         |

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

metadata = {'apiLevel': '{! version_info/apilevel.txt !}'}

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






