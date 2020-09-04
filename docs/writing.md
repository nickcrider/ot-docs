# Using Python For Protocols

Writing protocols in Python requires some up-front design before seeing
your liquid handling automation in action. At a high-level, writing
protocols with the OT-2 Python Protocol API looks like:

1.  Write a Python protocol
2.  Test the code for errors
3.  Repeat steps 1 & 2
4.  Calibrate labware on your OT-2
5.  Run your protocol

These sets of documents aim to help you get the most out of steps 1 & 2,
the "design" stage.

## Working with Python

Using a popular and free code editor, like [Visual Studio Code](https://code.visualstudio.com/), 
is the recommended method for writing Python protocols. It has great documentation and 
a lot of awesome features to help get you started writing your own python code.

!!! Note
    Make sure that when saving a protocol file, it ends with the `.py` file
    extension. This will ensure the Opentrons App and other programs are
    able to properly read it.

    For example, `my_protocol.py`

## Python for Beginners

If Python is new to you, we suggest going through a few simple tutorials
to acquire a base understanding to build upon. The following tutorials
are a great starting point for working with the Protocol API (from
[learnpython.org](http://www.learnpython.org/)):

1.  [Hello World](http://www.learnpython.org/en/Hello%2C_World%21)
2.  [Variables and
    Types](http://www.learnpython.org/en/Variables_and_Types)
3.  [Lists](http://www.learnpython.org/en/Lists)
4.  [Basic Operators](http://www.learnpython.org/en/Basic_Operators)
5.  [Conditions](http://www.learnpython.org/en/Conditions)
6.  [Loops](http://www.learnpython.org/en/Loops)
7.  [Functions](http://www.learnpython.org/en/Functions)
8.  [Dictionaries](http://www.learnpython.org/en/Dictionaries)

After going through the above tutorials, you should have enough of an
understanding of Python to work with the Protocol API and start
designing your experiments! More detailed information on Python can
always be found at [the Python docs](https://docs.python.org/3/index.html)
