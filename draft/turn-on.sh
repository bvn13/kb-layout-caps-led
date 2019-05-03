#!/bin/bash

echo 1 | sudo tee '/sys/class/leds/input3::capslock/brightness'
