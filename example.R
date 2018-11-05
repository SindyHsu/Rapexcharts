library(Rapexcharts)
library(jsonlite)

#line&bar
data_line_bar <- data.frame('最高'=c(35,45,40,35,55,35,45,40,35,55),
                            '中间'=c(2.5,3.5,3.0,2.5,4.5,2.5,3.5,3.0,2.5,4.5),
                            '最低'=c(1.5,2.5,2.0,1.5,3.5,1.5,2.5,2.0,1.5,3.5))
row.names(data_line_bar) <- c('3-1','3-2','3-3','3-4','3-5','3-6','3-7','3-8','3-9','3-10')
Rapexcharts(data_line_bar,type="bar",title = '柱形图')

#sparkLine
data_sparkLine <- data.frame('最高'=c(35,45,40,35,55,35,45,40,35,55))
Rapexcharts(data_sparkLine,type="sparkLine",sparkLine_num='$6000',title='test')

#pie
data_pie <- data.frame('直接访问'=10,
                       'SEO'=20,
                       'SEM'=30,
                       'REF'=40)
Rapexcharts(data_pie,type="pie")

#堆积条形图
Rapexcharts(data_line_bar,type="stacked",'test')
