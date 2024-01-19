library(devtools)
library(lidR)  
library(sf) 
library(ggplot2) 
library(proxy)
library(raster)
library(sp)
library(viridis)
library(viridisLite)
library(terra)


mypath<- ("E:/PhD in Sopron/Coureses/Data collection and Analysis/My Training data/lab07Data")
myfile<- "clp_26Oct2017.las"
infile<- file.path(mypath,myfile)
las<- readLAS(infile, select = "xyzirc")
las_orig<- las
plot(las)
summary(las)

las<- las_orig
######the random parameter specifies the desired points-per-square-meter 
lasd<- decimate_points(las,random(10))
summary(las)
summary(lasd)
plot(lasd)
######Record Summary Results for lasd
las<- lasd
las_orig<- las
#####Classify 'ground' points, will use for terrain model (ground model) for topographic analysis
#####Link to lasground/csf documentation: https://www.rdocumentation.org/packages/lidR/versions/2.0.0/topics/csf
plot(las, color = "Classification")
summary(las)
######reset las to the original (decimated) point cloud
las<- las_orig  
#####adjusting cloth_resolution, class_threshold, and rigidness parameters affects the ground point classification 
install.packages("RCSF")
library(RCSF)
las<- classify_ground(las,csf(cloth_resolution = 0.5, class_threshold = 0.15, rigidness = 1), last_returns = FALSE)
las_ground <- las
plot(las_ground, color = "Classification")
summary(las_ground)
las_ground_bak<- las_ground

######change the k and p parameters to adjust the K-Nearest Neighbor search window
las_ground_normalized<- normalize_height(las_ground,knnidw(k=20,p=2))
plot(las_ground_normalized)
summary(las_ground_normalized)

######Record Summary Results for las_ground_normalized, before removal of outliers
######
######Remove below 0m and above 2m points - using normalized values
las_ground_normalized<- filter_poi(las_ground_normalized,(Z >= 0))
las_ground_normalized<- filter_poi(las_ground_normalized,(Z < 2))
plot(las_ground_normalized)
######Record Summary Results for las_ground_normalized, after removal of outliers
######
######Create Terrain model, save it out as a TIFF
######ZRef is carried over from the lasnormalize command (see help documentation)
######lasnormalize documentation: https://www.rdocumentation.org/packages/lidR/versions/2.0.0/topics/lasnormalize
lasunngrd<- grid_metrics(las_ground_normalized, func=min(Zref), 2)
writeRaster(lasunngrd, filename = file.path(mypath,"treeainZ4.tif"), format="GTiff", overwrite=TRUE)
plot(las_ground_normalized,color="Z")
plot(las_ground_normalized,color="Zref")

#####Generate the terrain model, approach 2 
#####grid_terrain documentation: https://www.rdocumentation.org/packages/lidR/versions/2.0.0/topics/grid_terrain
las<- las_orig
plot(las)
las<- filter_poi(las, z > 0, z < 40)
######again, adjust the k and p parameters to change the KNN search window
dtm1<-grid_terrain(las, res = 0.25, algorithm = knnidw(k=5,p = 0.5), keep_lowest = TRUE)

plot(dtm1)
writeRaster(dtm1 ,filename = file.path(mypath,"dtm5_05.tif"), format="GTiff",overwrite=TRUE)

######
######4.
#####grid_canopy documentation: https://www.rdocumentation.org/packages/lidR/versions/2.0.0/topics/grid_canopy
#####CHM, canopy height model, should be near identical to the surface model exported from Agisoft
######review the grid_canopy documentation to figure out how the parameters will effect the putput
chm <- grid_canopy(las, res = 1, pitfree(c(0,2,5,10,15), c(0, 1.5)))
plot(chm)
raster::plot(chm)
##### create high resolution image for crown height model
png("chm.png", width = 2000, height = 2000, res = 300)
plot(chm)
dev.off()

writeRaster(chm,filename = file.path(mypath,"chm_1m.tif"), format="GTiff",overwrite=TRUE)
######
######5.
#####Individual tree detection documentation: https://www.rdocumentation.org/packages/lidR/versions/2.0.0/topics/tree_detection
#####LMF algorithm documentation: https://www.rdocumentation.org/packages/lidR/versions/2.0.0/topics/lmf
######another opportunity to adjust parameters (see the documentation for assistance)
ttops = locate_trees(las_ground_normalized, lmf(ws=2, hmin=1, shape = "circular"))
######Write tree tops out as a point shapefile
writeOGR(obj=ttops,dsn=mypath, layer="ttops2", driver="ESRI Shapefile", overwrite=TRUE)
error
### solution 1
write_sf(obj=ttops,dsn=mypath, layer="ttops2", driver="ESRI Shapefile", overwrite=TRUE)












