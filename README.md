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
___

### I/O channels

| Bit #  | Light group        | Channel |
| ------ |:------------------:| -------:|
| 0      | N/S buttons        |  FIO_0  |
| 1      | E/W buttons        |  FIO_1  |
| 2      | N/S traffic red    |  FIO_2  |
| 3      | E/W traffic red    |  FIO_3  |
| 4      | N/S traffic yellow |  FIO_4  |
| 5      | E/W traffic yellow |  FIO_5  |
| 6      | N/S traffic green  |  FIO_6  |
| 7      | E/W traffic green  |  FIO_7  |
| /      | N/S ped. red       |  DAC_0  |
| /      | E/W ped. red	      |  DAC_1  |
| 8  (4) | N/S ped. white     |  EIO_0  |
| 9  (12)| E/W ped. white     |  EIO_1  |
