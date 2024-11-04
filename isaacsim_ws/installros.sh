locale
sudo apt update && sudo apt install -y locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale 

sudo apt install software-properties-common
sudo add-apt-repository universe
sudo apt update && sudo apt install -y curl
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
sudo apt upgrade
sudo apt install -y ros-humble-desktop
sudo apt install -y libfuse2 cmake build-essential python3-colcon-common-extensions python3-pip python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential ros-humble-vision-msgs ros-humble-ackermann-msgs
sudo rosdep init
rosdep update
pip install --upgrade pip
pip install catkin_pkg
