<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/4/18
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/morris/morris.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
        <link rel="icon" type="image/x-icon" href="../favicon.ico">
        <title>首页</title>
    </head>
    <body class="hold-transition skin-purple sidebar-mini">
        <div class="wrapper">

            <!--页面头部-->
            <jsp:include page="header.jsp"></jsp:include>
            <!--页面头部/-->

            <!-- 导航侧栏 -->
            <jsp:include page="sidebar.jsp"></jsp:include>
            <!-- 导航侧栏 /-->
            <!-- 内容区域 -->
            <div class="content-wrapper">

                <!-- 内容头部 -->
                <section class="content-header">
                    <h1>
                        控制面板
                        <small>首页</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
                    </ol>
                </section>
                <!-- 内容头部 /-->

                <!-- 正文区域 -->
                <section class="content">


                    <!-- 统计数值 -->
                    <div class="row">
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-aqua"style="border-radius: 20%">
                                <div class="inner" style="text-align: center">
                                    <h3 style="font-family: 'STLiti'">${statusA}台</h3>

                                    <p>采集器在线</p>
                                </div>
                                <div class="icon">
                                    <i class="glyphicon glyphicon-th"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box" style="background-color: #8CD4F5;border-radius: 19%">
                                <div class="inner" style="text-align: center">
                                    <h3 style="color: #FFFFFF;font-family: 'STLiti'">${statusB}台</h3>
                                    <p style="color: #FFFFFF">采集器离线</p>
                                </div>
                                <div class="icon">
                                    <i class="glyphicon glyphicon-th"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-green-gradient"style="border-radius: 20%">
                                <div class="inner"style="text-align: center">
                                    <h3>${statusC}台</h3>
                                    <p>采集器连接正常</p>
                                </div>
                                <div class="icon">
                                    <i class="glyphicon glyphicon-th"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-red" style="border-radius: 20%">
                                <div class="inner"style="text-align: center">
                                    <h3>${statusD}台</h3>
                                    <p>采集器异常</p>
                                </div>
                                <div class="icon">
                                    <i class="glyphicon glyphicon-th"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box" style="border-radius: 4%">
                                <span class="info-box-icon bg-blue-active" style="border-radius: 20%;background-color:#4EEE94 "><i class="glyphicon glyphicon-cd"></i></span>

                                <div class="info-box-content" >
                                    <span class="info-box-text">传感器在线</span>
                                    <span class="info-box-number"><h2>${status1}台</h2></span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col -->
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box">
                                <span class="info-box-icon bg-primary" style="border-radius: 20%"><i class="glyphicon glyphicon-cd"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">传感器离线</span>
                                    <span class="info-box-number"><h2>${status2}台</h2></span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col -->

                        <!-- fix for small devices only -->
                        <div class="clearfix visible-sm-block"></div>

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box">
                                <span class="info-box-icon bg-green-gradient" style="border-radius: 20%;background-color: #66CD00"><i class="glyphicon glyphicon-cd"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">传感器运行正常</span>
                                    <span class="info-box-number"><h2>${status3}台</h2></span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col -->
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box">
                                <span class="info-box-icon bg-yellow" style="border-radius: 20%"><i class="glyphicon glyphicon-cd"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">传感器异常</span>
                                    <span class="info-box-number"><h2>${status4}台</h2></span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box">
                                <span class="info-box-icon bg-blue" style="border-radius: 20%;background-color: #1C86EE"><i class="glyphicon glyphicon-scale" style="margin: auto"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">计量器在线</span>
                                    <span class="info-box-number"><h2>${statusI}台</h2></span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col -->
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box">
                                <span class="info-box-icon bg-primary" style="border-radius: 20%;background-color: #C1C1C1"><i class="glyphicon glyphicon-scale" style="margin: auto"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">计量器离线</span>
                                    <span class="info-box-number"><h2>${statusII}台</h2></span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col -->

                        <!-- fix for small devices only -->
                        <div class="clearfix visible-sm-block"></div>

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box">
                                <span class="info-box-icon bg-green" style="border-radius: 20%;background-color: #00CD00"><i class="glyphicon glyphicon-scale" style="margin:auto"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">计量器运行正常</span>
                                    <span class="info-box-number"><h2>${statusIII}台</h2></span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col -->
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box">
                                <span class="info-box-icon bg-yellow " style="border-radius: 20%;background-color: #CD8500"><i class="glyphicon glyphicon-scale" style="margin: auto"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">计量器异常</span>
                                    <span class="info-box-number"><h2>${statusIV}台</h2></span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col -->
                    </div>

                    <div class="row">
                        <div class="col-xs-12">
                            <!-- interactive chart -->
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <i class="fa fa-bar-chart-o"></i>

                                    <h3 class="box-title">电机三相电压模拟</h3>

                                    <div class="box-tools pull-right">
                                        实时数据
                                        <div class="btn-group" id="realtime" data-toggle="btn-toggle">
                                            <button type="button" class="btn btn-default btn-xs active" data-toggle="on">On</button>
                                            <button type="button" class="btn btn-default btn-xs" data-toggle="off">Off</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <div id="interactive" style="height: 300px;"></div>
                                </div>
                                <!-- /.box-body-->
                            </div>
                            <!-- /.box -->

                        </div>
                        <!-- /.col -->
                    </div>
                </section>
                <!-- 正文区域 /-->
            </div>
            <!-- 内容区域 /-->
            <!-- 底部导航 -->
            <footer class="main-footer">
                <div class="pull-right hidden-xs">
                    <b>Version</b> 1.0.0
                </div>
                <strong>Copyright &copy; 2020 <a href="#">明月创作</a>.</strong> All rights reserved.
            </footer>
            <!-- 底部导航 /-->
        </div>
        <script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
        <script>
            $.widget.bridge('uibutton', $.ui.button);
        </script>
        <script>
            $(document).ready(function() {
                // 选择框
                $(".select2").select2();

                // WYSIHTML5编辑器
                $(".textarea").wysihtml5({
                    locale: 'zh-CN'
                });
            });


            // 设置激活菜单
            function setSidebarActive(tagUri) {
                var liObj = $("#" + tagUri);
                if (liObj.length > 0) {
                    liObj.parent().parent().addClass("active");
                    liObj.addClass("active");
                }
            }

        </script>
        <script>
            $(function () {
                /*
                 * Flot Interactive Chart
                 * -----------------------
                 */
                // We use an inline data source in the example, usually data would
                // be fetched from a server
                var data = [], totalPoints = 100;

                function getRandomData() {

                    if (data.length > 0)
                        data = data.slice(1);

                    // Do a random walk
                    while (data.length < totalPoints) {

                        var prev = data.length > 0 ? data[data.length - 1] : 50,
                            y    = prev + Math.random() * 10 - 5;

                        if (y < 0) {
                            y = 0
                        } else if (y > 100) {
                            y = 100
                        }

                        data.push(y)
                    }

                    // Zip the generated y values with the x values
                    var res = [];
                    for (var i = 0; i < data.length; ++i) {
                        res.push([i, data[i]])
                    }

                    return res
                }

                var interactive_plot = $.plot('#interactive', [getRandomData()], {
                    grid  : {
                        borderColor: '#f3f3f3',
                        borderWidth: 1,
                        tickColor  : '#f3f3f3'
                    },
                    series: {
                        shadowSize: 0, // Drawing is faster without shadows
                        color     : '#3c8dbc'
                    },
                    lines : {
                        fill : true, //Converts the line chart to area chart
                        color: '#3c8dbc'
                    },
                    yaxis : {
                        min : 0,
                        max : 100,
                        show: true
                    },
                    xaxis : {
                        show: true
                    }
                });

                var updateInterval = 500 ;//Fetch data ever x milliseconds
                var realtime       = 'on'; //If == to on then fetch data every x seconds. else stop fetching
                function update() {

                    interactive_plot.setData([getRandomData()]);

                    // Since the axes don't change, we don't need to call plot.setupGrid()
                    interactive_plot.draw();
                    if (realtime === 'on')
                        setTimeout(update, updateInterval)
                }

                //INITIALIZE REALTIME DATA FETCHING
                if (realtime === 'on') {
                    update()
                }
                //REALTIME TOGGLE
                $('#realtime .btn').click(function () {
                    if ($(this).data('toggle') === 'on') {
                        realtime = 'on'
                    }
                    else {
                        realtime = 'off'
                    }
                    update()
                });
                /*
                 * END INTERACTIVE CHART
                 */

                /*
                 * LINE CHART
                 * ----------
                 */
                //LINE randomly generated data

                var sin = [], cos = [];
                for (var i = 0; i < 14; i += 0.5) {
                    sin.push([i, Math.sin(i)]);
                    cos.push([i, Math.cos(i)])
                }
                var line_data1 = {
                    data : sin,
                    color: '#3c8dbc'
                };
                var line_data2 = {
                    data : cos,
                    color: '#00c0ef'
                };
                $.plot('#line-chart', [line_data1, line_data2], {
                    grid  : {
                        hoverable  : true,
                        borderColor: '#f3f3f3',
                        borderWidth: 1,
                        tickColor  : '#f3f3f3'
                    },
                    series: {
                        shadowSize: 0,
                        lines     : {
                            show: true
                        },
                        points    : {
                            show: true
                        }
                    },
                    lines : {
                        fill : false,
                        color: ['#3c8dbc', '#f56954']
                    },
                    yaxis : {
                        show: true
                    },
                    xaxis : {
                        show: true
                    }
                });
                //Initialize tooltip on hover
                $('<div class="tooltip-inner" id="line-chart-tooltip"></div>').css({
                    position: 'absolute',
                    display : 'none',
                    opacity : 0.8
                }).appendTo('body');

                /* END LINE CHART */

                /*
                 * FULL WIDTH STATIC AREA CHART
                 * -----------------
                 */
                var areaData = [[2, 88.0], [3, 93.3], [4, 102.0], [5, 108.5], [6, 115.7], [7, 115.6],
                    [8, 124.6], [9, 130.3], [10, 134.3], [11, 141.4], [12, 146.5], [13, 151.7], [14, 159.9],
                    [15, 165.4], [16, 167.8], [17, 168.7], [18, 169.5], [19, 168.0]]
                $.plot('#area-chart', [areaData], {
                    grid  : {
                        borderWidth: 0
                    },
                    series: {
                        shadowSize: 0, // Drawing is faster without shadows
                        color     : '#00c0ef'
                    },
                    lines : {
                        fill: true //Converts the line chart to area chart
                    },
                    yaxis : {
                        show: false
                    },
                    xaxis : {
                        show: false
                    }
                })



            });

            /*
             * Custom Label formatter
             * ----------------------
             */
            function labelFormatter(label, series) {
                return '<div style="font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;">'
                    + label
                    + '<br>'
                    + Math.round(series.percent) + '%</div>'
            }
        </script>
    </body>
</html>