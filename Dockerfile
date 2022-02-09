FROM rocker/shiny:4.0.3
LABEL maintainer="Nanjiang Shu (nanjiang.shu@nbis.se)"
LABEL version="1.2"

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    procps \
    curl \
    vim \
    openbox \
    freeglut3-dev \
    libv8-dev \
    libmagick++-dev \
    openjdk-8-jdk \
    libbz2-dev \
    libgsl-dev \
    libmysqlclient-dev \
    default-libmysqlclient-dev \
    libpq-dev \
    libfreetype6-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libudunits2-dev \
    libxml2-dev \
    libgeos-dev \
    libfontconfig1-dev \
    gdal-bin \
    libgdal-dev \
    libcairo2-dev \
    libxt-dev \
    libnlopt-dev \
    mesa-common-dev \
    libglu1-mesa-dev \
    libx11-dev \
    libglpk-dev \
    && rm -rf /var/lib/apt/lists/*

# Download and install library

# MetaMeX
RUN R -e "install.packages(c('DT', 'dplyr', 'forestplot', 'ggfortify','ggplot2','ggpubr', 'gplots', 'grid',   'gridExtra', 'metafor', 'readr', 'rmarkdown', 'stringr', 'readxl', 'shinyjs', 'scales'), dependencies = T)" && \
    R -e "install.packages(c('rvest'), dependencies = T)" && \
# igraph
    R -e "install.packages(c('plotrix', 'rgl', 'rglwidget'), dependencies = T)" && \
# pophelperShiny
    R -e "install.packages(c('shinythemes', 'shinyBS', 'highcharter'), dependencies = T)" && \
    R -e "install.packages(c('colourpicker'), dependencies = T)" && \
    R -e "install.packages(c('rJava'), dependencies = T)" && \
    R -e "install.packages(c('xlsx'), dependencies = T)" && \
    R -e "install.packages(c('label.switching','tidyr','remotes','DT','htmlwidgets','magrittr','markdown','shiny','viridisLite','writexl'),repos = 'http://cran.us.r-project.org', dependencies= T)" && \
    R -e "remotes::install_github('royfrancis/pophelper')" && \
# shiny-nametagger
    R -e "install.packages(c('shinyAce', 'png', 'showtext'), dependencies = T)" && \
# singleCell
    R -e "install.packages(c('flexdashboard', 'tidyverse', 'cowplot'), dependencies = T)" && \
    R -e "setRepositories(ind = 1:2)" && \
    R -e "install.packages(c('Seurat'))" && \
# rshiny-support-4884
    R -e "install.packages(c('randomcoloR', 'dbscan', 'shadowtext', 'GGally', 'ggrepel', 'ggforce', 'ggpubr'), dependencies = T)" && \
# shiny-certificate
    R -e "install.packages(c('showtext','magick','ggtext'), dependencies = T)" && \
# o_andersson
    R -e "install.packages(c('RColorBrewer'), dependencies = T)" && \
# natural-nations
    R -e "install.packages(c('plyr', 'shiny.i18n', 'shinydashboard', 'shinyTime', 'shinyWidgets', 'leaflet', 'plotly', 'wesanderson', 'shinydashboard', 'shinyjs', 'extrafont'), dependencies = T)" && \
# shiny-rnaseq-power
    R -e "install.packages(c('shinyBS','shinythemes','RNASeqPower'), dependencies = T)" && \
# support-5860
    R -e "install.packages(c('shinythemes','DT','readxl','data.table','shinyhelper','Matrix'), dependencies = T)"

ADD web /srv/shiny-server/
RUN mkdir -p /srv/shiny-server/shiny-server-apps


EXPOSE 3838

CMD ["/init"]
