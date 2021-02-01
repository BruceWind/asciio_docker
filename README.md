# asciio_docker
------
[![License: MIT](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/BruceWind/asciio_docker/blob/master/LICENSE)
### What is Asciio
[App::Asciio - Plain ASCII diagram](https://metacpan.org/pod/App::Asciio).

The app is free for you drawing diagram to discribe your logics of your codes or classes. 
And the diagram you can paste into your code comment.
Such as:

```
  vncviewer         .-,(  ),-.    
   __  _         .-(          )-.           gateway           vncserver 
  [__]|=|  ---->(    internet    )-------> __________ ------> ____   __ 
  /::/|_|        '-(          ).-'        [_...__...°]       |    | |==|
                     '-.( ).-'                               |____| |  |
                                                             /::::/ |__|
```
```
    +---------+
    |         |
    |   NFS   |--+
    |         |  |
    +---------+  |   +----------+
                 |   |          |
    +---------+  +-->|          |
    |         |      |          |
    |   AFS   |----->| FS-Cache |
    |         |      |          |
    +---------+ +--->|          |
                |    |          | 
    +---------+ |    +----------+ 
    |         | |
    |  ISOFS  |-+
    |         |   
    +---------+
```
But it can't work on MacOS,
so I made this docker image to make it working on MacOS.
Hope you enjoying it.

# Two steps to run it.
----------
### Configing [XQuartz](https://www.xquartz.org/)
XQuartz is the basis for supporting x11 to run Asciio with GUI.

1. `brew install xquartz`,and open XQuartz,
2. open menu "application" -> "terminal"
3. input command on **xhost's xterm window**: `xhost +`
## Pulling docker image 

```
docker pull brucexx1/asciio_docker_test
```

### The latest command you should run on terminal in MacOS:
```shell
mkdir asciio_saved # create a directory which asciio app can save at.
#append -v to map asciio_saved to docker container's directory.
docker container run  -it -v $PWD/asciio_saved:/home/developer/asciio_saved  -e DISPLAY=host.docker.internal:0 brucexx1/asciio_docker_test
```

### Copying diagram
There are two ways to get your diagram which you drew:

1.Copy into pasteboard:

> By the time you have done you diagram in Asciio, you can press **Ctrl + E** to copy diagram as code comment.

2.Open in **sublime-text app** or another text editor:

> `docker -v $PWD/asciio_saved` will map local directory into docker filesystem. After you drew, you can click **save menu** to save at /home/developer/asciio_saved and  the file name  must be append with ".txt" .
![screenshot](https://raw.githubusercontent.com/BruceWind/asciio_docker/main/screenshot_of_asciio.png)

> WARNING: Don't modify those file from your docker host.
