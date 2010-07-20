mesh2ply<-function(x,filename="default")
{	
	if (is.matrix(x))
		{x<-list(vb=x)}
	filename<-paste(filename,".ply",sep="")
	vert<-x$vb[1:3,]
	if (!is.null(x$it))
		{face<-x$it-1
		fd<-3
		fn<-dim(face)[2]
		}
	else 
		{fn<-0
		}	
	vert.all<-vert
	vn<-dim(vert)[2]
	vn.all<-3
	texfile<-x$TextureFile
		
	
### start writing to file ###

### write header ###
	cat("ply\nformat ascii 1.0\ncomment MORPHO generated\n",file=filename)

	### check for Texture information and write to header ###	
	
	if (is.character(texfile))
		{cat(paste("comment TextureFile ",texfile,"\n",sep=""),file=filename,append=TRUE) 
		}

	### write vertex infos to header ###
	
	v.info<-paste("element vertex ",vn,"\n","property float x\nproperty float y\nproperty float z\n",sep="")	
	cat(v.info,file=filename,append=TRUE)	
		if (!is.null(x$normals))
			{cat("property float nx\nproperty float ny\nproperty float nz\n",file=filename,append=TRUE)
			vert.all<-rbind(vert,x$normals[1:3,])	
			vn.all<-6		
			}
	### write face infos and texture infos to header and finish ###	
	
	cat(paste("element face ",fn,"\n",sep=""),file=filename,append=TRUE)	
	if(!is.null(x$tex) && is.character(texfile))
		{cat("property list uchar int vertex_indices\nproperty list uchar float texcoord\nend_header\n",file=filename,append=TRUE)	
		}
	else
		{cat("property list uchar int vertex_indices\nend_header\n",file=filename,append=TRUE)	
		}
	
	### write vertices and vertex normals ###
	write.table(t(vert.all),file=filename,sep=" ",append=TRUE, quote = FALSE, row.names = FALSE, col.names = FALSE, na = "")	

	
	### write face and Texture information ###	
	if (!is.null(x$it)){
	if(!is.null(x$tex) && !is.null(x$TextureFile))
		{tex<-x$tex
		texn<-dim(tex)[2]
		faceraw<-rbind(fd,face)
		facetex<-t(cbind(texn,tex))
		write.table(t(rbind(faceraw,facetex)),file=filename,sep=" ",append=TRUE,quote = FALSE, row.names = FALSE, col.names = FALSE, na = "")			
		}
	else
		{write.table(format(t(rbind(fd,face))),file=filename,sep=" ",append=TRUE,quote = FALSE, row.names = FALSE, col.names = FALSE, na = "")	
		}
	}
}
