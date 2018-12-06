#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
Rapexcharts  <- function(data,type,title=NULL,width=NULL,height=NULL, data_label = TRUE,
                  #legend_show=NULL,yAxisName='',yAxisMin=NULL,yAxisIndex=0,stack=NULL,
                  elementId = NULL,sparkLine_num = NULL
){
  x <- list()
  if(type[1]%in%c("line","bar")){
    x$chart <- list(
      type=unbox('line'),
      stroke=list(curve=unbox('smooth'))
    )
    #是否显示数值
    x$dataLabels <- list(enabled=unbox(data_label))
    #数据
    x$series <- series_rectangular(data,type)
    # 图形标记
    x$xaxis <- list(categories=row.names(data))
    #图例
    x$legend <- list(position= unbox('top'),horizontalAlign=unbox('center'),
                     offsetY=unbox(-10),offsetX=unbox(-5))
    #图形标题
    if(!is.null(title)){
      x$title <- list(text=unbox(title),align=unbox('center'))
    }


    #Y轴设置
    # x$yaxis <- list(
    #   for(i in seq(length(data))){
    #   data[[i]] <- list(name=unbox(list_name[i]),value=data[[i]])
    # }
    # )

  }else if(type[1]%in%c("stacked")){
    x$chart <- list(
      type=unbox('bar'),
      stacked=unbox(TRUE),
      stroke=list(curve=unbox('smooth'))
    )
    #是否显示数值
    x$dataLabels <- list(enabled=unbox(data_label))
    #数据
    x$series <- series_stacked(data,type)
    # 图形标记
    x$xaxis <- list(categories=row.names(data))
    #图形标题
    if(!is.null(title)){
      x$title <- list(text=unbox(title),align=unbox('center'))
    }
    #图例
    x$legend <- list(position= unbox('top'),horizontalAlign=unbox('center'),
                     offsetY=unbox(-10),offsetX=unbox(-5))
  }else if(type[1]%in%c("pie")){
    x$chart <- list(
     # width=unbox('100%'),
      type=unbox('pie')
    )
    #数据
    x$series <- series_pie(data)
    x$labels <-  colnames(data)
    #图形标题
    if(!is.null(title)){
      x$title <- list(text=unbox(title),align=unbox('center'))
    }

  }else if(type[1]%in%c("sparkLine")){
    x$chart <- list(
      type=unbox('area'),
      height=unbox(80),
      #width=unbox(200),
      sparkline=list(enabled=unbox(TRUE)),
      stroke=list(curve=unbox('straight'))
    )
    #数据
    x$series <- series_sparkLine(data,type)
    x$xaxis <- list(categories=row.names(data))
    if(!is.null(sparkLine_num)){
      x$title <- list(
        text=unbox(sparkLine_num),
        offsetX=unbox(0),
        style=list(fontSize=unbox('24px'))
      )
      if(!is.null(title)){
        x$subtitle <- list(
          text=unbox(title),
          offsetX=unbox(0),
          style=list(fontSize=unbox('14px'))
        )
      }
    }
  }
  x$grid <- list(
    borderColor=unbox('#e7e7e7'),
    row=list(colors=c('#f3f3f3','transparent'),opacity=unbox(0.5))
  )
  x <- jsonlite::toJSON(x)

  # create widget
  htmlwidgets::createWidget(
    name = 'Rapexcharts',
    x,
    width = width,
    height = height,
    package = 'Rapexcharts',
    elementId = elementId
  )
}

#' Shiny bindings for Rapexcharts
#'
#' Output and render functions for using Rapexcharts within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a Rapexcharts
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name Rapexcharts-shiny
#'
#' @export
RapexchartsOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'Rapexcharts', width, height, package = 'Rapexcharts')
}

#' @rdname Rapexcharts-shiny
#' @export
renderRapexcharts <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, RapexchartsOutput, env, quoted = TRUE)
}

