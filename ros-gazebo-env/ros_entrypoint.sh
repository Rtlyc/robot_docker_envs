#!/bin/bash
set -e

# Setup ROS environment
source "/opt/ros/melodic/setup.bash"
source "/catkin_ws/devel/setup.bash"

exec "$@"
