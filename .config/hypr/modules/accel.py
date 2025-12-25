#!/usr/bin/env python3

# original at https://gist.github.com/yinonburgansky/7be4d0489a0df8c06a923240b8eb0191
# modified for ease of use in Hyprland

# calculation are based on http://www.esreality.com/index.php?a=post&id=1945096
# assuming windows 10 uses the same calculation as windows 7.
# guesses have been made calculation is not accurate
# touchpad users make sure your touchpad is calibrated with `sudo libinput measure touchpad-size`

import struct

# ===== PARAMETERS =====
# set according to your device:
device_dpi = 1000 # mouse dpi
screen_dpi = 96
screen_scaling_factor = 1
sample_point_count = 20 # should be enough but you can try to increase for accuracy of windows function
sensitivity_factor = 8
# ===== END PARAMETERS =====

# TODO: find accurate formulas for scale x and scale y
# mouse speed: inch/s to device-units/millisecond
scale_x = device_dpi / 1e3
# pointer speed: inch/s to screen pixels/millisecond
scale_y =  screen_dpi / 1e3 / screen_scaling_factor * sensitivity_factor


def float16x16(num):
    return struct.unpack('<i', num[:-4])[0] / int(0xffff)

# windows 10 registry values:
# HKEY_CURRENT_USER\Control Panel\Mouse\SmoothMouseXCurve
X = [
b'\x00\x00\x00\x00\x00\x00\x00\x00',
b'\x15\x6e\x00\x00\x00\x00\x00\x00',
b'\x00\x40\x01\x00\x00\x00\x00\x00',
b'\x29\xdc\x03\x00\x00\x00\x00\x00',
b'\x00\x00\x28\x00\x00\x00\x00\x00',
]
# HKEY_CURRENT_USER\Control Panel\Mouse\SmoothMouseYCurve
Y=[
b'\x00\x00\x00\x00\x00\x00\x00\x00',
b'\xfd\x11\x01\x00\x00\x00\x00\x00',
b'\x00\x24\x04\x00\x00\x00\x00\x00',
b'\x00\xfc\x12\x00\x00\x00\x00\x00',
b'\x00\xc0\xbb\x01\x00\x00\x00\x00',
]

windows_points = [[float16x16(x), float16x16(y)] for x,y in zip(X,Y)]
# scale windows points according to device config
points = [[x * scale_x, y * scale_y] for x, y in windows_points]

def find2points(x):
    i = 0
    while i < len(points) - 2 and x >= points[i+1][0]:
        i +=1
    assert -1e6 + points[i][0] <= x <= points[i+1][0]+1e6, f'{points[i][0]} <= {x} <= {points[i+1][0]}'
    return points[i], points[i+1]


def interpolate(x):
    (x0, y0), (x1, y1) = find2points(x)
    y = ((x-x0)*y1+(x1-x)*y0)/(x1-x0)
    return y


def sample_points(count):
    # use linear extrapolation for last point to get better accuracy for lower points
    last_point = -2
    max_x = points[last_point][0]
    step = max_x / (count + last_point) # we need another point for 0
    sample_points_x = [si * step for si in range(count)]
    sample_points_y = [interpolate(x) for x in sample_points_x]
    return sample_points_x, sample_points_y

sample_points_x, sample_points_y = sample_points(sample_point_count)
step = sample_points_x[1] - sample_points_x[0]

sample_points_str = " ".join(["%.3f" % number for number in sample_points_y])

print(f'\tPoints: {sample_points_str}')
print(f'\tStep size: {step:0.10f}')

print('accel_profile', f'custom {step} {sample_points_str}')
print('scroll_points', f'{step} {sample_points_str}')
