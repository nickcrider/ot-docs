# Setting Up SSH access to the OT-2

SSH is a way to connect to and control your OT-2 over the command line. It's required for some troubleshooting and advanced tasks.

This guide will walk you through setting up SSH for the first time. There are two parts to the process: installing SSH on your computer, and configuring your OT-2 to accept SSH connections from your computer.

You will create a special pair of files called an SSH key pair. The key pair comprises a private key, which remains on your computer, and a public key, which you will copy to your OT-2.

Setup will require a USB connection to your OT-2. After setup is complete, you will also be able to connect to your OT-2 with SSH over Wi-Fi. 

This guide applies to software versions 3.16.0 and later. 

## Install prerequisites

You may need to install two small third-party tools:

- **OpenSSH**, the SSH implementation that we recommend.
- **cURL**, a tool to send simple network requests, which we need for setup.

### On macOS

OpenSSH and cURL are both already installed by default on macOS. 

### On Linux

OpenSSH and cURL might be installed by default, depending on your distribution. If they're not, use your distribution's package manager to install them (for instance, `sudo apt install ssh curl`).

### On Windows 10 

Microsoft provides OpenSSH as a separately installable Windows component. 

Open Settings. Go to **Apps > Apps and Features > Manage Optional Features**. Scan the list to see if OpenSSH Client is already there. If it's missing, at the top of the page, select Add a feature, locate OpenSSH Client, and install it.

You don't need to install cURL on Windows; a different tool will replace it.

## Open the command line

Setup will take place over the command line. Don't worry if you've never used it before—we will walk you through it!

Open a new PowerShell window (if you're using Windows 10) or a new Terminal window (if you're using Linux or macOS).

!!! Note
    You should copy and paste the commands you see in this guide instead of trying to type them out yourself.

    However, copying and pasting works a little differently on the command line. The usual Ctrl+C and Ctrl+V keyboard shortcuts will do something else!

    Instead, to paste commands, do this:

    On Linux or macOS, right-click inside the Terminal window and select Paste.
    On Windows, right-click the title bar of the PowerShell window and select **Edit > Paste**.

## Generate a key pair

### 1. Run `ssh-keygen`

Having installed OpenSSH and opened a command line, you will have access to the `ssh-keygen` command. Paste into the window:

```bash
ssh-keygen -f ot2_ssh_key
```

And press Enter.

### 2. Enter a passphrase

The program will let you to choose a passphrase. You will use this passphrase later when you connect to your OT-2 over SSH.

Providing a passphrase is optional, but we strongly recommend it. (Otherwise, anyone who has access to the file on your computer could also access your OT-2.)

When you type in the passphrase, your typing won't show up. Don't worry—it's just being hidden for security! Press Enter when you've finished, and then enter the passphrase again to confirm it.

!!! Warning
    If you lose this passphrase, you won't be able to recover it, and you'll have to start this guide all over to connect to your OT-2. We recommend storing your passphrase somewhere secure, like a password manager. 

### 3. Your new SSH key pair

After entering a passphrase, you should see two files in your home directory:

- `ot2_ssh_key`, which will stay on your computer.
- `ot2_ssh_key.pub`, which will be copied onto your OT-2.
  
Before continuing, make sure those files exist. Enter:

```bash
cat ot2_ssh_key.pub
```

If you see successful output, congratulations! Your new SSH key is ready to install.

## Install the key on your OT-2 

Now that you've created an SSH key pair, you'll install the public key to your OT-2. This will tell the OT-2 to accept connections from the matching private key, on your computer.

### 1. Connect via USB

To show that you have physical access to the OT-2, you must connect to it via USB for this part. A Wi-Fi connection won't work. Plug in the USB cable, and confirm that your OT-2 is shown with a USB icon in the Opentrons App. You may need to refresh the list. 


### 2. Find your OT-2's wired IP address

In the Opentrons App, find and take note of the part of your robot's Wired IP.
It's shown under the Connectivity section of the App.

### 3. Upload your public key

Paste the following command, but don't press Enter yet—we will have to modify it slightly.

=== "MacOS/Linux"

    ```bash
    curl \
    -H 'Content-Type: application/json' \
    -d "{\"key\":\"$(cat ot2_ssh_key.pub)\"}" \
    ROBOT_IP:31950/server/ssh_keys
    ```

=== "Windows 10"

    ```bash
    @{key = Get-Content ot2_ssh_key.pub | Out-String} | ConvertTo-Json | Invoke-WebRequest -Method Post -ContentType 'application/json' -Uri ROBOT_IP:31950/server/ssh_keys 
    ```

Use the arrow keys to move to the part of the command that says `ROBOT_IP`. Replace `ROBOT_IP` with the actual wired IP address you found above.

Press Enter to run the command. It shouldn't take more than a second. If all goes well, you should see a response containing the phrase "Added key."

### Resolving `'{key' is not recognized` errors

If you see an error message like this, you're using Command Prompt instead of PowerShell. Open a PowerShell window and try the command again.

### Resolving "The response content can't be parsed because the Internet Explorer engine isn't available" errors

If you see an error message like this, open Internet Explorer, go through its first-time setup, and then run the command again. PowerShell relies on Internet Explorer to configure some network settings.

## Connect to your OT-2 with SSH 

Congratulations! You've completed the first-time setup, and you're ready to finally connect.

### 1. Find your OT-2's IP address

In the Opentrons App, find the OT-2 that you want to connect to. Note its Wired IP or Wireless IP. 

If you use the Wired IP, the SSH connection will be made over USB.
If you use the Wireless IP, the SSH connection will be made over Wi-Fi.

These IP addresses will change periodically, especially after the OT-2 is restarted or reconnected. You should double-check the IP address each time you want to make an SSH connection.

### 2. Connect

Open a PowerShell window if you're on Windows 10, or a Terminal window if you're on Linux or macOS.

Enter the following command. Replace `ROBOT_IP`  with the IP address you found above.

```bash
ssh -i ot2_ssh_key root@ROBOT_IP
```

You may see a short warning saying "Permanently added [IP address] to the list of known hosts." You can safely ignore it.

### 3. After connecting
If the connection worked, you'll be greeted by the Opentrons logo. :opentrons-ot-droplet: 

Try running some commands on your OT-2. For example, enter the command: 

```bash
whoami
```

You should see the command output `root`. 