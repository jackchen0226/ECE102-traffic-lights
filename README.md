# ECE102-traffic-lights
Team 11's repository for the traffic light project for ECE102

### How to run
This MATLAB code runs a model of an intersection of traffic lights.

Dependencies:

1. LabJack driver for LabJack U3
1. MATLAB wrapper of LabJack U3 API
1. MATLAB R2017a or newer

**Note: The directory 'LJ_controls_to_lights/' must be added to the MATLAB path in order for any LabJack light functions to run.**
___
To download and run this code, clone this repository and run matlab **in the directory of the cloned repository.**

```bash
git clone https://github.com/jackchen0226/ECE102-traffic-lights.git
matlab
```

After MATLAB starts up, run the LJ_driver function. Make sure to have the LabJack U3 plugged into the device. One can check if it is connected through the green LED on the side of the LabJack U3 flashes briefly before constantly staying on.

Run LJ_driver.m from via command line (or script editor).

```matlab
LJ_driver
```