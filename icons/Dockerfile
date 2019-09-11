FROM rocker/shiny:3.6.0

RUN apt-get update

# Download and install library

RUN R -e "install.packages(c('DT', 'dplyr', 'forestplot', 'ggfortify','ggplot2','ggpubr', 'gplots', 'grid', 'gridExtra', 'metafor', 'readr', 'rmarkdown', 'stringr' ), dependencies = T)"


EXPOSE 3838

CMD ["/usr/bin/shiny-server.sh"] 
