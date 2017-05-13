<%@ page language="java" import="dbtaobao.connDb,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
ArrayList<String[]> list = connDb.index_5(); 
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

					<li>
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
					<li class='active'>
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
					回头客预测分数对比
				</h1>
				
					


				<div class="widget">

					<div class="widget-header">
						<h3>柱状图</h3>
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
//基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));

// 指定图表的配置项和数据
var option = {
    title: {
        text: '回头客预测分数对比'
    },
    tooltip: {},
    legend: {
        data:['个数']
    },
    xAxis: {
        data: ["分数>-30000",'分数<=-30000']
    },
    yAxis: {},
    series: [{
        name: '个数',
        type: 'bar',
        data: [<%=list.get(0)[0]%>,10000-parseInt(<%=list.get(0)[0]%>)]
    }]
};

// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option); 

</script>
  </body>
</html>