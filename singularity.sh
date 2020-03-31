#!/bin/sh

# Shell script for building a Singularity image from Docker Hub and running it.
# Run with "sh ./singularity.sh rstudio 8787".
# Then locally something like "ssh -N -L 8787:localhost:8787 skgtetu@login13.myriad.rc.ucl.ac.uk".
# The ports can be set to whatever you choose.
# For more details: https://divingintogeneticsandgenomics.rbind.io/post/run-rstudio-server-with-singularity-on-hpc/
# Be sure to check images and paths.

singularity pull -n tau-vulnerability.simg docker://eturkes/r-template:R3.6.2v1

if [ "$1" = "all" ]; then
    singularity exec \
        -B .:/home/rstudio/R-template \
        r-template.simg \
    Rscript -e "source('/home/rstudio/R-template/R/run_all.R')"

elif [ "$1" = "rstudio" ]; then
    # TODO: Point bind point to user's home.
    DISABLE_AUTH=true RSTUDIO_SESSION_TIMEOUT="0" \
    singularity exec \
        -B .:/home/rstudio/R-template \
        r-template.simg rserver --www-address=127.0.0.1 --www-port=$2
fi
