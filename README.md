# beyoncePal

An R color palette sampled from the Dangerously in Love era: the two covers and
the Crazy in Love, Baby Boy, and Naughty Girl videos. It's the only palette for
now.

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

Colors come out in the order they're listed, so a small `n` gives you the first
few (the dark blues and purple).

## your own colors

```r
bey_pal(c("#B22234", "#F5F0E6", "#3C3B6E"))
bey_add_palette("mine", c("#B22234", "#F5F0E6", "#3C3B6E", "#D2A679"))
bey_pal("mine")
```
