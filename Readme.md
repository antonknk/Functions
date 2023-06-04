Readme
================
Anton Könneke
2023-06-01

This repository stores some helper functions that I use.

# Save ggplot as tikz

This is handy for exporting ggplots to LaTeX with the `ggsave` framework
and `last_plot`. The function builds on the approach outlined by [Ilyass
Tabiai](https://github.com/ilyasst) in this [blog
post](http://iltabiai.github.io/tips/latex/2015/09/15/latex-tikzdevice-r.html).
The main part is done by the package
[tikzDevice](https://github.com/daqana/tikzDevice) by Charlie Sharpsteen
et al.

``` r
library(ggplot2)
library(tikzDevice)
source("ggtiksave.R")

ggplot(mpg)+
  geom_point(aes(displ, cty, color = drv))+
  theme_minimal()+
  xlab("Look, greek letters $\\alpha \\beta \\Gamma \\Phi$")+
  ylab("And Math! $\\frac{20}{19} \\prod_{k=1}^n$ ")+
  ggtitle("Wait, is this \\LaTeX?")
```

![](Readme_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

``` r
ggtiksave("myplot.tex")
```

    ## quartz_off_screen 
    ##                 2

And this is the result if `myplot.tex` is `input` into a tex doc (with
tikz loaded!).

![Latin Modern](latex_screenshot.png)

The neat thing is that now, whenever the font of the file is changed, so
is the font in the plot:

## Palatino Font

![Palatino font](font1.png)

## Linux Libertine Font

![Libertine font](font2.png)

# Encode Excel columns

Quite frequently when working with human generated excel files, spaces
are accidentially stored in numeric cells. In addition to that, it is
common to use `,`instead of `.` as decimal markers in germany. As
neither `readxl::read_xlsx` nor `openxlsx::read.xlsx` seem able to
account for this, this little function does the correction afterwards.
By wrapping it in `mutate(across())` call, the job can be easily done.

``` r
source("fix_excel_numcols.R")
require(dplyr)
df <- tibble(
  A = c("1,3", "1,5 ", "2"),
  B = c("1,1", "5,5 ", " 2,4")
)

df %>% 
  mutate(across(everything(), ~fix_excel_numcols(.x)))
```

    ## # A tibble: 3 × 2
    ##       A     B
    ##   <dbl> <dbl>
    ## 1   1.3   1.1
    ## 2   1.5   5.5
    ## 3   2     2.4
