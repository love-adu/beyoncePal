# beyoncePal

An R color palette sampled from Beyonce eras! Only Dangerously in Love for now, since I am lazy.

## install

```r
# install.packages("devtools")
devtools::install_github("love-adu/beyoncePal")
```

## use

```r
library(beyoncePal)

bey_pal("dangerously_in_love", show_me = TRUE)
bey_pal(n = 20)   # asking for more colors blends between them

library(ggplot2)
ggplot(mpg, aes(class, fill = class)) +
  geom_bar() +
  scale_fill_bey("dangerously_in_love")
```


## your own colors

```r
bey_pal(c("#B22234", "#F5F0E6", "#3C3B6E"))
bey_add_palette("mine", c("#B22234", "#F5F0E6", "#3C3B6E", "#D2A679"))
bey_pal("mine")
```
