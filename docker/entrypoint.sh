#!/bin/bash
set -e

# Source the ROS environment
source /opt/ros/noetic/setup.bash

# Build the workspace if it hasn't been built yet
if [ ! -d "build" ]; then
    catkin_make
fi

# Source the workspace setup file
source devel/setup.bash

# Execute any commands passed to the script
exec "$@"