# Code to reproduce the Figure 1 from the paper "Popularity versus performance of bioinformatics software –The case of Gene Set Analysis"
# Coded by: Antonio Mora
# (Acknowledgments: Chengshu Xie)
# Date: 26-09-2019

library(tidyverse)
library(reshape2)
library(ggpubr)

# Datasets:
fig1_years = c(1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019)
fig1_tools = c(1, 1, 1, 4, 12, 22, 20, 22, 26, 17, 34, 33, 21, 34, 22, 29, 28, 27, 35, 26, 26)
fig1_rev_bench = c(0, 0, 0, 0, 0, 0, 2, 2, 4, 5, 4, 7, 5, 3, 8, 6, 9, 1, 2, 3, 1)
fig1_total = c(1, 1, 1, 4, 12, 22, 22, 24, 30, 22, 38, 40, 26, 37, 30, 35, 37, 28, 37, 29, 27)
df1 = tibble(Years=fig1_years, Tools=fig1_tools, Reviews=fig1_rev_bench, Total=fig1_total)

fig2_language = c("Web", "Stand-alone/Java/VBasic", "R/S-PLUS/Shiny", "Cytoscape", "Perl", "Python", "C/C++/C#", "MatLab/Mathematica", "Galaxy")
fig2_tools = c(101, 44, 118, 5, 7, 5, 7, 10, 1)
fig2_citations = c(36004, 29331, 17742, 6019, 2659, 2250, 1055, 274, 58)
df2 = tibble(Program=fig2_language, tools=fig2_tools, citations=fig2_citations)

fig3_legend = c("No website info", "Link not Working", "WORKING")
fig3_amount = c(110, 80, 160)
df3 = tibble(Availability=fig3_legend, amount=fig3_amount)

fig4_method_name = c("Consistency with biological knowledge", "Classification accuracy / Discriminative power", "Consistency between similar samples", "Number of predictions", "Comparing statistical power", "Simulations -statistical power", "Comparing size of p-values or FDR", "Benchmark -sensitivity,specificity,prioritization, gold standard", "Simulations -others", "Agreement between tools", "Simulations -precision,recall,prioritization", "Simulations -size p-values", "Consistency with cancer hallmarks or oncogenic mutations", "Consistency with tissue specificity", "Speed", "Semi-blind", "Overlap with results of different experimental technique", "Experimental confirmation of predictions", "Benchmark -Intersection of tools as gold standard")
fig4_freq = c(28, 6, 6, 6, 5, 5, 4, 4, 4, 3, 3, 2, 2, 1, 1, 1, 1, 1, 1)
df4 = tibble(method=fig4_method_name, frequency=fig4_freq)

fig5_type_method = c("Over-Representation Analysis", "Functional Class Scoring", "Pathway Topology-based", "Multiple (usually ORA plus FCS)", "Network Interaction", "Single-Sample", "Pathway Activation", "Time course", "Machine Learning approach", "Bayesian approach", "Others", "Differential Correlation", "Subpathway approach")
fig5_freq = c(124, 61, 34, 23, 19, 19, 17, 15, 13, 11, 10, 9, 7)
df5 = tibble(type=fig5_type_method, frequency=fig5_freq)

# Individual plots:
mydata1 <- melt(df1, id.vars=c("Years"),variable.name="Type", value.name="Publications")
fig1 <- ggplot(mydata1, aes(x=Years,y=Publications, group=Type, color=Type, shape=Type)) + 
  geom_line(size = 0.8) +
  geom_point() + theme(legend.title = element_blank(), plot.margin=unit(c(3,1,3,1),"lines")) + labs(x= "Years", y= "Number of publications")
fig1

myLabel2 = paste(as.vector(df2$Program), " (", round(df2$tools/sum(df2$tools) * 100, 2), "%) ", sep = "")
fig2 <- ggplot(df2, aes(x = 2, y = tools, fill = Program)) +
  geom_bar(stat = "identity", color = "white") +
  coord_polar(theta = "y", start = 0) +
  theme_void()+
  geom_text(aes(label = tools), position = position_stack(vjust = 0.5), size=3, color = "white") +
  scale_fill_discrete(breaks = df2$Program, labels = myLabel2) +
  xlim(0.5, 2.5) + theme(legend.title = element_blank(), plot.margin=unit(c(3,1,3,1),"lines"))
fig2

myLabel2b = paste(as.vector(df2$Program), " (", df2$citations, ") ", sep = "")
fig2b <- ggplot(df2, aes(x = 2, y = citations, fill = Program)) +
  geom_bar(stat = "identity", color = "white") +
  coord_polar(theta = "y", start = 0) +
  theme_void() +
  scale_fill_discrete(breaks = df2$Program, labels = myLabel2b) +
  xlim(0.5, 2.5) + theme(legend.title = element_blank(), plot.margin=unit(c(3,1,3,1),"lines"))
fig2b

myLabel3 = paste(as.vector(df3$Availability), " (", round(df3$amount/sum(df3$amount) * 100, 2), "%) ", sep = "")
fig3 <- ggplot(df3, aes(x = "", y = amount, fill = Availability)) +
  geom_bar(stat = "identity", color = "white") +
  coord_polar("y", start = 0) +
  theme_void() +
  geom_text(aes(label = amount), position = position_stack(vjust = 0.5), size=5, color = "white") +
  scale_fill_discrete(breaks = df3$Availability, labels = myLabel3) + theme(plot.margin=unit(c(3,1,3,1),"lines"))
fig3

fig4 <- ggplot(df4, aes(x = method, y = frequency, fill = method)) +
  geom_bar(stat = "identity", color = "white", show.legend=FALSE) + coord_flip() +
  geom_text(aes(label=frequency), vjust=-0.3, size=3.5) +
  theme_minimal() + theme(plot.margin=unit(c(3,1,3,1),"lines"))
fig4

fig5 <- ggplot(df5, aes(x = type, y = frequency, fill = type)) +
  geom_bar(stat = "identity", color = "white", show.legend=FALSE) + coord_flip() +
  geom_text(aes(label=frequency), vjust=-0.3, size=3.5) +
  theme_minimal() + theme(plot.margin=unit(c(3,1,3,1),"lines"))
fig5

# Building the final figure:
figm = ggarrange(fig1, fig5, labels=c("(a) Number of publications per year","(b) Publications per GSA type of method"), font.label = list(size = 12))
fign = ggarrange(fig2, fig2b, labels=c("(c) Number of publications per programming language","(d) Number of citations per programming language"), font.label = list(size = 12))
figo = ggarrange(fig3, fig4, labels=c("(e) Website availability","(f) Publications per reported validation method"), font.label = list(size = 12))
figa = ggarrange(figm,fign,figo,nrow=3,ncol=1)

# png("fig1.png", height = 1024, width = 960)
#  ggarrange(figm,fign,figo,nrow=3,ncol=1)
# dev.off()

