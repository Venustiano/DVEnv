FROM rocker/rstudio

RUN apt update && \
	apt install -y libudunits2-dev \
	libgdal-dev \
	libgeos-dev \
	libproj-dev \
	libmagick++-dev \
	libxt6 \
	tk \
	git

RUN install2.r  --error \
	-r "https://cran.rstudio.com" \
	-r "http://www.bioconductor.org/packages/release/bioc" \
	nycflights13 \
	gapminder \
	RColorBrewer \
	gganimate \
	emmeans \
	mgcv \
	nlme \
	broom \
	tidybayes \
	maps \
	statebins \
	sf \
	maptools \
	sp \
	rgeos \
	ggspatial \
	geofacet \
	misc3d \
	plot3D \
	magick \
	hexbin \
	treemapify \
	gridExtra \
	rworldmap \
	ggmap \
	ggthemes \
	ggridges \
	ggrepel \
	ggforce \
	patchwork \
	lubridate \
	forcats \
	stringr \
	purrr \
	readr \
	tidyr \
	tibble \
	tidyverse \
	dplyr \
	ggplot2 \
	colorspace \
	rjson \
	class \
	rprojroot \
	estimability \
	ggstance \
	rstudioapi \
	farver \
	ggfittext \
	svUnit \
	mvtnorm \
	xml2 \
	knitr \
	polyclip \
	jsonlite \
	png \
	httr \
	backports \
	assertthat \
	Matrix \
	lazyeval \
	cli \
	tweenr \
	prettyunits \
	htmltools \
	coda \
	gtable \
	glue \
	Rcpp \
	cellranger \
	imguR \
	xfun \
	rvest \
	MASS \
	scales \
	hms \
	yaml \
	stringi \
	e1071 \
	spData \
	RgoogleMaps \
	rlang \
	pkgconfig \
	bitops \
	geogrid \
	evaluate \
	lattice \
	tidyselect \
	plyr \
	magrittr \
	R6 \
	generics \
	DBI \
	pillar \
	haven \
	foreign \
	withr \
	units \
	modelr \
	crayon \
	arrayhelpers \
	progress \
	jpeg \
	rnaturalearth \
	readxl \
	digest \
	classInt \
	xtable \
	munsell \
	ggplot2movies \
	base64enc \
	rmarkdown \
	tinytex \
	scales \
	bookdown \
	remotes \
#	FactoMineR \
	tidymodels \
	vcd \
	lwgeom \
    gridGraphics \
    caret

RUN R -e "install.packages(c('FactoMineR'))"

RUN sed -i 's/256MiB/2GiB/' /etc/ImageMagick-6/policy.xml

# RUN installGithub.r wilkelab/cowplot \
#     clauswilke/colorblindr \
#     clauswilke/dviz.supp \
#     clauswilke/ungeviz \
#     clauswilke/ggtextures \
#     DavisVaughan/strapgod

RUN R -e "remotes::install_github('wilkelab/cowplot')"
RUN R -e "remotes::install_github('clauswilke/colorblindr')" 
RUN R -e "remotes::install_github('clauswilke/dviz.supp')"
RUN R -e "remotes::install_github('wilkelab/ungeviz')"
RUN R -e "remotes::install_github('clauswilke/ggtextures')"
RUN R -e "remotes::install_github('DavisVaughan/strapgod')"

RUN git clone https://github.com/topepo/FES.git
RUN git clone https://github.com/clauswilke/dataviz.git



