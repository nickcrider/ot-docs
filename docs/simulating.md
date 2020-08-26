# Simulating Protocols

Simluating protocols requires the `opentrons` package installed.
The best way to do that is to get it from Python's
package manager, `pip`. The exact method of installation is
slightly different depending on whether you use Jupyter on your computer or not.

!!! Note
    you do not need to do this if you want to use the 
    [Robot's Jupyer Notebook](new_advanced_running.md#jupyter-notebook),
    you only need to use `pip` for your locally-installed notebook.

## Installation

First, install Python 3.7.6 ([Windows
x64](https://www.python.org/ftp/python/3.7.6/python-3.7.6-amd64.exe),
[Windows x86](https://www.python.org/ftp/python/3.7.6/python-3.7.6.exe),
[OS X](https://www.python.org/ftp/python/3.7.6/python-3.7.6-macosx10.6.pkg))
or higher on your local computer.

Once the installer is done, make sure that Python is properly installed
by opening a terminal and running:

=== "MacOS/Linux"

    ```bash

    python --version
    ```

=== "Windows"

    ```bash

    python.exe --version
    ```

If this is not higher than 3.7.6, you have another version of Python installed; this
happens frequently on OS X and sometimes on Windows. We recommend using
a tool like [pyenv](https://github.com/pyenv/pyenv) to manage multiple
Python versions. This is particularly useful on OS X, which has a
built-in install of Python 2.7 that should not be removed.

Once Python is installed, install the [opentrons
package](https://pypi.org/project/opentrons/) using `pip`:

=== "MacOS/Linux"

    ```bash

    pip install opentrons
    ```

=== "Windows"

    ```bash

    pip.exe install opentrons
    ```


You should see some output that ends with
`Successfully installed opentrons-{! version_info/build.txt !}`. 
If you don't, you may need to [install `pip`](https://pip.pypa.io/en/stable/installing/).

### Jupyter Installation

To install the Opentrons package into your Jupyter Notebook, you 
must make sure that you install the `opentrons` package for
whichever kernel and virtual environment the notebook is using. A
generally good way to do this is

```python

import sys
!{sys.executable} -m pip install opentrons
```

## Using `opentrons_simulate`

Now that the Opentrons package is installed in your environment, 
it's time to simulate your first protocol. To do that, just 
use the `opentrons_simulate` command:

=== "MacOS/Linux"

    ```bash

    opentrons_simulate my_protocol.py
    ```

=== "Windows"

    ```bash

    opentrons_simulate.exe my_protocol.py
    ```

The simulator will print out a log of the actions in the protocol 
similar to the Opentrons App; it will also print out any log
messages caused by a given command along with that list of actions. If
there is a problem with the protocol, the simulation will stop and the
error will be printed.

If needed, the simulation script can also be invoked through Python:

```bash

python -m opentrons.simulate /path/to/protocol
```

`opentrons_simulate` has several command line options that might be
useful. Some options are explained below, but to see all options you can
run

=== "MacOS/Linux"

    ```bash

    opentrons_simulate --help
    ```

=== "Windows"

    ```bash

    opentrons_simulate.exe --help
    ```


### Using Custom Labware

By default, `opentrons_simulate` will load custom labware definitions
from the directory in which you run it. You can change the directory
`opentrons_simulate` searches for custom labware with the
`--custom-labware-path` option:

=== "MacOS/Linux"

    ```bash

    opentrons_simulate --custom-labware-path="/path/to/labware"
    ```

=== "Windows"

    ```bash

    opentrons_simulate.exe --custom-labware-path="C:\Custom Labware"
    ```

### Configuration and Local Storage

The Opentrons Python package uses a folder in your user directory as a
place to store and read configuration and changes to its internal data.
This location is `~/.opentrons` on Linux or OSX and
`C:\Users\%USERNAME%\.opentrons` on Windows.

## Using the Simluator in Jupyter or the Python Shell

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

## Using Jupyter

In your Jupyter notebook, you can also use the Python Protocol API simulator
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



Robot's Jupyter Notebook
------------------------

Your OT-2 also has a Jupyter notebook, which you can use to develop and
execute protocols. For more information on how to execute protocols
using the OT-2's Jupyter notebook, please see
[Advanced Control](new_advanced_running.md). To simulate protocols
on the OT-2's Jupyter notebook, use the instructions above.
