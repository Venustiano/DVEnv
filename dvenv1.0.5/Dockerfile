FROM jupyter/r-notebook:lab-3.5.3

ENV TEXMFHOME=$HOME/.cache/texlive
ENV TEXMFVAR=$HOME/.cache/texlive/texmf-var

COPY --chown=${NB_UID}:${NB_GID} ./src /home/src

USER root

RUN apt update && \
	apt install -y libudunits2-dev \
	libgdal-dev \
	libgeos-dev \
	libproj-dev \
	libmagick++-dev \
	libxt6 \
    libglpk-dev \
    libxtst6 \
    libprotobuf-dev \
    protobuf-compiler \
    cmake \
    libpoppler-cpp-dev \
    poppler-utils \
    tk \
    && echo "Installing TinyTex..." \
    && wget -qO- \
    "https://yihui.org/tinytex/install-unx.sh" | \
    sh -s - --admin --no-path \
    && mv ~/.TinyTeX /opt/TinyTeX \
    && /opt/TinyTeX/bin/*/tlmgr path add \
    && tlmgr install metafont mfware inconsolata tex ae parskip listings pgf preview grfext \
    && tlmgr install standalone luatex85 pgfplots \
    && tlmgr path add \
    && chown -R root:staff /opt/TinyTeX \
    && chmod -R g+w /opt/TinyTeX \
    && chmod -R g+wx /opt/TinyTeX/bin \
    && sed -i 's/256MiB/2GiB/' /etc/ImageMagick-6/policy.xml

USER ${NB_UID}

COPY rpackages.R /

RUN Rscript /rpackages.R

RUN pip install --quiet --no-cache-dir \
    RISE \
    plotly \
    rpy2 \
    pandas \
    scipy \
    wordcloud \
    cufflinks \
    kaleido \
    markdown \
    fairly \
    jupyter-fairly \
    ipyfilechooser \
    appdirs \
    sqlalchemy_utils

RUN mamba install --yes 'ipywidgets-jsonschema' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
