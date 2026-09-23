## Summary
This is the code repository for the analysis of the Panama, Peru, and US cohort by the Pannaraj & Gilbert Labs. Here, we analyzed the infant gut microbiome at 1, 2, and 4 MOL to describe patterns in gut ecology that correspond to differences in monovalent oral rotavirus vaccine response (RV1). For additional information regarding the cohort, methods, and interpretation of the results, please refer to the relevant publication: [Seymour et al. (2026)](https://doi.org/10.1038/s41467-026-78148-x).

The tables below list source files, outputs, and their descriptions.

## Description of contents
Filename | Description
------------ | -------------
knit-all.R | Main script. Run this script to run the whole analysis.
initialize.Rmd | Initialize the microbiome & clinical datasets. Reads the data into R from the biom files and the metadata files.
alpha-diversity.Rmd | Perform alpha-diversity LMMs.
beta-diversity.Rmd | Quantify beta-diversity metrics, PERMANOVA, and unconstrained /constrained+conditioned ordinations
differential-abundance.Rmd | Run taxonomic differential analysis using Maaslin2, LinDA, and ANCOM-BC2.
rota-metagenomics-dmm.Rmd | Build DMMs and perform multinomial logistic regression.
calprotectin.Rmd | Run statistics on calprotectin vs microbiome vs RV1 responses.
rota-metagenomics-ml.Rmd | Run lightGBM via tidymodels to predict delivery at the earliest timepoint and seroconversion at all timepoints.
build-figures.Rmd | This script pulls outputs from all of the others together to build the figures in the manuscript.

Directory | Description
------------ | -------------
data/ | Raw datafiles from metagenomics.
include/ | Folder for gitmodules; items that are included rote from their source.
scripts/ | Folder for miscellaneous scripts.


## Description of output
Filename | Description
------------ | -------------
m1-lgbm.rds | LightGBM ML model at timepoint 1.
m2-lgbm.rds | LightGBM ML model at timepoint 2.
m4-lgbm.rds | LightGBM ML model at timepoint 4.

Directory | Description
------------ | -------------
results/ | Output folder for other results.
results/reports | knit-all.R will knit reports to this folder by default.

---

*Last updated: September 22, 2026*
