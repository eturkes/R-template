# R-template
#### *This project is considered complete and should not see major updates*

**NOTE**: I have only run this on Linux so far, have not confirmed it on Windows or macOS yet.

This repository contains a template useful for starting new R analyses.
As a demonstration, a very simple analysis of microarray data is included.
To load neccessary packages, renv and Docker environments are provided as well as a Singularity wrapper.
Users are encouraged to scan through the files and comments, picking and choosing components relevant to their needs.

To begin, the raw data should first be downloaded from Google Drive:  
[https://drive.google.com/drive/folders/1W92ZLBX1GKDyU5V2VOBrLHcB2oLrS8ty?usp=sharing](https://drive.google.com/drive/folders/1W92ZLBX1GKDyU5V2VOBrLHcB2oLrS8ty?usp=sharing)  
The folder should then be renamed `storage` and placed in the top-level of this project.

From here, the user has several options.

### 1. Local

This is the simplest and recommended way for new users and uses `renv` to load snapshotted packages.  
To do so, first open the project in RStudio, like seen in the below screenshot.

![rstudio-example](https://user-images.githubusercontent.com/25193231/78029317-5fbaf800-732e-11ea-94f4-1189fe7cb0e0.png)

Then in the console run:

```
renv::restore()
```

The project will be fully loaded at this point and files can be run or knitted as normal.

### 2. Docker

This approach requires Docker installation and setup [https://www.docker.com/](https://www.docker.com/).  
The simplest command is to run `run_all.R` non-interactively with the following:

```
docker-compose up all
```

If one wishes to use RStudio, first create a `.env` file with the port you would like to use, as so:

```
PORT=8787

```

Then open RStudio with:

```
docker-compose up rstudio
```

If the Docker container is being launched on a remote machine, an SSH tunnel like the one below will be needed:

```
ssh -N -L 8787:localhost:8787 user@ip-address
```

### 3. Singularity

This approach is similar to using Docker except with a Singularity wrapper to meet the security requirements common in high-performance computing (HPC).  
Similar to before, `run_all.R` is called non-interactively with:

```
sh ./singularity.sh all
```

To use RStudio, no `.env` file is needed, it is instead included in the command:

```
sh ./singularity.sh rstudio 8787
```

As before, an SSH tunnel is required if connecting remotely.
