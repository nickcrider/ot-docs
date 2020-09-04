# Simulating on the Command Line

Simulating protocols requires the `opentrons` package installed.
The best way to do that is to get it from Python's
package manager, `pip`.


## Installation

First, you'll need to install install Python 3.7.6 ([Windows
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
