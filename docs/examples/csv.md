# Loading Data from a CSV

## Overview
CSV files can store a table of values. You might want to use them for things like specifying liquid volumes across a well plate.

Since protocols written with our Python Protocol API have the full power of Python, they can read, parse, and use CSV data however you want! 👩‍💻

## Ways of using CSV data in Python protocols
### Embed the data into the protocol itself
The easiest way to use CSV data in your Python protocol is just to open the CSV in a text editor and copy and paste the CSV data into your Python script as a big string. From there, you can use the standard [csv](https://docs.python.org/3/library/csv.html) module to parse the data like this:

```python
import csv

csv_raw = '''
source_well,destination_well,transfer_volume
A1,A2,10
B1,B2,20
'''

csv_data = csv_raw.splitlines()[1:] # Discard the blank first line.
csv_reader = csv.DictReader(csv_data) 
for csv_row in csv_reader:
    source_well = csv_row['source_well']
    destination_well = csv_row['destination_well']
    transfer_volume = float(csv_row['transfer_volume'])
```

### Upload the files over the command line with `scp`
If you prefer to keep the CSV data in its own file, you can use `scp`  to upload it to your OT-2. This requires some familiarity with the command line. See: Copying files to and from your OT-2 with scp.

Your protocol can use the usual Python I/O to read the file, and the [csv](https://docs.python.org/3/library/csv.html) module to parse it.

### Can I upload CSV files through the Opentrons App?
Currently, the Opentrons App does not support uploading CSV files. Use one of the above alternatives instead.