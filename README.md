# jupyter-gdal-env

A Docker-based Jupyter environment with GDAL dependencies :earth_americas: :artificial_satellite: :world_map:

The environment is based on the [jupyter/minimal-notebook](https://hub.docker.com/r/jupyter/minimal-notebook/tags) image and extends it with the [GDAL](https://gdal.org) binaries. It's meant to play well with the Conda package manager system. In many cases you should be able to install geospatial libraries that require GDAL headers using the `conda install` command.

The image comes with preloaded libraries to analyse and visualise your data, including those from the tidyverse family (for R), as well as pandas, leaflet and a few more for Python. Make sure to check the [docs](https://jupyter-docker-stacks.readthedocs.io/en/latest/#) for further information on customizing the containers.

**To deploy**

1. Clone this repo

2. Go to the project folder and `docker build`

```shell
docker build . -t jupyter-env
```

3. Map the container volume to your local environment (replace `YOUR_DIR` in the snippet below) and `docker run`.

```shell
docker run -it -p 8888:8888 --name jupyter-env -v YOUR_DIR:/home/jovyan/work/ jupyter-env:latest start-notebook.sh --allow-root --NotebookApp.token='' --no-browser`
```

4. Open a web browser and head over to http://localhost:8888

### Download hosted image

An alternative to building the image locally is to pull it  from Dockerhub. To donwload the image and initiate the environment run the following:

```shell
docker run -it -p 8888:8888 --name jupyter-env -v YOUR_DIR:/home/jovyan/work/ guizar/jupyter-env:0.0.1 start-notebook.sh --allow-root --NotebookApp.token='' --no-browser
```
