# Use Ubuntu 18.04 as the base image
FROM ubuntu:18.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    lsb-release \
    gnupg2 \
    curl \
    wget \
    git \
    vim \
    build-essential \
    sudo \
    apt-utils

# Add ROS repository
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -

# Install ROS and Gazebo
RUN apt-get update && apt-get install -y \
    ros-melodic-desktop-full \
    gazebo9 \
    ros-melodic-gazebo-ros \
    ros-melodic-gazebo-ros-pkgs

# Install dependencies for visualization
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    mesa-utils \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    libglu1-mesa \
    freeglut3-dev \
    libosmesa6-dev \
    patchelf \
    x11-apps

# Initialize rosdep
RUN apt-get update && apt-get install -y python-rosdep \
    && rosdep init \
    && rosdep update \
    && rm -rf /var/lib/apt/lists/*

# Setup environment
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"

# Setup catkin workspace
RUN mkdir -p /catkin_ws/src
WORKDIR /catkin_ws
RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && catkin_make"

# Copy entrypoint script
COPY ./ros_entrypoint.sh /

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics,utility,video

# Expose the ports for GUI
ENV DISPLAY=:0

# Set entrypoint
ENTRYPOINT ["/ros_entrypoint.sh"]
