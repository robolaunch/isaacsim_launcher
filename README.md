<p align="center">
    <image with="320" height="240" src="https://raw.githubusercontent.com/robolaunch/trademark/main/logos/svg/rocket.svg">
</p>

<h1 align="center"> Isaac Simulation Launcher Package </h1>

This package tested under ROS2 Humble. Also, IsaacSim version is 4.2 and IsaacLab version is v1.3.0.

# Prequest
```
    Ubuntu 22.04
    ROS2 Humble
    GitHub
    NVIDIA Omniverse Launcher 
    Isaac Sim 4.2
    Miniconda
```
## Setting
### Git
```
    sudo apt-get update
    sudo apt install git
```

### Pre-install Workspace
Clone Repository
```
    git clone https://github.com/robolaunch/isaacsim_launcher.git --recurse-submodules
```
### Depencies & ROS2 Intallation
You can review the installros.sh file under isaacsim_launcher/isaacsim_ws directory. That shellscript prepared according to ROS2 Humble documentation.
```
    sh <path the isaacsim_launcher directory>/isaacsim_ws/installros.sh
```
### Update .bashrc
Add the following block at the end of .bashrc. You have to pay attention about the "isaacsim_launcherDirectory", it has to point the isaacsim_launcher directory. This following block just example.
```
	isaacsim_launcherDirectory=/home/${USER}/isaacsim_launcher/
	###################
	### EXPORTS
	export ROS_DOMAIN_ID=0
	export FASTRTPS_DEFAULT_PROFILES_FILE=${isaacsim_launcherDirectory}/isaacsim_ws/fastdds.xml
	export _colcon_cd_root=/opt/ros/humble/
	export ISAACSIM_PATH="${HOME}/.local/share/ov/pkg/isaac-sim-4.2.0"
	export ISAACSIM_PYTHON_EXE="${ISAACSIM_PATH}/python.sh"
	### EXPORTS
	###################
	###################
	### SOURCES
	source /opt/ros/humble/setup.bash
	source ${isaacsim_launcherDirectory}/isaacsim_ws/install/setup.bash
	source /usr/share/colcon_cd/function/colcon_cd.sh
	source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash
	### SOURCES
	###################
``` 
### Miniconda3
```
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh (for x64)
    sh <Miniconda3-latest-Linux-x86_64>@Downloads directory
    accept eula, and no for init
    conda config --set auto_activate_base false
```
Finally, add the following block at the end of .bashrc if only if doesn't exists!
```
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('${HOME}/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "${HOME}/miniconda3/etc/profile.d/conda.sh" ]; then
            . "${HOME}/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="${HOME}/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
```
### IsaacLab
```
    cd ${isaacsim_launcherDirectory}/IsaacLab/
    ln -s ${ISAACSIM_PATH} _isaac_sim
    ./isaaclab.sh --conda
    conda activate isaaclab
    pip install --upgrade pip
    ./isaaclab.sh --install
    ./isaaclab.sh --install rl_games
    python source/standalone/tutorials/00_sim/create_empty.py (for verification)
```

# Workspace

1. Install Depencies
```
    cd ${isaacsim_launcherDirectory}/isaacsim_ws/
    rosdep install --from-paths src --ignore-src -r -y
```
2. Build
```
    colcon build
```

## Running
1. Launch the Isaac Sim
```
    Open the new terminal or execute "bash"
    ros2 launch isaacsim run_isaacsim.launch.py
```
