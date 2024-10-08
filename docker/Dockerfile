# Use the official ROS base image
FROM ros:noetic-ros-base

# Set environment variables for the user
ARG USERNAME
ARG USER_UID=1000
ARG USER_GID=1000

# Set the working directory
WORKDIR /workspace

# Install required system packages
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-rosdep \
    python3-catkin-tools \
    bash-completion \
    vim \
    git \
    sudo \
    ros-noetic-desktop-full \
    x11-apps \
    xorg \
    && rm -rf /var/lib/apt/lists/*

RUN echo "Creating user with UID: ${USER_UID}, GID: ${USER_GID}, Username: ${USERNAME}"

# Create a user and group only if they don't already exist
RUN groupadd -g ${USER_GID} ${USERNAME} || echo "Group already exists" && \
    useradd -m -u ${USER_UID} -g ${USERNAME} ${USERNAME} || echo "User already exists" && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN chown -R ${USERNAME}:${USERNAME} /workspace

# Copy the entrypoint script and give it execution permissions before switching users
# COPY ./docker/entrypoint.sh /workspace/entrypoint.sh
# RUN chmod +x /workspace/entrypoint.sh

# Initialize rosdep if it hasn't been initialized yet
RUN if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then \
        rosdep init && rosdep update; \
    fi

# RUN echo "source /opt/ros/noetic/setup.bash" >> /home/${USERNAME}/.bashrc

# Switch to the non-root user
USER ${USERNAME}

# ENTRYPOINT ["/workspace/entrypoint.sh"]

# Default command
CMD ["/bin/bash"]