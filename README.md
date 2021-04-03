# Python Container Development Environment Repository

This repository hosts the needed files to build a python image that can be run
    as a python development environment. 
    It includes the ability to install `NeoVim` and respective plugins in order
    to utilize the `init.vim` included in `dockerfiles/python/src`, installs the
    plugins, and configures `Oh My Zsh`. 

It additionally installs some things like:
- nodejs
- pyright LSP via npm install
- ruamel.yaml pip package
- tensorflow
- vim plug
- various other vim pluggins

The directory structure is as follows:
```
|--python
|--|--classes
|--|--|--ClassFile.py
|--|--script.py
|--dockerfiles
|--|--image-name
|--|--|--src
|--|--|--|--src.file
|--|--|--Dockerfile
|--|--|--docker-compose.yaml
|--|--|--.env
```

## Build the Python Image 
1. Move the `.env.example` to `.env`
2. Edit the `.env` and replace the values in it with your specific values
- `MY_UID` should be replaced with your user id. 
- `MY_GID` should be replaced with your group id.
- `MY_USERNAME` should be replaced with your username.
- `MY_GROUPNAME` should be replaced with your users groupname.
3. Move the `.zshrc.example` to `.zshrc` in the `src` folder.
4. Add your username in the `export ZSH=` home path.
5. Move the `run_py_dev_container.sh.example` to `run_py_dev_container.sh`
6. Edit `run_py_dev_container.sh` to include your username in the home path. 
    **Or wherever you have your directory that you want to mount inside the volume**
> Note: You may need to change the shebang line of the sh script to match your shell environment
>   if you don't have zsh.
>   Or, you may need to create a .bat or .ps1 script in it's stead if using Windows without WSL2 
>   or something similar. 

7. Go into the `dockerfiles/python` directory. 
8. Build your docker image with:
```
docker-compose build
```
9. Run your image and exec into it by running the shell script included in the repo.
