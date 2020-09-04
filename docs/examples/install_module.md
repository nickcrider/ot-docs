# Installing Python Packages on the OT-2

If you're writing protocols in our Python API, and you want to take advantage of the full power of Python, you might want to import some code from a package outside Python's standard library.

The package could be one of the great packages already made by the Python community, or one you wrote yourself. 

Currently, this is an advanced task. You should be comfortable with the command line to do it.

Some useful packages already come installed on your OT-2:

- NumPy
- Pandas


## Installing a package from the Python community

Installing a python package that's already built (for example, `flask`), is 
super easy. All you need to do is: 

1. [SSH into your OT-2](ssh.md).
2. Use `pip` to install the package from PyPI.

Then, you can upload protocols that import and use the package. Most packages, 
except some that depend on a compiler (see below) will be installable through `pip`.

## Installing a self-written Python package

If you have a set of functions or variables that you use often, you might want to consider creating your own Python package. This will save you the need to rewrite them. All you need to do is import the module into a protocol similar to how you would a third-party Python package. 


We advise using a text editor to create the module on your computer. The OT-2 is limited to command-line editors which makes it difficult to write complex or long modules. 

You can then transfer the files to your OT-2 by using `scp` and import them as normal.

## FAQ

### Can I upload protocols comprising multiple Python files through the Opentrons App?

Not currently.

Instead, write your protocol so that it's a single self-contained Python file.

Or, as described above, collect your additional files into a package, and use `pip` to install it. 
 

## Troubleshooting

### Certain packages can't be installed

Some of the more sophisticated Python packages, like NumPy (luckily this already comes installed on your OT-2), aren't written purely in Python. Parts of them are written in other languages, like C.

You won't be able to install those packages on the OT-2. They require a compiler, which the OT-2 doesn't have. If you try, you'll see an error like this:

```bash
compilation terminated
error: command 'get' failed with exit status 1
```

If one of these packages is critical to your workflow, you can request our team to install it by default on all OT-2, starting with the next software update.

First, please search our Github repository issues to see if someone else has already requested that Python package. If they have, please thumbs-up their issue instead of making a new one.

Otherwise, you can make a new issue to request the package. In the issue, please tell us a little bit about how you plan on using the package and why it's necessary. This will help our software engineers fulfill the request efficiently—or suggest an alternative, if there is one.


### `ModuleNotFoundError`

If your Python API protocol uses a third-party Python package, and you see an error like:

```
ModuleNotFoundError [line x]: No module named 'example'
```

It's probably because you're trying to use a package that's not yet installed on your OT-2. Follow the steps above to install it.