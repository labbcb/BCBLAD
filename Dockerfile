FROM rocker/tidyverse:3.3.2

MAINTAINER benilton@unicamp.br

## Install tools for course
RUN apt-get update \
    && apt-get install -y \
          bedtools \
##          igv \
          libxml2-dev \
	  libxslt-dev \
          python-dev \
          python-numpy \
          python-pip \
          samtools \
    && rm -rf /var/lib/apt/lists/*	  

RUN pip install MACS2

WORKDIR /home/rstudio

RUN mkdir -p /igv && \
    cd /igv && \
    wget --quiet http://www.broadinstitute.org/igv/projects/downloads/IGV_2.3.42.zip && \
    unzip IGV_2.3.42.zip && \
    rm IGV_2.3.42.zip && \
    cd IGV_2.3.42/ && \
    sed -i 's/Xmx2000/Xmx8000/g' igv.sh && \
    cd /usr/bin && \
    ln -s /igv/IGV_2.3.42/igv.sh ./igv

RUN apt-get update \
    && apt-get install -y \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libpng12-dev \
    libx11-dev \
    libxt-dev \
    r-cran-bbmisc \
    r-cran-matrixstats \
    r-cran-rgl \
    x11proto-core-dev

COPY biocpkgs.R /home/rstudio/v2/
## COPY myrepo /home/rstudio/v2/myrepo
WORKDIR /home/rstudio/v2
RUN Rscript biocpkgs.R
WORKDIR /home/rstudio
RUN rm -fr v2
