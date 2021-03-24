### (1) What is GSARefDB?
	GSARefDB is the most comprehensive list of available methods, tools, reviews, and databases for Gene Set Analysis, including their references, popularity indexes (citations), types of methods, and other descriptors.

	GSARefDB has seven main tables or menu options:
	
	(i) "General methods and tools" contains information about general GSA methods, platforms, and software tools, usually applied to mRNA data. 
	(ii) "Reviews and benchmarks" includes information on reviews of the field and tool comparisons. 
	(iii) "Genomic GSA" contains information of methods and tools for GSA applied to genomic range data, such as in ChIP-seq data, SNP data, and methylation data. 
	(iv) "ncRNA GSA" includes methods and tools for GSA applied to ncRNA data, such as miRNA, lncRNA, and others. 
	(v) "MS-based GSA" includes methods and tools for GSA applied to proteomic, metabolomic, glucomic, and lipidomic data, among others. 
	(vi) "Metagenomics GSA" includes methods and tools for GSA applied to metagenomic and metatranscriptomic data, among others. 
	(vii) "Integromics GSA" includes methods and tools for GSA of multiple omics datasets of a given experiment. 

	Also, a few other menu options such as this FAQ and the "Analysis" tab, which offers summary plots of the entire database.

### (2) How do I search and download information?	
	Each of the seven tables has a "Search" and a "Download" button to explore that table only. The search automatically retrieves all the rows whose information partially matches the query.

### (3) How to get the ranking of the most popular/cited papers?
	Each column, in each table, has the option of ordering that column in ascending or descending order (two small arrows next to the column name). If you want to see the popularity ranking, just order the "Citations" column in descending order.
	
### (4) What do the different types of GSA stand for?
	ORA = Over-Representation Analysis.
	FCS = Functional Class Scoring.
	PT = Pathway Topology-based.
	SS = Single-sample GSA.
	NI = Network Interaction.
	PA = Pathway activity.
	Bayes = Bayesian approach.
	ML = Machine Learning.
	subpath = Subpathway-based.
	time = Time-course/dynamic GSA.
	DC = Differential correlation-based.
	For more information on each type of GSA, see: https://doi.org/10.1093/bib/bbz090

### (5) What is Genomic GSA?
    "Genomic GSA" refers to the methods and software to apply Gene Set Analysis to datasets made of genomic ranges, such as ChIP-seq, SNP, and methylation data, among others.
	Usually, such methods map the genomic coordinates to nearby genes and then perform GSA for such genes. For more information, see: https://doi.org/10.1093/bib/bbz090

### (6) What is ncRNA GSA?
    "ncRNA GSA" refers to the methods and software to apply Gene Set Analysis to transcriptomic data of ncRNAs, such as miRNAs, lncRNAs, circRNAs, and others. 
	For more information on such methods, see: https://doi.org/10.1093/bib/bbz090

### (7) How was GSARefDB built?
	GSARefDb has been built using R version 3.6.3 and shiny version 1.4.0.2. Citation information is extracted from Google scholar. 
	All other information has been manually extracted from the papers. 

### (8) How can I contribute to GSARefDB?
	If your paper has not been included, or if you find an error in the database, please contact us to "thegsacentral" at "gmail".
	
### (9) How do I cite GSARefDB?
	Please cite the following two papers: https://doi.org/10.1093/bib/bbz090 and .
