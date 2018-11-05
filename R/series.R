#折线图、柱状图;data <- data_line_bar
series_rectangular <- function(data,type){
  list_name <- colnames(data)
  colnames(data) <- NULL
  data <- as.list(data)
  if(length(type)==1){type <- rep(type,length(data))}
  for(i in seq(length(data))){
    data[[i]] <- list(name=unbox(list_name[i]),
                      type=unbox(type[i]),
                      data=data[[i]])
  }
  return(data)
}

#波形图
series_sparkLine <- function(data,type){
  list_name <- colnames(data)
  colnames(data) <- NULL
  data <- as.list(data)
  #可以在此修改sparkLine图形类别
  for(i in seq(length(data))){
    data[[i]] <- list(name=unbox(list_name[i]),
                      type=unbox('area'),
                      data=data[[i]])
  }
  return(data)
}

#堆积条形图
series_stacked <- function(data,type){
  list_name <- colnames(data)
  colnames(data) <- NULL
  data <- as.list(data)
  for(i in seq(length(data))){
    data[[i]] <- list(name=unbox(list_name[i]),
                      data=data[[i]])
  }
  return(data)
}
#饼图
series_pie <- function(data){
  data <- as.numeric(unlist(strsplit(paste(data,collapse = ','),',')))
  #data <- c(10,20,30,40)
  return(data)
}



