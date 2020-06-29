<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/4/23
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/morris/morris.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
    <title>添加用户页面</title>
</head>
<body class="hold-transition skin-purple sidebar-mini">
    <div class="wrapper">
        <!--页面头部-->
        <jsp:include page="header.jsp"></jsp:include>
        <!--页面头部/-->
        <!-- 导航侧栏 -->
        <jsp:include page="sidebar.jsp"></jsp:include>
        <!--内容区域-->
        <div class="content-wrapper">
            <!-- 内容头部 -->
            <section class="content-header">
                <h1>用户列表<small>用户表单</small></h1>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/findAll.do">用户列表</a></li>
                    <li class="active">用户表单</li>
                </ol>
            </section>
            <form action="${pageContext.request.contextPath}/user/save.do" method="post">
                <!-- 正文区域 -->
                <section class="content"> <!--产品信息-->

                    <div class="panel panel-default">
                        <div class="panel-heading">用户信息</div>
                        <div class="row data-type">
                            <div class="col-md-2 title">用户ID:</div>
                            <div class="col-md-4 data">
                                <input type="text" class="form-control" name="id" placeholder="用户ID" value="" id="id">
                            </div>
                            <div class="col-md-2 title">用户名称</div>
                            <div class="col-md-4 data">
                                <input type="text" class="form-control" name="username" placeholder="用户名称" value="">
                            </div>
                            <div class="col-md-2 title">密码</div>
                            <div class="col-md-4 data">
                                <input type="password" class="form-control" name="password" placeholder="密码" value="">
                            </div>
                            <div class="col-md-2 title">邮箱</div>
                            <div class="col-md-4 data">
                                <input type="text" class="form-control" name="email" placeholder="邮箱" value="">
                            </div>
                            <div class="col-md-2 title">联系电话</div>
                            <div class="col-md-4 data">
                                <input type="text" class="form-control" name="phoneNum" placeholder="联系电话" value="">
                            </div>
                            <div class="col-md-2 title">用户状态</div>
                            <div class="col-md-4 data">
                                <select class="form-control select2" style="width: 100%" name="status">
                                    <option value="0" selected="selected">关闭</option>
                                    <option value="1">开启</option>
                                </select>
                            </div>

                        </div>
                    </div>
                    <!--订单信息/--> <!--工具栏-->
                    <div class="box-tools text-center">
                        <button type="submit" class="btn bg-maroon">保存</button>
                        <button type="button" class="btn bg-default"
                                onclick="location.href='${pageContext.request.contextPath}/user/findAll.do'">返回</button>
                    </div>
                    <!--工具栏/--> </section>
                <!-- 正文区域 /-->
            </form>
            <!-- 内容头部 /-->
        </div>
        <!--内容区域-->
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
    <script src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
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
