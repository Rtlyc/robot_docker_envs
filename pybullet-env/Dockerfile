# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Install dependencies
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

# Install PyBullet and other dependencies
RUN pip install pybullet
RUN pip install numpy

# Set the display environment variable to allow PyBullet GUI to run
ENV DISPLAY=:0

# Expose the PyBullet GUI port
EXPOSE 8080

