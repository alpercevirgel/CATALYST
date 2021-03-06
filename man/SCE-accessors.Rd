% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllMethods.R
\name{SCE-accessors}
\alias{SCE-accessors}
\alias{channels}
\alias{marker_classes}
\alias{type_markers}
\alias{state_markers}
\alias{ei}
\alias{n_cells}
\alias{sample_ids}
\alias{cluster_ids}
\alias{cluster_codes}
\alias{delta_area}
\alias{ei,SingleCellExperiment-method}
\alias{n_cells,SingleCellExperiment-method}
\alias{channels,SingleCellExperiment-method}
\alias{marker_classes,SingleCellExperiment-method}
\alias{type_markers,SingleCellExperiment-method}
\alias{state_markers,SingleCellExperiment-method}
\alias{sample_ids,SingleCellExperiment-method}
\alias{cluster_ids,SingleCellExperiment,missing-method}
\alias{cluster_ids,SingleCellExperiment,character-method}
\alias{cluster_codes,SingleCellExperiment-method}
\alias{delta_area,SingleCellExperiment-method}
\title{\code{\link{SingleCellExperiment}} accessors}
\usage{
\S4method{ei}{SingleCellExperiment}(x)

\S4method{n_cells}{SingleCellExperiment}(x)

\S4method{channels}{SingleCellExperiment}(x)

\S4method{marker_classes}{SingleCellExperiment}(x)

\S4method{type_markers}{SingleCellExperiment}(x)

\S4method{state_markers}{SingleCellExperiment}(x)

\S4method{sample_ids}{SingleCellExperiment}(x)

\S4method{cluster_ids}{SingleCellExperiment,missing}(x, k = NULL)

\S4method{cluster_ids}{SingleCellExperiment,character}(x, k = NULL)

\S4method{cluster_codes}{SingleCellExperiment}(x)

\S4method{delta_area}{SingleCellExperiment}(x)
}
\arguments{
\item{x}{a \code{\link[SingleCellExperiment]{SingleCellExperiment}}.}

\item{k}{character string specifying the clustering to extract.
Valid values are \code{names(cluster_codes(x))}.}
}
\value{
\describe{
\item{\code{ei}}{
extracts the experimental design table.}
\item{\code{n_cells}}{
extracts the number of events measured per sample.}
\item{\code{channels}}{
extracts the original FCS file's channel names.}
\item{\code{marker_classes}}{
extracts marker class assignments ("type", "state", "none").}
\item{\code{type_markers}}{
extracts the antigens used for clustering.}
\item{\code{state_markers}}{
extracts antigens that were not used for clustering.}
\item{\code{sample_ids}}{
extracts the sample IDs as specified in the metadata-table.}
\item{\code{cluster_ids}}{
extracts the numeric vector of cluster IDs 
as inferred by \code{\link{FlowSOM}}.}
\item{\code{cluster_codes}}{
extracts a \code{data.frame} containing cluster codes for the 
\code{\link{FlowSOM}} clustering, the \code{\link{ConsensusClusterPlus}} 
metaclustering, and all mergings done through \code{\link{mergeClusters}}.}
\item{\code{delta_area}}{
extracts the delta area plot stored in the 
SCE's \code{metadata} by \code{\link{cluster}}} 
}
}
\description{
Various wrappers to conviniently access slots
in a \code{\link[SingleCellExperiment]{SingleCellExperiment}}
created with \code{\link{prepData}}, and that are used 
frequently during differential analysis.
}
\examples{
# construct SCE & run clustering
data(PBMC_fs, PBMC_panel, PBMC_md)
sce <- prepData(PBMC_fs, PBMC_panel, PBMC_md)
sce <- cluster(sce)

# view experimental design table
ei(sce)

# quick-access sample & cluster assignments
plot(table(sample_ids(sce)))
plot(table(cluster_ids(sce)))

# access specific clustering resolution
table(cluster_ids(sce, k = "meta8"))

# access marker information
channels(sce)
marker_classes(sce)
type_markers(sce)
state_markers(sce)

# get cluster ID correspondece between 2 clusterings
old_ids <- seq_len(20)
m <- match(old_ids, cluster_codes(sce)$`meta20`)
new_ids <- cluster_codes(sce)$`meta12`[m]
data.frame(old_ids, new_ids)

# view delta area plot (relative change in area 
# under CDF curve vs. the number of clusters 'k')
delta_area(sce)
}
\author{
Helena L Crowell \email{helena.crowell@uzh.ch}
}
