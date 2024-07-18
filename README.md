# robot_docker_envs

This repository contains the Dockerfiles and scripts to build Docker images for the following environments:
- Pybullet (GUI support)
- Ubuntu 18.04 with ROS Melodic + Gazebo 9 (GUI support)

## Usage

### Pybullet

#### Build the Docker images

```bash
cd pybullet-env && docker build -t pybullet-env .
```

#### Run the Docker container

```bash
docker run -it --rm     --gpus all     --env="DISPLAY"     --env="QT_X11_NO_MITSHM=1"     --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"     pybullet-env /bin/bash
```

### Ubuntu 18.04 with ROS Melodic + Gazebo 9

#### Build the Docker images

```bash
cd ros-gazebo-env && docker build -t ros-gazebo-env .
```

#### Run the Docker container

```bash
docker run -it --rm     --gpus all     --env="DISPLAY"     --env="QT_X11_NO_MITSHM=1"     --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"     ros-gazebo-env /bin/bash
```

#### Testing

Inside the Docker container, run the following command to test the ROS + Gazebo environment:

```bash
gazebo
```
