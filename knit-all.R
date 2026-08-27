## Cale Seymour
## 2026
## Knit all markdown files for the rota microbiome analysis.
## You can knit these individually if you so choose. After running, each report saves its
## environment to an RData file. The subsequent report will load one or more files and operate 
## on them. There IS a rough order to the files based on which analyses need to be performed
## before the next. The dependency structure is documented below:

## y <- x : x depends on y
## none <- intialize (run initialize.Rmd first)
## initialize <- alpha-diversity
## initialize <- differential-abundance
## alpha-diversity <- beta-diversity
## beta-diversity <- rota-metagenomics-dmm
## beta-diversity + differential-abundance <- calprotectin
## calprotectin <- rota-metagenomics-ml
## all other Rmd files <- build-figures

library('rmarkdown')
library('knitr')

## List of reports to knit
file_list = c(
    "initialize.Rmd",             ## Cleanse data
    "alpha-diversity.Rmd",        ## Alpha div LMEMs
    "beta-diversity.Rmd",         ## Beta div / permanovas
    "differential-abundance.Rmd", ## Differential abundance analysis
    "rota-metagenomics-dmm.Rmd",  ## DMM clustering
    "calprotectin.Rmd",           ## Calprotectin stats
    "rota-metagenomics-ml.Rmd",   ## ML models
    "build-figures.Rmd"           ## Figs
)

## Output directory
output_dir = "results/reports"
if (!dir.exists(output_dir)) dir.create(output_dir, recursive = TRUE);

## Knit files.
lapply(file_list, function(rmd_file)
{
    output_file = file.path(output_dir, tools::file_path_sans_ext(basename(rmd_file)))
    render(rmd_file, output_file = paste0(output_file, ".html"), envir = new.env())
})
