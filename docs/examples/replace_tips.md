# Replacing Tips During a Run

The API's tip tracking logic will raise a `OutOfTipsError` if you try to `pick_up_tip()` and there aren't enough tips remaining in the rack(s) to complete the operation. To prevent this from happening, you'll need to catch the error and pasue the robot so the user can refill the tips.

This can be done like this:

```python
try:
    p_single.pick_up_tip()
except protocol_api.labware.OutOfTipsError:
    protocol.pause("Replace the tips")
    p_single.reset_tipracks()
    p_single.pick_up_tip()
```