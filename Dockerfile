FROM rocker/rstudio:3.6.2

LABEL maintainer="Emir Turkes emir.turkes@eturkes.com"

COPY user-settings /home/rstudio/.rstudio/monitored/user-settings/

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    zlib1g-dev \
 && Rscript \
    -e "install.packages('conflicted')" \
    -e "install.packages('rmarkdown')" \
    -e "install.packages('rprojroot')" \
    -e "install.packages('data.table')" \
    -e "install.packages('DT')" \
 && apt-get clean \
 && rm -Rf \
    /var/lib/apt/lists/ \
    /tmp/downloaded_packages/ \
    /tmp/*.rds
