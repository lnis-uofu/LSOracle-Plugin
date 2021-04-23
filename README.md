# Using LSOracle as a Plugin for Yosys
## Introduction
[Yosys](http://www.clifford.at/yosys/) is a framework for RTL synthesis tools. This plugin allows you to utilize features of the [LSOracle](https://github.com/lnis-uofu/LSOracle/tree/master) tool within Yosys with the "lsoracle" command. This command is run in a similar way to the "abc" command

## Installation

To use this plugin, first clone the repository. 

```bash
git clone https://github.com/lnis-uofu/LSOracle-Plugin.git
cd LSOracle-Plugin/
git submodule init
git submodule update
```
Then build the LSOracle tool. [(Full LSOracle Documentation)](https://lsoracle.readthedocs.io/en/master/?badge=master)

```bash
cd LSOracle
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=RELEASE
make
```
If you don't already have Yosys, build the version inside of the LSOracle-Plugin directory. Detailed build info [here](https://github.com/YosysHQ/yosys#setup).

Then make the plugin.

```bash
cd ../
make YOSYS_DIR=<directory of your yosys installation>
```

This will give you the needed oracle.so plugin file. This can be used as a plugin to Yosys by using the command "yosys -m <oracle.so path>" or by using the plugin command within Yosys itself.
