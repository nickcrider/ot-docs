# Using the OT-2's Command Line

The OT-2's command line is accessible either by creating a new terminal
in Jupyter or by [using SSH to access its terminal](ssh.md).

To execute a protocol via SSH, copy it to the OT-2 using a program like
`scp` and then use the command line program `opentrons_execute`:


```bash
opentrons_execute /data/my_protocol.py
```

!!! Note
    If you want to invoke `opentrons_execute` in a **remote SSH session**, you
    need to use a login shell (the `-l` switch) to get the proper environment variables:

    ```bash
    ssh root@$ROBOT_IP 'sh -l -c "opentrons_execute /data/my_protocol.py"'
    ```

You can access help on the usage of `opentrons_execute` by calling
`opentrons_execute --help`. This script has a couple options to let you
customize what it prints out when you run it. By default, it will print
out the same runlog you see in the Opentrons App when running a
protocol, as it executes; it will also print out internal logs at level
`warning` or above. Both of these behaviors can be changed.
