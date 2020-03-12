FROM rocker/shiny:3.6.1
LABEL maintainer="Nanjiang Shu (nanjiang.shu@nbis.se)"
LABEL version="1.0"

RUN apt-get update && \
    apt-get install -y --no-install-recommends procps curl vim \
    openjdk-8-jdk libbz2-dev libxml2-dev  libcurl4-openssl-dev libssl-dev libudunits2-dev libgsl-dev libmariadbclient-dev libpq-dev    libgeos-dev libgdal-dev \
    libfreetype6-dev libx11-dev mesa-common-dev libglu1-mesa-dev openbox freeglut3-dev

# Download and install library

#MetaMeX
RUN R -e "install.packages(c('DT', 'dplyr', 'forestplot', 'ggfortify','ggplot2','ggpubr', 'gplots', 'grid',   'gridExtra', 'metafor', 'readr', 'rmarkdown', 'stringr', 'readxl'), dependencies = T)" && \
    R -e "install.packages(c('rvest'), dependencies = T)" && \
#igraph
    R -e "install.packages(c('plotrix', 'rgl', 'rglwidget'), dependencies = T)" && \
#pophelperShiny
    R -e "install.packages(c('shinythemes', 'shinyBS', 'highcharter'), dependencies = T)" && \
    R -e "install.packages(c('colourpicker'), dependencies = T)" && \
    R -e "install.packages(c('rJava'), dependencies = T)" && \
    R -e "install.packages(c('xlsx'), dependencies = T)" && \
#nametagger
    R -e "install.packages(c('shinyAce', 'png', 'showtext'), dependencies = T)" && \
# zage
    R -e "install.packages(c('shinyWidgets'), dependencies = T)" && \
    R -e "install.packages(c('BiocManager'), dependencies = T)" && \
    R -e "BiocManager::install('RNASeqPower')" && \
    R -e "BiocManager::install('Cairo')" && \
    R -e "BiocManager::install('formattable')" && \
# singleCell
    R -e "install.packages(c('flexdashboard', 'tidyverse', 'cowplot'), dependencies = T)" && \
    R -e "BiocManager::install('Seurat')"

WORKDIR /srv
ADD . /srv/shiny-server/
RUN mkdir -p /srv/shiny-server/shiny-server-apps
COPY shiny-server-conf/shiny-server.conf /etc/shiny-server/


EXPOSE 3838
EXPOSE 13838

CMD ["/usr/bin/shiny-server.sh"]
