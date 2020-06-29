<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/5/14
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">




    <title>能耗数据动态展示页</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/morris/morris.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- 页面头部 /-->
    <!-- 导航侧栏 -->
    <jsp:include page="sidebar.jsp"></jsp:include>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <!-- @@master = admin-layout.html-->
    <!-- @@block = content -->

    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                能耗数据动态展示<small>柱形统计</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
                <li><a href="#">能耗数据动态展示</a></li>
                <li class="active">数据</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">
            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-body">
                        <div class="row">
                            <form id="queryForm" action="${pageContext.request.contextPath}/energy/getlist.do" method="post">
                                <div class="col-xs-2">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="text" placeholder="开始时间" class="form-control input-sm" name="date1" id="date1">
                                    </div>
                                </div>
                                <div class="col-xs-2">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa  fa-calendar"></i></span>
                                        <input type="text" placeholder="结束时间" class="form-control input-sm" name="date2" id="date2">
                                    </div>
                                </div>
                                <div class="col-xs-2">
                                    <select class="form-control select2" style="width: 100%" name="localStr" id="localStr">
                                        <option value="">全部区域</option>
                                        <c:forEach items="${areaList}" var="areas">
                                            <option value="${areas.enLocal}">${areas.enLocal}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <button type="button" class="btn btn-primary" id="btn-sure" >
                                    <i class="fa fa-search"></i> 确定
                                </button>
                            </form>
                        </div>
                </div>
            </div>
            <div id="main" style="width:100%; height: 650px"></div>

        </section>
        <!-- 正文区域 /-->

    </div>
    <!-- @@close -->
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.0
        </div>
        <strong>Copyright &copy; 2020 <a
                href="http://www.itcast.cn">明月制作</a>.
        </strong> All rights reserved.
    </footer>
    <!-- 底部导航 /-->

</div>


<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
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
<script src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/spop/src/prism.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/toastr.min.js"></script>

<script>
    $(document).ready(function() {

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale : 'zh-CN'
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

    $(document).ready(function() {

        // 激活导航位置
        setSidebarActive("admin-datalist");

        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass : 'icheckbox_square-blue',
            increaseArea : '20%'
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#date1').datetimepicker({
            format : "yyyy-mm-dd hh:ii",
            autoclose : true,
            todayBtn : true,
            language : "zh-CN"
        });
        $('#date2').datetimepicker({
            format : "yyyy-mm-dd hh:ii",
            autoclose : true,
            todayBtn : true,
            language : "zh-CN"
        });

    });
</script>
<script type="text/javascript">
    
    $("#btn-sure").click(function () {
        var mychart = echarts.init(document.getElementById('main'));
        mychart.setOption({
            title : {
                text : '异步数据加载'
            },
            tooltip:{
                trigger:'axis',
                axisPointer:{
                    type:'shadow'
                }
            },
            legend:{
                data:['耗电值(kWh)','费用(万元)','折标准煤(t)','折CO2排放(t)']
            },
            grid:{
                left:'3%',
                right:'4%',
                bottom:'10%',
                containLabel:true
            },
            xAxis:[
                {
                    type:'category',
                    data:[]
                }
            ],
            yAxis:[
                {
                    type: 'value'
                }
            ],
            series:[
                {
                    name:'耗电值kw.h',
                    type:'bar',
                    data:[]
                },
                {
                    name:'费用(万元)',
                    type:'bar',
                    data:[],
                    marLine:{
                        lineStyle:{
                            type:'dashed'
                        },
                        data:[
                            [{type:'min'},{type:'max'}]
                        ]
                    }
                },
                {
                    name:'折标准煤(kg)',
                    type:'bar',
                    data:[]
                },
                {
                    name:'折CO2排放(kg)',
                    type:'bar',
                    data:[]
                }
            ],
            dataZoom: [//给x轴设置滚动条
                {
                    start:0,//默认为0
                    end: 100,//默认为100
                    type: 'slider',
                    show: true,
                    realtime : true,
                    bottom:'3%'
                }
            ]

        });
        var date1 = $("#date1").val();
        var date2 = $("#date2").val();
        var localStr = $("#localStr").val();
        var names = [];//存放x的名称
        var enPower = [];//存放耗电能
        var enCharge = [];//存放费用
        var enCoal = [];//存放标准煤
        var enCarbon = [];//存放折CO2排放量
        $.ajax({
            url:"${pageContext.request.contextPath}/analysis/dataBar.do",
            type:"POST",
            async: false,
            dataType:"json",
            data:{"date1":date1,"date2":date2,"localStr":localStr},
            success:function (result) {
                if(result){
                    for (var i=0;i<result.length;i++){
                        names.push(result[i].timeData);
                    }
                    for (var i=0;i<result.length;i++){
                        enPower.push(result[i].enPower);
                    }
                    for (var i=0;i<result.length;i++){
                        enCharge.push(result[i].enCharge);
                    }
                    for(var i=0;i<result.length;i++){
                        enCoal.push(result[i].enCoal);
                    }
                    for(var i=0;i<result.length;i++){
                        enCarbon.push(result[i].enCarbon);
                    }
                    mychart.hideLoading();
                    mychart.setOption({
                        xAxis:{
                            data:names
                        },
                        series :[
                            {
                                name : '耗电值(kWh)',
                                type:'bar',
                                data:enPower
                             },
                            {
                                name:'费用(万元)',
                                type:'bar',
                                data:enCharge
                            },
                            {
                                name:'折标准煤(t)',
                                type:'bar',
                                data:enCoal
                            },
                            {
                                name:'折CO2排放(t)',
                                type:'bar',
                                data:enCarbon
                            }
                        ]
                    });
                }

            },
            error:function (errorMsg) {
                spop({template:'图表请求数据加载失败！',style:'error',position:'top-center'});
                mychart.hideLoading();
            }
        })
    })
</script>
</body>

</html>
