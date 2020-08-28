# Skipping Simulation

By default all protocols are simulated when you upload them throught the app. 
The simulation process is needed so the API can determine which pipettes, 
modules, and labware is needed for your protocol.

This means that all code in your protocol is technically executed twice: once when the protocol is first simulated, and then again when the protocol is actually exceuted on the robot.

To Prevent this behavior you need to check `protocol.is_simulating()`