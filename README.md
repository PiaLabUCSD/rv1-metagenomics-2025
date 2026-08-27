RV1 Metagenomic analysis

Cale Seymour, MS

University of California San Diego

# Rota 2025

This is the code repository for the analysis of the Panama, Peru, and US multicountry RV1 microbiome cohort by the Pannaraj & Gilbert Labs. A table below lists source files and their descriptions.

## Description of contents
Filename | Description
------------ | -------------
knit-all.R | Main entry point. Run this script to run the whole analysis.
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
extracts/ | Extracts and quants for calprotectin and some other datapoints that we ended up pulling after I had already done the bulk of data cleansing. These are used to make Table S1.
data/ | Raw datafiles from metagenomics.
