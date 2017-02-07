.libPaths(setdiff(.libPaths(), "/usr/lib/R/library"))
          
## baseLocalRepo <- "myrepo"
## localRrepo <- file.path(baseLocalRepo, "src/contrib")
## fullPath <- file.path(getwd(), baseLocalRepo)

## dir.create(localRrepo, recursive=TRUE)

pkgs <- c('Biostrings', 'ShortRead', 'DESeq', 'edgeR','biomaRt',
          'TxDb.Hsapiens.UCSC.hg19.knownGene', 'Rsamtools',
          'BSgenome.Hsapiens.UCSC.hg19', 'BSgenome',
          'GenomicAlignments', 'GenomicRanges', 'pasillaBamSubset',
          'pasilla', 'rtracklayer', 'ggbio', 'vsn', 'gplots',
          'RColorBrewer','chipseq', 'Rsubread', 'htSeqTools','limma',
          'org.Hs.eg.db', 'Rcade', 'ChIPQC', 'ChIPpeakAnno', 'affy',
          'affyPLM', 'limma', 'hthgu133pluspmcdf', 'hgu133plus2.db',
          'genefilter', 'GSEABase', 'KEGG.db', 'Category',
          'ReportingTools', 'crlmm', 'hapmapsnp6',
          'genomewidesnp6Crlmm', 'illuminaHumanv1.db', 'GGdata',
          'snpStats')

library(BiocInstaller)
## library(tools)
## avail = available.packages(contrib.url(BiocInstaller::biocinstallRepos()))
## deps = tools::package_dependencies(pkgs, avail, recursive=TRUE,)
## download.packages(unique(c(pkgs, unlist(unname(deps)))), localRrepo,
##     repos=biocinstallRepos())
## tools::write_PACKAGES(localRrepo)

## install.packages(pkgs, repo=paste0('file://', fullPath), type='source')

biocLite(pkgs, ask=FALSE)
