#!/bin/bash

! hyprctl activewindow -j | grep -q "\"class\" *: *\"zen\"" && hyprctl dispatch killactive
