# periodic-analysis--yeast-cell-cycle
Summary:
Web scraper that pulls analyses of periodicity of yeast cell expression levels throughout cell cycle: used to reorder scrambled time step data based on periodicity of possible datapoint permutations. Developed for a bioinformatics project.

---

Throughout initial research of the yeast cell cycle, we encountered a survey utilizing the combination of five yeast cell-cycle datasets to analyze the periodic expression of genes throughout. While the scripts and full dataset was no longer accessible, we were able to view a webpage for individual genes containing whether or not the gene expression could be considered periodic, and the ranking of its relative periodicity in comparison to the entire set of genes. 

Using a Python web-crawler script (pull_periodic_data.py) in combination with the openpyxl Python-Excel library, we were able to iterate over each of the 400 genes in the provided 'scrambled.xlsx' dataset, pulling its periodic classification and rank into another Excel file (periodic_analysis.xlsx). Of the 400 provided genes, 143 were considered periodic according to this study, 4 weren't found in the study's posted results, and 253 were classified as not exhibiting periodic behavior.

Using the 143 genes considered periodic, we can utilize the expectation of periodic behavior to attempt to arrange the 10 time stamps in the correct order. If the timestamps accurately represent the periodic behavior of these genes' expressions throughout the cell cycle, we should be able to quantify the periodicity of varying arrangements of the 10 time stamps, and select which arrangement best captures these periodic trends.

In order to do this, we utilized Matlab's periodogram function, which utilizes Fourier transforms to capture the power spectral density of a function, essentially highlighting periodicity of a function. The Matlab function written to capture the level of periodicity of the ordered 10 timestamps can be seen in compute_periodicity.m. 

Computing across all possible permutations of data ordering would require us to perform 143*10! iterations, one for each periodic gene across all possible arrangements of the 10 timestamps. As we don't have that much time or computational power to run each possibility, we instead combined this method with the heatmap method, testing across the four permutations highlighted as potential orderings: optimally, results will further corroborate one of the two selected permutations (Manhattan, Pearson). An alternate function will be included that will permute across all potential datapoint permutations.

In order to apply these four orderings to the 10 time stamps for the 143 periodic genes, we utilized Python once again to pull and arrange each of the gene's 10 data points, pipe those points to Matlab using Matlab's Python API and the Python Matlab engine to compute the level of periodicity of each arrangement, and record the most periodic arrangement for each in 'results_heatmap.xlsx'. This script is included as 'permutations_heatmap.py'.

The output from this analysis provided us with the 'most periodic' ordering of the 10 timestamps for each of the 143 periodic genes. In order to weigh and analyze these results, we took advantage of the periodicity rankings scraped from the initially referenced study. Keeping the genes in ranked order of periodicity, we were able to use the most_periodic_heatmap.py script to analyze which of the four potential orderings best captures the periodic behavior of the genes.

The third permutation, or [2, 1, 5, 4, 8, 3, 9, 10, 6, 7] in terms of the initial column ordering, appears as the highest periodicity value in the largest amount of the genes exhibiting high levels of periodic behavior. This matches up with the earlier Manhattan heatmap analysis performed, supporting this permutation of timestamps as a potential solution.

Referenced study: http://noble.gs.washington.edu/proj/cellcycle/
