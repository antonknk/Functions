# EXPORT GGPLOTS TO TIKZ
require(tikzDevice)
require(ggplot2)

ggtiksave <- function(filename, 
              plot_to_store = last_plot(),
              width = 5, 
              height = 3.5){
  tikz(file = filename, height = height, width = width)
  
  plot_to_store <- plot_to_store +
    theme(plot.title = element_text(size = rel(1), vjust = 0), 
            axis.title = element_text(size = rel(0.8)),
            axis.title.y = element_text( vjust=2 ),
            axis.title.x = element_text( vjust=-0.5 ))
  
  print(plot_to_store)
  dev.off()
}
