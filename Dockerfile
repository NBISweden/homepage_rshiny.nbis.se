FROM rocker/shiny:3.6.1
#FROM r-base
LABEL maintainer "Nanjiang Shu (nanjiang.shu@nbis.se)"
LABEL version "1.0"

RUN apt-get update && \
    apt-get install -y libxml2-dev  libcurl4-openssl-dev libssl-dev libudunits2-dev libgsl-dev libmariadbclient-dev libpq-dev libgeos-dev libgdal-dev

# Download and install library

RUN R -e "install.packages(c('DT', 'dplyr', 'forestplot', 'ggfortify','ggplot2','ggpubr', 'gplots', 'grid', 'gridExtra', 'metafor', 'readr', 'rmarkdown', 'stringr', 'readxl', 'rvest' ), dependencies = T)"


EXPOSE 3838

CMD ["/usr/bin/shiny-server.sh"] 
