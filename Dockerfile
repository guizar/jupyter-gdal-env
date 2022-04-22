FROM jupyter/minimal-notebook:latest

USER root

# Install dependencies to support geospatial packages
RUN apt-get update && apt-get install -yq --no-install-recommends \
    gdal-bin \
    libgdal-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch back to jovyan
USER $NB_UID

# Install mamba
RUN conda install --quiet --yes -c conda-forge mamba

# Use mamba to install Python & R packages
RUN mamba install --quiet --yes -c conda-forge \
	gdal \
  ipykernel \
  ipython \
  r-irkernel \
  pyproj \
  postgis \
  proj \
  proj-data \
  python-language-server \
  earthengine-api \
  beautifulsoup4 \
  google-api-python-client \
  pandas \
  geopandas \
  descartes \
  dask \
  psycopg2 \
  folium \
  leafmap \
  requests \
  contextily \
  palettable \
  pprintpp \
  yaml \
  lxml \
  r-rgeos \
  r-lwgeom \
  r-devtools \
  r-tidyverse \
  r-sf \
  r-rpostgres \
  r-lmtest \
  r-rjson \
  r-geojsonio \
  r-rnaturalearth \
  r-rnaturalearthdata \
  r-kableextra \
  r-gstat \
  r-matchit \
  r-matching \
  r-randomforest \
  r-lme4 \
  r-nlme \
  r-brms \
  r-broom.mixed \
  r-tidymodels \
  r-glmmtmb \
  r-stargazer \
  r-hmisc \
  r-arrangements \
  r-countrycode \
  r-gridExtra \
  r-patchwork \
  r-ggally \
  r-ggsn \
  r-plotly \
  r-mapview \
  r-colorspace \
  r-pander \
  &&\

  # Clean
  conda clean --all -f -y && \
  rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
  rm -rf /home/$NB_USER/.cache/yarn && \
  rm -rf /home/$NB_USER/.node-gyp && \
  fix-permissions $CONDA_DIR && \
  fix-permissions /home/$NB_USER
