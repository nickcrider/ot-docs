# Simulating with Jupyter Notebook

## Installing the Opentrons Package

To install the Opentrons package into your Jupyter Notebook, you 
must make sure that you install the `opentrons` package for
whichever kernel and virtual environment the notebook is using. A
generally good way to do this is

```python

import sys
!{sys.executable} -m pip install opentrons
```

!!! Note
    you do not need to do this if you want to use the 
    [Robot's Jupyter Notebook](new_advanced_running.md#jupyter-notebook),
    you only need to use `pip` for your locally-installed notebook.

## Using the Simulator in Jupyter or the Python Shell

The Opentrons Python package also provides an entrypoint to use the
Opentrons simulation package from other Python contexts such as an
interactive prompt or Jupyter. To simulate a protocol in Python, open a
file containing a protocol and pass it to
`opentrons.simulate.simulate`:

``` python
from opentrons.simulate import simulate, format_runlog
# read the file
protocol_file = open('/path/to/protocol.py')
# simulate() the protocol, keeping the runlog
runlog, _bundle = simulate(protocol_file)
# print the runlog
print(format_runlog(runlog))
```

The `opentrons.simulate.simulate`
method does the work of simulating the protocol and returns the run log,
which is a list of structured dictionaries.
`opentrons.simulate.format_runlog`
turns that list of dictionaries into a human readable string, which is
then printed out.

## Simulating Cells in Jupyter

In your Jupyter Notebook, you can also use the Python Protocol API simulator
to simulate your cell like this:

```python
from opentrons import simulate
protocol = simulate.get_protocol_api('{! version_info/apilevel.txt !}')
p300 = protocol.load_instrument('p300_single', 'right')
# the rest of your code goes here...
```

The `protocol` object, which is an instance of
`ProtocolContext`, is the same thing
that gets passed to your protocol's `run` function, but set to simulate
rather than control an OT-2. You can call all your protocol's functions
on that object.

If you have a full protocol, wrapped inside a `run` function, defined in
a Jupyter cell you can also use `opentrons.simulate.simulate` as
described above to simulate the protocol.

These instructions also work on the OT-2's Jupyter notebook.

## The Robot's Jupyter Notebook

Your OT-2 also has a Jupyter notebook, which you can use to develop and
execute protocols. For more information on how to execute protocols
using the OT-2's Jupyter notebook, please see
[Advanced Control](new_advanced_running.md). To simulate protocols
on the OT-2's Jupyter notebook, use the instructions above.
