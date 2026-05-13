library(sp)
library(mapview)
library(gstat)
library(sf)



data("meuse")
coordinates(meuse) <- ~x+y
proj4string(meuse) <- CRS("+init=epsg:28992")

data("meuse.grid")

coordinates(meuse.grid) = ~x+y
proj4string(meuse.grid) <- CRS("+init=epsg:28992")
gridded(meuse.grid) = TRUE

meuse.pol = as(meuse.grid, "SpatialPolygonsDataFrame") 

meuse.pol = meuse.pol[,1]

names(meuse.pol) = "zinc"
meuse.pol$zinc = "?"

mapview(meuse.pol)

mapview(meuse, zcol = "zinc",   cex=3) + mapview(meuse.pol, zcol = "zinc", alpha.regions = 0 )

zinc.idw = idw(zinc~1, meuse, meuse.grid)

zinc.idw = zinc.idw[,"var1.pred"]
names(zinc.idw) = "zinc.pred"
mapview(zinc.idw, alpha.regions = 0.5) + mapview(meuse.pol, zcol = "zinc", alpha.regions = 0 )

zidw = as(zinc.idw, "SpatialPolygonsDataFrame") 
zidw$zinc.pred = round(zidw$zinc.pred,1)

library(leaflet)
p =getSpPPolygonsLabptSlots(zidw)
df = data.frame(x=p[,1], y=p[,2], zinc.pred=zidw$zinc.pred)
coordinates(df) = ~x+y
proj4string(df) <- CRS("+init=epsg:28992")
                               
mapview(df, zcol = "zinc.pred", alpha.regions = 0.9, label=as.character(df$zinc.pred), 
        labelOptions = labelOptions(noHide = TRUE, textOnly = TRUE))

library(leafem)
px = df[1100:1120,]
mapview(px, cex=1, alpha.regions = 0) %>%
addStaticLabels(label = as.character(df$zinc.pred),
                noHide = TRUE,
                direction = 'top',
                textOnly = TRUE,
                textsize = "20px")

library(plotKML)

kml(zidw, colour = zinc.pred, plot.labpt = TRUE, 
    labels = zinc.pred, kmz = TRUE, balloon=TRUE)

zz = zinc.idw
zz$zinc.pred = log(zinc.idw$zinc.pred)
kml(zz, colour = zinc.pred, kmz = TRUE)

kml(zinc.idw, colour = zinc.pred, kmz = TRUE)

kml(meuse, shape = "http://maps.google.com/mapfiles/kml/pal2/icon18.png",
    size = zinc, colour = zinc, labels = zinc)

data(SAGA_pal)
data("R_pal")

meuse.grid$dist2 = meuse.grid$dist*1000
kml(meuse.grid,  colour_scale = R_pal[[8]], colour = dist2 , labels = zinc)


lznr.vgm = variogram(log(zinc)~sqrt(dist), meuse)
lznr.fit = fit.variogram(lznr.vgm, model = vgm(1, "Exp", 300, 1))
lzn.kriged = krige(log(zinc)~1, meuse, meuse.grid, model = lznr.fit)

mapview(lzn.kriged, zcol="var1.pred")

kml(lzn.kriged, colour = var1.pred, labels = var1.pred)

kml(meuse, labels = zinc)
kml(meuse.grid, colour=soil, colour_scale = R_pal[[10]], file.name="soil.kml")
kml(meuse.grid, colour=ffreq,colour_scale = R_pal[[9]], file.name="ffreq.kml")

m = st_as_sf(meuse[, c("zinc","dist","ffreq","soil")])

library(RColorBrewer)
options(rgl.debug = TRUE)
library(rgl)
require(raster)
library(rasterVis)
zz = zinc.idw
zz$zinc.pred = log(zinc.idw$zinc.pred)
alt = raster(zz)

plot3D(alt , drape=NULL, zfac=0.9,
       col=colorRampPalette(SAGA_pal[[1]] ))

alt2 = raster(lzn.kriged)
plot3D(alt2 , drape=NULL, zfac=0.9,
       col=colorRampPalette(SAGA_pal[[1]] ))


load.image("C:/Users/user/Dropbox/PredavanjeMISANU/test.RData")

library(sf)
library(sp)
data(meuse)
coordinates(meuse) = ~x+y
proj4string(meuse) <- CRS("+init=epsg:28992")
m.sf = st_as_sf(meuse)


demo(meuse, echo=FALSE)
grid.dist0 <- landmap::buffer.dist(meuse["zinc"], meuse.grid[1], 
                                   classes=as.factor(1:nrow(meuse)))

spplot(grid.dist0[,c(1:5, 150:155)])
