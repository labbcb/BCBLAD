FROM rocker/tidyverse:3.3.2

MAINTAINER Benilton Carvalho <benilton@unicamp.br>

## Install tools for course
RUN apt-get update && apt-get install -y \
    bedtools \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libxslt-dev \
    libxt-dev \
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

COPY biocpkgs.R /home/rstudio/v2/
WORKDIR /home/rstudio/v2
RUN Rscript biocpkgs.R
WORKDIR /home/rstudio
RUN rm -fr v2
USER rstudio
