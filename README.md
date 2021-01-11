# asciio_docker
### What is Asciio
[App::Asciio - Plain ASCII diagram](https://metacpan.org/pod/App::Asciio).

The app is free for you drawing diagram to discribe your logics of your codes or classes. 

```
  vncviewer         .-,(  ),-.    
   __  _         .-(          )-.           gateway           vncserver 
  [__]|=|  ---->(    internet    )-------> __________ ------> ____   __ 
  /::/|_|        '-(          ).-'        [_...__...°]       |    | |==|
                     '-.( ).-'                               |____| |  |
                                                             /::::/ |__|
```
```

  ____[]
 | ___ |
 ||   ||  device
 ||___||  loads
 | ooo |------------------------------------------------------------.
 | ooo |    |                          |                            |
 | ooo |    |                          |                            |
 '_____'    |                          |                            |
            |                          |                            |
            v                          v                            v
  .-------------------.  .---------------------------.    .-------------------.
  | Loadable module C |  |     Loadable module A     |    | Loadable module B |
  '-------------------'  |---------------------------|    |   (instrumented)  |
            |            |         .-----.           |    '-------------------'
            '--------------------->| A.o |           |              |
                calls    |         '-----'           |              |
                         |    .------------------.   |              |
                         |    | A.instrumented.o |<-----------------'
                         |    '------------------'   |    calls
                         '---------------------------'
```
But it is can't work on MacOS, so 
I made this docker image to make it working on MacOS.
Hope you enjoying it.

# Using
----------
### installing xquartz on MAC:
```
brew install xquartz
```
### Configing XQuartz
XQuartz is the basis for supporting x11 to run Asciio with GUI.

1. open XQuartz,
2. open menu "application" -> "terminal"
3. input command : `xhost +`
## Pulling docker image 

```
docker pull brucexx1/asciio_docker_test
```

### The latest command you should run:
```
docker container run  -it -e DISPLAY=host.docker.internal:0 brucexx1/asciio_docker_test
```
