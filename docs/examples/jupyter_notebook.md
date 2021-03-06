# Using the OT-2's Jupyter Notebook

The OT-2 runs a Jupyter Notebook server that you can connect to with
your web browser. This is a convenient environment in which to write and
debug protocols, since you can define different parts of your protocol
in different notebook cells and run only part of the protocol at a given
time.

You can access the OT-2's Jupyter Notebook by following these steps:

1.  Open your Opentrons App and look for the IP address of your OT-2 on
    the information page.
2.  Type in `(Your OT-2's IP Address):48888` into any browser on your
    computer.

Here, you can select a notebook and develop protocols that will be saved
on the OT-2 itself. These protocols will only be on the OT-2 unless
specifically downloaded to your computer using the `File / Download As`
buttons in the notebook.

### Protocol Structure

To take advantage of Jupyter's ability to run only parts of your
protocol, you have to restructure your protocol - turn it inside out.
Rather than writing a single `run` function that contains all your
protocol logic, you can use the function
`opentrons.execute.get_protocol_api`,
into which you pass the same API version (see
[Versioning](../versioning.md)) that you would specify in
your protocol's metadata:

```python
import opentrons.execute
protocol = opentrons.execute.get_protocol_api('{! version_info/apilevel.txt !}')
protocol.home()
```

This returns the same kind of object - a
`ProtocolContext` - that's passed
into your protocol's `run` function when you upload your protocol in
the Opentrons App. Full documentation on the capabilities and use of the
`ProtocolContext` object is
available in the other sections of this guide:

- [Pipettes](../new_pipette.md),
- [Building Block Commands](../new_atomic_commands.md),
- [Complex Commands](../new_complex_commands.md),
- [Labware](../new_labware.md), and
- [Hardware Modules](../new_modules.md)
  
See the [API Version 2 Reference](../new_protocol_api.md) for all the details.

Whenever you call `get_protocol_api`, the robot will update its cache of
attached instruments and modules. You can call `get_protocol_api`
repeatedly; it will return an entirely new
`ProtocolContext` each time, without
any labware loaded or any instruments established. This can be a good
way to reset the state of the system, if you accidentally loaded in the
wrong labware.

Now that you have a `ProtocolContext`, you call all its methods just as you would in a protocol,
without the encompassing `run` function, just like if you were
prototyping a plotting or pandas script for later use.

!!! Note
    Before you can command the OT-2 to move using the protocol API you have
    just built, you must home the robot using `protocol.home()`. If you try
    to move the OT-2 before you have called `protocol.home()`, you will get
    a `MustHomeError`.


### Running A Previously-Written Protocol

If you have a protocol that you have already written you can run it
directly in Jupyter. Copy the protocol into a cell and execute it - this
won't cause the OT-2 to move, it just makes the function available.
Then, call the `run` function you just defined, and give it a
`ProtocolContext`:

```python
import opentrons.execute
from opentrons import protocol_api
def run(protocol: protocol_apiProtocolContext):
    # the contents of your protocol are here...

protocol = opentrons.execute.get_protocol_api('{! version_info/apilevel.txt !}')
run(protocol)  # your protocol will now run
```

### Custom Labware

If you have custom labware definitions you want to use with Jupyter,
make a new directory called "labware" in Jupyter and put the
definitions there. These definitions will be available when you call
`load_labware`.