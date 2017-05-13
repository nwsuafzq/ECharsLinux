<%@ page language="java" import="dbtaobao.connDb,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
ArrayList<String[]> list = connDb.index_2(); 
%> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>ECharts 可视化分析淘宝双11</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />

    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap-responsive.min.css" rel="stylesheet" />


    <link href="./css/font-awesome.css" rel="stylesheet" />

    <link href="./css/dbtaobao.css" rel="stylesheet" />
    <link href="./css/dbtaobao-responsive.css" rel="stylesheet" />

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>

<div class="navbar navbar-fixed-top">

	<div class="navbar-inner">

		<div class="container">

			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a>

			<a class="brand" href="./">ECharts 可视化分析淘宝双11</a>
		</div> <!-- /container -->

	</div> <!-- /navbar-inner -->
</div> <!-- /navbar -->
<div id="content">

	<div class="container">

		<div class="row">

			<div class="span3">

				<ul id="main-nav" class="nav nav-tabs nav-stacked">

					<li>
						<a href="./">
							<i></i>
							所有买家各消费行为对比
						</a>
					</li>

					<li>
						<a href="./index-1.jsp">
							<i></i>
							男女买家交易对比
						</a>
					</li>

					<li class="active">
						<a href="./index-2.jsp">
							<i></i>
							男女买家各个年龄段交易对比 
						</a>
					</li>

					<li>
						<a href="./index-3.jsp">
							<i></i>
							商品类别交易额对比
						</a>
					</li>

					<li>
						<a href="./index-4.jsp">
							<i></i>
							各省份的销量对比
						</a>
					</li>
					<li>
						<a href="./index-5.jsp">
							<i></i>
							回头客预测分数对比
						</a>
					</li>
				</ul>
				<hr />
				<br />
			</div> <!-- /span3 -->
			<div class="span9">

				<h1 class="page-title">
					<i class="icon-signal"></i>
					男女买家各个年龄段交易对比 
				</h1>
				
					


				<div class="widget">

					<div class="widget-header">
						<h3>散点图</h3>
					</div> <!-- /widget-header -->

					<div class="widget-content">

						<div id="main" class="chart-holder"></div>

					</div> <!-- /widget-content -->

				</div> <!-- /widget -->

			</div> <!-- /span9 -->


		</div> <!-- /row -->

	</div> <!-- /container -->

</div> <!-- /content -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="./js/jquery-1.7.2.min.js"></script>
<script src="./js/bootstrap.js"></script>
<script src="./js/echarts.min.js"></script>
<script>
// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));
var data = [
    [[<%=list.get(0)[1]%>,<%=list.get(0)[2]%>,,'women','women'],[<%=list.get(1)[1]%>,<%=list.get(1)[2]%>,,'women','women'],[<%=list.get(2)[1]%>,<%=list.get(2)[2]%>,,'women','women'],[<%=list.get(3)[1]%>,<%=list.get(3)[2]%>,,'women','women'],[<%=list.get(4)[1]%>,<%=list.get(4)[2]%>,,'women','women'],[<%=list.get(5)[1]%>,<%=list.get(5)[2]%>,,'women','women'],[<%=list.get(6)[1]%>,<%=list.get(6)[2]%>,,'women','women'],[<%=list.get(7)[1]%>,<%=list.get(7)[2]%>,,'women','women'],],
    [[<%=list.get(8)[1]%>,<%=list.get(8)[2]%>,,'men','men'],[<%=list.get(9)[1]%>,<%=list.get(9)[2]%>,,'men','men'],[<%=list.get(10)[1]%>,<%=list.get(10)[2]%>,,'men','men'],[<%=list.get(11)[1]%>,<%=list.get(11)[2]%>,,'men','men'],[<%=list.get(12)[1]%>,<%=list.get(12)[2]%>,,'men','men'],[<%=list.get(13)[1]%>,<%=list.get(13)[2]%>,,'men','men'],[<%=list.get(14)[1]%>,<%=list.get(14)[2]%>,,'men','men'],[<%=list.get(15)[1]%>,<%=list.get(15)[2]%>,,'men','men'],]
];

option = {
    backgroundColor: new echarts.graphic.RadialGradient(0.3, 0.3, 0.8, [{
        offset: 0,
        color: '#f7f8fa'
    }, {
        offset: 1,
        color: '#cdd0d5'
    }]),
    title: {
        text: '男女买家各个年龄段交易对比'
    },
    legend: {
        right: 10,
        data: ['men', 'women']
    },
    xAxis: {
        splitLine: {
            lineStyle: {
                type: 'dashed'
            }
        }
    },
    yAxis: {
        splitLine: {
            lineStyle: {
                type: 'dashed'
            }
        },
        scale: true
    },
    series: [{
        name: 'women',
        data: data[0],
        type: 'scatter',
        label: {
            emphasis: {
                show: true,
                formatter: function (param) {
                    return param.data[3];
                },
                position: 'top'
            }
        },
        itemStyle: {
            normal: {
                shadowBlur: 10,
                shadowColor: 'rgba(120, 36, 50, 0.5)',
                shadowOffsetY: 5,
                color: new echarts.graphic.RadialGradient(0.4, 0.3, 1, [{
                    offset: 0,
                    color: 'rgb(251, 118, 123)'
                }, {
                    offset: 1,
                    color: 'rgb(204, 46, 72)'
                }])
            }
        }
    }, {
        name: 'men',
        data: data[1],
        type: 'scatter',
        label: {
            emphasis: {
                show: true,
                formatter: function (param) {
                    return param.data[3];
                },
                position: 'top'
            }
        },
        itemStyle: {
            normal: {
                shadowBlur: 10,
                shadowColor: 'rgba(25, 100, 150, 0.5)',
                shadowOffsetY: 5,
                color: new echarts.graphic.RadialGradient(0.4, 0.3, 1, [{
                    offset: 0,
                    color: 'rgb(129, 227, 238)'
                }, {
                    offset: 1,
                    color: 'rgb(25, 183, 207)'
                }])
            }
        }
    }]
};
 myChart.setOption(option);
</script>
  </body>
</html>

