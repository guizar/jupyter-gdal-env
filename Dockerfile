FROM jupyter/minimal-notebook:latest

USER root

# Install dependencies to support geospatial packages
RUN apt-get update && apt-get install -yq --no-install-recommends \
    gdal-bin \
    libgdal-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch back to jovyan
USER $NB_UID

# Use conda to install Python & R packages
RUN conda install --quiet --yes -c conda-forge \
	gdal \
  ipykernel \
  ipython \
  r-irkernel \
  proj \
  proj-data \
  python-language-server \
  earthengine-api \
  beautifulsoup4 \
  google-api-python-client \
  shapely \
  fiona \
  pyproj \
  postgis \
  pandas \
  geopandas \
  psycopg2 \
  ipyleaflet \
  requests \
  simplegeneric \
  contextily \
  ipyleaflet \
  bokeh \
  palettable \
  pprintpp \
  requests \
  yaml \
  lxml \
  pydrive  \
  r-gstat \
  r-geojsonio \
  r-rgeos \
  r-lwgeom \
  r-devtools \
  r-tidyverse \
  r-sf \
  r-rjson \
  r-kableextra \
  r-lme4 \
  r-car \
  r-nlme \
  r-broom.mixed \
  r-countrycode \
  r-testthat \
  r-rpostgresql \
  r-emmeans \
  r-ggeffects \
  r-stargazer \
  r-gridExtra \
  r-hmisc \
  r-tidymodels \
  r-modelr \
  r-glmmtmb \
  r-arrangements \
  r-patchwork \
#  r-fixest \ # (latest version available via R install)
  r-ggally \
  r-ggsn \
  r-plotly \
  r-mapview \
  r-colorspace \
  r-pander \
  &&\

  # Clean
  conda clean --all -y && \
  rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
  rm -rf /home/$NB_USER/.cache/yarn && \
  rm -rf /home/$NB_USER/.node-gyp && \
  fix-permissions $CONDA_DIR && \
  fix-permissions /home/$NB_USER
