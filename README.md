Renaming common to species names in `.csv` files with detections
========================

Please open the R script `rename.R` and modify accordingly. For instance, in lines 6-20, you can add or remove more species names, or change the directories where the files will be saved.

By default, all `.csv` files inside the `data/raw` directory will be processed. The resulting files will be saved in the directory `data/tidy`. 

Then, run the script interactively (e.g. RStudio), or in the command line `Rscript rename.R`.

This script only requires one library named `here` for constructing files paths. More about library `here` can be found [here](https://cran.r-project.org/web/packages/here/index.html).

You can install `here` using the following command

```R
install.packages("here")
```
