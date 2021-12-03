#fname <- paste(getwd(),"Statistical_Inference/Variance/Vform.jpeg",sep="/")
fname <- pathtofile("Vform.jpeg")
try(dev.off(),silent=TRUE)
tryCatch( {
    plot.new()
    },
    error=function(e){
        if(as.character(e)=="Error in plot.new(): figure margins too large\n"){
            print("Plot window too small. Increase size of the plot window")
            par(mar=rep(1,4))
            plot.new()
    }
})
plotArea=par('fig')
rasterImage(readJPEG(fname),plotArea[1],plotArea[3],plotArea[2],plotArea[4],interpolate=FALSE)
