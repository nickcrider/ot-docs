# Copying files to and from your OT-2 with `scp`

`scp` is a command line tool for copying files between devices. You can use it:

- To upload files from your computer to your OT-2. This is useful for things like CSV input files.
- To download files from your OT-2 to your computer. This is useful for things like pictures taken with the OT-2's camera.
- Using `scp` to transfer files is an advanced task. To do it, you should be comfortable with the command line and Linux filesystems.

## Before starting

`scp` is installed alongside SSH, and it shares its first-time setup to configure the OT-2 to accept connections. Before following these instructions, make sure you've completed the SSH setup guide:

[Setting up SSH access to your OT-2](ssh.md){: .md-button }

### Find your OT-2's IP address

In the Opentrons App, find the OT-2 that you want to transfer files to or from. Note the Wired IP or Wireless IP.

- If you use the **Wired IP**, the files will be transferred over the USB connection.
- If you use the **Wireless IP**, the files will be transferred over the Wi-Fi connection. 

These IP addresses will change periodically, especially after the OT-2 is restarted or reconnected. You should double-check the IP address each time you want to make an SSH connection.

### Use `scp` to transfer files

!!! Caution
    These commands must be run on your local machine, not the robot.

#### Download a file from your OT-2 to your computer

```bash
scp -i ot2_ssh_key root@ROBOT_IP:/path/on/ot-2 /path/on/computer
```

- `ROBOT_IP` should be replaced with your robot's actual IP address, as found in step 1.
- `/path/on/ot-2` is where to find the file on your OT-2.
- `/path/on/computer` is where on your computer you want to copy the file to. 
  
#### Upload a file from your computer to your OT-2

```bash
scp -i ot2_ssh_key /path/on/computer root@ROBOT_IP:/path/on/ot-2
```

- `ROBOT_IP` should be replaced with your robot's actual IP address, as found in step 1.
- `/path/on/computer` is where to find the file on your computer.
- `/path/on/ot-2`  is where on your OT-2 you want to copy the file to.


### Where on the OT-2's filesystem can I keep my files?

Most of the OT-2's filesystem is read-only. However, two places you can store files in are:

- The `/data/user_storage` directory, which is good for general-purpose storage.
- The `/var/lib/jupyter/notebooks` directory, which is also be accessible through your OT-2's Jupyter Notebook.
  
Files placed in either of these directories will persist across reboots and software updates.

