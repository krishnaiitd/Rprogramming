library(ggplot2)
#str(mpg)
## basic plot :qplot
plotView <- qplot(x = displ,# x coord
                  y = hwy, # y coord
                  data = mpg, # data frame
                  color = drv, ## if color and geom are added then three smooth lines if only geom added then one single line
                  geom = c("point", "smooth")
                  )
#print(plotView)

## Lets' try histograms of mpg data of 'hwy'
# check the data 
# mpg$hwy
plotView2 <- qplot(hwy, data = mpg, fill = drv)
#print(plotView2)

### Facets ###
plotViewFacets <- qplot(displ, hwy, data = mpg, facets = .~drv)
#print(plotViewFacets)

### histograms facets
plotViewFacetHist <- qplot(hwy, data = mpg, facets = drv~., binwidth = 4)
#print(plotViewFacetHist)

## density plot
plotViewDensity <- qplot(hwy, data = mpg, geom = "density", color = drv)
print(plotViewDensity)
