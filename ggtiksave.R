# EXPORT GGPLOTS TO TIKZ
require(tikzDevice)
require(ggplot2)

ggtiksave <- function(filename, 
              plot_to_store = last_plot(),
              width = 5, 
              height = 3.5,
              plot.title.textsize.rel = 1,
              plot.title.textsize.vjust = 0,
              axis.title.textsize.rel = .8,
              axis.title.y.textsize.vjust = 2,
              axis.title.x.textsize.vjust = -0.5){
  
  # Create tikz file
  tikz(file = filename, height = height, width = width)
  
  # add correction parameters to labels
  plot_to_store <- plot_to_store +
    theme(plot.title = element_text(size = rel(plot.title.textsize.rel), 
                                    vjust = plot.title.textsize.vjust), 
            axis.title = element_text(size = rel(axis.title.textsize.rel)),
            axis.title.y = element_text(vjust = axis.title.y.textsize.vjust),
            axis.title.x = element_text(vjust = axis.title.x.textsize.vjust))
  
  # write plot to file
  print(plot_to_store)
  
  # close device and save file
  dev.off()
}
