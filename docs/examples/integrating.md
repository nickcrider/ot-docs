# Integrating the OT-2 with a Server

The core of the OT-2 is a Raspberry Pi 3+ running a custom Linux distribution.

It connects to your computer either via a Wi-Fi network, or via a USB-to-Ethernet adapter. 
Either way, it communicates with your computer using networking technology, and therefore 
can be communicated with and controlled using tools designed to talk to Linux computers via the network, like SSH.

Most of the filesystem is read-only. You should only keep your data in `/data` or `/mnt/usbdrive`. 
The OT-2 also runs a web server. This web server is what the Opentrons App talks to, and is how protocols are run. 
An important thing to note about the Python code on GitHub is that it won't control the robot from your computer. 
The only way to control the robot from your computer is through the web server. The Python 
code on GitHub is the code that runs on the robot itself, and we refer customers to it either:

- to use as a reference when writing code that interacts with it on the robot, or 
- to simulate protocols on their computer. 

**Summary:** The robot runs a Linux system that executes Python code to control its hardware 
and provide a web server. The only way to control the robot is by running Python code on 
the robot. Data can be persistently saved and loaded in `/data` or `/mnt/usbdrive`.

## Case Study Example

In the following sections, we’ll consider a case study of integration: a protocol that 
requires talking to a balance that communicates via serial, some other instrument that 
communicates over the network using VISA, and an OT-2.

### Integrating By Putting The OT2 In Control

Since the robot runs Linux and is connected to the network, and has USB ports available 
on the Raspberry Pi, the code that controls the lab equipment could run on the OT2 
itself. This is the simplest-to-implement method of integration. In our case study, you could therefore:

- Connect the balance via a USB/serial adapter (FTDI) to a free USB port on the OT-2’s Raspberry PI
- Connect the OT-2 and the VISA instrument to the same network
- Using `pip`, install `pyvisa` on the OT-2
- Write Python code that runs the protocol and runs on the OT-2

The Python code would, in addition to containing the normal protocol commands, connect to the balance via serial and the other instrument using pyVISA. You would run this code by transferring it to the robot using scp. You'll need to set up SSH access to your robot first.

```bash
scp ./my-protocol.py robot-ip:/data/my-protocol.py
```

and then use ssh to remote into the robot and start the protocol:

```bash
ssh root@robot-ip -l -c "nohup python /data/my_protocol.py"
```

!!! Note
    The `nohup` command means the command will continue even if the SSH session goes away.

    The `-l` switch give you a login shell for the remote SSH session, which is required for the correct functioning of the API.

We’re transferring the protocol to the robot and executing it directly rather than using the Opentrons 
app to avoid having to add a bunch of checks if the robot is simulating. The protocol could save data 
to files in `/data`, which you can retrieve after the protocol finishes using `scp`. It could also, 
since it's network-connected, transfer the files directly via the network to your computer.

**Summary:** Connect everything to the OT-2 and write a protocol that controls everything, saving and loading data either to the `/data` directory on the OT-2 or, via the network, on your computer.


### Integrating While Keeping Your Computer In Control

Another option is to write a Python protocol that connects back to your computer. In our case study, you would:

- Connect the balance to your computer
- Have the code that interacts with the VISA instrument on your computer
- On your computer, run code that listens for the OT-2 protocol to reach out and talk to it
- Write a Python protocol that's uploaded through the Opentrons app and reaches out and talks to your server

This can be complex, but it does mean that your computer stays in control and you have minimal custom code to write. Consider writing a simple Python server using [Flask](http://flask.pocoo.org/), [Bottle](https://bottlepy.org/docs/dev/), or [AIOHTTP](https://aiohttp.readthedocs.io/en/stable/) (it’s your choice - it will be on your computer. We like AIOHTTP, though).You set up a route called /update, which something can POST to with a step name, and will return either "wait" or "proceed":

```python
from aiohttp import web # You can install aiohttp with pip
import json

async def update(request):
    """
    This function serves POST /update.

    The request should have a json body with a "step" key that at some point
    has the value "done-aspirating".

    It will return a json message with appropriate HTTP status.
    """
    try:
        body = await request.json()
    except json.JSONDecodeError:
        text = await body.text()
        print(f"Request was not json: {text}")
        return web.json_response(status=400, # Bad Request
                                 data={'error': 'bad-request'})
    if 'step' not in body:
        print(f"Body did not have a 'step' key")
        return web.json_response(status=400, # Bad Request
                                 data={'error': 'no-step'})
    if body['step'] == 'done-aspirating':
       # Here you might for instance check a balance
       # attached to the computer to validate apsiration
       print("Robot is done aspirating")
       return web.json_response(status=200, # OK
                                data={'done': True})

# Create and run the actual server application
app = web.Application()
# Install the update function to serve the /update endpoint for POST
app.router.add_post('/update', update)
# Run the application
web.run_app(app, # our application
            host='0.0.0.0', # listen on all network interfaces
                            # (change to 127.0.0.1 to listen only to
                            # requests from this computer for testing)
            port=80)        # the standard http port; may need to
                            # change to something else if another
                            # server is running
```

The Python protocol gets to a certain step, hits that endpoint, and either waits or proceeds:

```python
import requests # you can install this with pip
 
def run(protocol): 
  tiprack = protocol.load_labware('opentrons_tiprack_300ul', '1')
  trough = protocol.load_labware('nest_12_reservoir_15ml', '2')
  pipette = protocol.load_instrument('p300_single', 'right', tip_racks=[tiprack])

  pipette.pick_up_tip()
  pipette.aspirate(10, trough.wells()['A1'])

  done = False   # Poll to see if the server wants you to proceed
  while not done:
    r = requests.post('http://127.0.0.1/update', json={'step': 'done-aspirating'}) 
    done = r.json()['done'] 
  
  pipette.dispense() 
```

This protocol can be simulated with opentrons_simulate while the server runs in another terminal. You will see the server print "Robot is done aspirating."

When this protocol is run through the opentrons run app, it will be simulated 
before it actually runs. That means that the protocol will run without the robot 
moving, including making the `POST` request to your computer. To avoid this, 
you can only do the request if `protocol.is_simulating()` is `False`. If you want 
to avoid simulation entirely, you can transfer the protocol to the robot with `scp` and run it directly there, as above.

When the protocol is run on the robot, you must also change `127.0.0.1` to the IP address of your computer.

**Summary:** Write a protocol that connects to a web server on your computer. Your computer 
is connected to the other equipment and waits for the protocol to connect and say it's ready.

## Conclusion

One of these two methods should help out most integration tasks. If they don’t, keep 
in mind that fundamentally the OT-2 is just a computer that runs Linux that happens 
to be connected to some hardware, and has a Python module for controlling that hardware 
already installed. Opentrons has plans to make this sort of task easier in the future; but right now, this is what we’ve got.
