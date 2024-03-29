<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/4/29
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>采集器编辑页</title>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
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
</head>
<body class="hold-transition skin-purple sidebar-mini">
<div class="wrapper">
    <!--页面头部-->
    <jsp:include page="header.jsp"></jsp:include>
    <!--页面头部/-->
    <!-- 导航侧栏 -->
    <jsp:include page="sidebar.jsp"></jsp:include>
    <!-- 导航侧栏 /-->
    <!--内容区域-->
    <div class="content-wrapper">
        <!-- 内容头部 -->
        <section class="content-header">
            <h1>采集器配置管理 <small>采集器表单</small></h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
                <li><a href="${pageContext.request.contextPath}/coltors/findAll.do">采集器列表</a></li>
                <li class="active">采集器编辑</li>
            </ol>
        </section>
        <form action="${pageContext.request.contextPath}/coltors/edit.do" method="post">
            <!-- 正文区域 -->
            <section class="content"> <!--产品信息-->

                <div class="panel panel-default">
                    <div class="panel-heading">采集器信息</div>
                    <div class="row data-type">
                        <div class="col-md-2 title">序号：</div>
                        <div class="col-md-10 data">
                            <input type="text" class="form-control" name="id" placeholder="序号" value="${coltor.id}" id="id">
                        </div>
                        <div class="col-md-2 title">采集器名称：</div>
                        <div class="col-md-10 data">
                            <input type="text" class="form-control" name="coltorName" placeholder="采集器名称" value="${coltor.coltorName}" id="coltorName">
                        </div>
                        <div class="col-md-2 title">采集器型号：</div>
                        <div class="col-md-10 data">
                            <input type="text" class="form-control" name="coltorType" placeholder="采集器型号" value="${coltor.coltorType}">
                        </div>
                        <div class="col-md-2 title">系统编号：</div>
                        <div class="col-md-10 data">
                            <input type="text" class="form-control" name="sysNumber" placeholder="系统编号" value="${coltor.sysNumber}">
                        </div>
                        <div class="col-md-2 title">编码：</div>
                        <div class="col-md-10 data">
                            <input type="text" class="form-control" name="code" placeholder="编码" value="${coltor.code}">
                        </div>
                        <div class="col-md-2 title">安装位置名称：</div>
                        <div class="col-md-10 data">
                            <input type="text" class="form-control" name="installtionName" placeholder="安装位置名称" value="${coltor.installtionName}">
                        </div>
                        <div class="col-md-2 title">安装位置编号：</div>
                        <div class="col-md-10 data">
                            <input type="text" class="form-control" name="installtionCode" placeholder="安装位置编号" value="${coltor.installtionCode}">
                        </div>
                        <div class="col-md-2 title">检测对象名称：</div>
                        <div class="col-md-10 data">
                            <input type="text" class="form-control" name="testobjName" placeholder="检测对象名称" value="${coltor.testobjName}">
                        </div>
                        <div class="col-md-2 title">串口号：</div>
                        <div class="col-md-10 data">
                            <input type="text" class="form-control" name="serialPort" placeholder="串口号" value="${coltor.serialPort}">
                        </div>
                        <div class="col-md-2 title">表地址：</div>
                        <div class="col-md-10 data">
                            <input type="text" class="form-control" name="tableAdrr" placeholder="表地址" value="${coltor.tableAdrr}">
                        </div>

                    </div>
                </div>
                <!--订单信息/--> <!--工具栏-->
                <div class="box-tools text-center">
                    <button type="submit" class="btn bg-maroon">确定</button>
                    <button type="button" class="btn bg-default"
                            onclick="history.back(-1);">取消</button>
                </div>
                <!--工具栏/--> </section>
            <!-- 正文区域 /-->
        </form>
        <!-- 内容头部 /-->
    </div>
    <!--内容区域/-->
    <!-- 底部导航 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.0
        </div>
        <strong>Copyright &copy; 2020-2021 <a href="#">明月创作</a>.</strong> All rights reserved.
    </footer>
    <!-- 底部导航 /-->
</div>
<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../plugins/raphael/raphael-min.js"></script>
<script src="../plugins/morris/morris.min.js"></script>
<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="../plugins/knob/jquery.knob.js"></script>
<script src="../plugins/daterangepicker/moment.min.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="../plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../plugins/fastclick/fastclick.js"></script>
<script src="../plugins/iCheck/icheck.min.js"></script>
<script src="../plugins/adminLTE/js/app.min.js"></script>
<script src="../plugins/treeTable/jquery.treetable.js"></script>
<script src="../plugins/select2/select2.full.min.js"></script>
<script src="../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="../plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="../plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="../plugins/ckeditor/ckeditor.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/chartjs/Chart.min.js"></script>
<script src="../plugins/flot/jquery.flot.min.js"></script>
<script src="../plugins/flot/jquery.flot.resize.min.js"></script>
<script src="../plugins/flot/jquery.flot.pie.min.js"></script>
<script src="../plugins/flot/jquery.flot.categories.min.js"></script>
<script src="../plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script>
    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

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
</script>
</body>
</html>
