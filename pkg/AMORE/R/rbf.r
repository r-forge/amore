#
# J. Ordieres  Conceptos para el RBF
# v 1.0 2010-08-22
# 
#
#
# #######################################################################################
# normalizar
#       data        : Datos a normalziar por columnas
#			  obj         : Si NULL => Se normaliza, sino se desnormaliza cada columna según obj
# 			val         : Si se normalzia, se escala cada columna de datos hasta -val, val
#
normalizar=function(data,obj=NULL,val=0.9){
	eps=0.0001;
	id<-vector(mode="numeric",length=(dim(data)[2]));
	ndata<-data;
	if ( is.null(obj) ) {
		desde = apply(data,2,range);
		hasta <- desde;
		hasta[1,] <- -val;
		hasta[2,] <- val;
	} else {
		desde <- obj$from;
		hasta <- obj$to;
	}
	for ( i in 1:(dim(data))[2]) {
		if ( abs(desde[2,i]-desde[1,i]) > eps ) {
				id[i]<-1;
				ndata[,i]<- ((data[,i] - desde[1,i])/(desde[2,i]-desde[1,i]))*(hasta[2,i]-hasta[1,i])+hasta[1,i];
		} else {
				id[i]<-0;
				ndata[,i]<-data[,i];
		}
	}
	return(pairlist(data=ndata,from=desde,to=hasta,id=id));
}
#
# frbf:
#    	  x          : input pattern to be evaluated
#       c          : center of the gausian
#       sig        : standar deviation for the gausian. Caution it will be squared
frbf=function(x,c,sig){
	return(exp((-norm(x-c)^2)/(2*sig^2)));
}
#
# #########################################################################################
# trainrbf:
#       data        : Dataframe with patterns for training. Last column will be the output
#       nrbf        : Number of gaussian units to be used. i.e. number of clusters to accept
#       percent_dist: % of width's clusters to be used as standar deviation for rbf neurons
#			  metric      : E=> Euclidean; M=> Manhattan
#       normalize   : ON => Call to normalize will be carried out. OFF => Don't call
#  
trainrbf=function(data,nrbf,percent_dist=75,metric="E",normalize="OFF") {
	require("stats");
	require("cluster");
	
	if (normalize == "ON") {
		ddata <- normalizar(data,NULL,0.9);
		ddat  <- ddata$data;
		dnrm  <- pairlist(from=ddata$from,to=ddata$to,id=ddata$id);
	} else {
	  ddat  <- data;
	  from  <- data[1:2,]; from[1,]<-0;from[2,]<-1;
	  iid   <- from[1,];
	  dnrm  <- pairlist(from=from,to=from,id=iid);
	}
  if (metric == "M") {
		met="manhattan";
	} else {
		if ( metric == "E" ) {
			met="euclidean";
		} else {
			stop ("Distance function invalid");
		}
	}
	pdat    <- clara(ddat,nrbf,medoids.x=FALSE,keep.data=FALSE,rngR=TRUE);
	nrw     <- dim(ddat)[1];
	ncl     <- dim(ddat)[2];
	centers <- ddat[pdat$i.med,-ncl];
	radius  <- pdat$silinfo$clus.avg.widths*percent_dist/100.;
	xtmp    <- matrix(data=NA,nrow=nrw,ncol=nrbf);
	for ( i in 1:nrbf) {
		xtmp[,i]<-as.vector(apply(ddat[,-ncl],1,frbf,centers[i,],radius[i]));
	}
	fm<-lm(ddat[,ncl]~xtmp);
	ss<-summary(fm);
	quality<-pairlist(cluster.accuracy=pdat$silinfo,linear.weights.sigma=ss$sigma,
	                  linear.weights.r_squared=ss$r.squared,linear.weights.df=ss$df,
	                  linear.weights.adj_r_squared=ss$adj.r.squared,
	                  linear.weights.fstatistic=ss$fstatistic);
	xx<-pairlist(ninput=ncl-1,nrbf=nrbf,centers=centers,radius=radius,
										coef=coef(fm),dnrm=dnrm,quality=quality);
	class(xx)<-"rbfnetwork";
	return(xx);
}
#
#
# flstep
#        x       : data
#        weights : weights for linear step
#        bias    : bias for linear step
flstep=function(x,weights,bias) {
	ss<-sum(x*weights)+bias;
	return(ss);
}
#
#
# predict.rbf
#          object      : Trained rbf network
#          input       : data frame with input patterns
#					 normalize   : ON => Call to normalize will be carried out. OFF => Don't call
predict.rbf=function(obj,input,normalize) {
	require("stats");
	require("cluster");
	if (! class(obj) == "rbfnetwork" ) {
		stop("The OBJ is not a trained RBF.");
	}
	if (normalize == "ON" ) {
		nrmd   <- obj$dnrm$from;
		nrmt   <- obj$dnrm$to;
		nrmobj <- pairlist(desde=nrmd,hasta=nrmt);
		nin    <- normalizar(input,nrmobj,1000.);
		ninp   <- nin$data;
	} else {
		ninp   <- input;
	}
	if ( is.vector(ninp) ) {
		nn     <- matrix(data=NA,nrow=1,ncol=length(ninp));
		nn[1,] <- ninp;
		ninp   <- nn;
	}
	if (dim(ninp)[2] != obj$ninput ) {
		stop("Error: Input dimension is different from number RBF inputs");
	} 
	xtmp    <- matrix(data=NA,nrow=dim(ninp)[1],ncol=obj$nrbf);
	for ( i in 1:obj$nrbf) {
		xtmp[,i]<-as.vector(apply(ninp,1,frbf,obj$centers[i,],obj$radius[i]));
	}
	weights<-obj$coef[-1];
	bias   <-obj$coef[1];
	vv     <- as.vector(apply(xtmp,1,flstep,weights,bias));
	if ( normalize == "ON" ) {
		dnrmobj <- pairlist(from=nrmobj$hasta,to=nrmobj$desde);
		res     <- normalizar(vv,dnrmobj,1000.);
		vv      <- res$data;
	}
	return(vv);
}