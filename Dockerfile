FROM rocker/binder:4.1.2

## Declares build arguments
ARG NB_USER
ARG NB_UID

COPY --chown=${NB_USER} . ${HOME}

ENV DEBIAN_FRONTEND=noninteractive
USER root
RUN echo "Checking for 'apt.txt'..." \
        ; if test -f "apt.txt" ; then \
        apt-get update --fix-missing > /dev/null\
        && xargs -a apt.txt apt-get install --yes \
        && apt-get clean > /dev/null \
        && rm -rf /var/lib/apt/lists/* \
        ; fi
RUN sed -i 's/256MiB/2GiB/' /etc/ImageMagick-6/policy.xml
USER ${NB_USER}

RUN git clone https://github.com/topepo/FES.git
RUN git clone https://github.com/clauswilke/dataviz.git

## Run an install.R script, if it exists.
RUN if [ -f install.R ]; then R --quiet -f install.R; fi



