<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/4/23
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"name="viewport">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
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
    <title>用户详情页</title>
</head>
<body class="hold-transition skin-purple sidebar-mini">
     <!--页面头部-->
     <jsp:include page="header.jsp"></jsp:include>
     <!--页面头部/-->
     <!-- 导航侧栏 -->
     <jsp:include page="sidebar.jsp"></jsp:include>

     <!-- 内容区域 -->
     <div class="content-wrapper">

         <!-- 内容头部 -->
         <section class="content-header">
             <h1>
                 用户列表
                 <small>全部用户</small>
             </h1>
             <ol class="breadcrumb">
                 <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i
                         class="fa fa-dashboard"></i> 首页</a></li>
                 <li><a
                         href="${pageContext.request.contextPath}/user/findAll.do">用户管理</a></li>

                 <li class="active">全部用户</li>
             </ol>
         </section>
         <!-- 内容头部 /-->

         <!-- 正文区域 -->
         <section class="content"> <!-- .box-body -->
             <div class="box box-primary">
                 <div class="box-header with-border">
                     <h3 class="box-title">列表</h3>
                 </div>

                 <div class="box-body">

                     <!-- 数据表格 -->
                     <div class="table-box">

                         <!--工具栏-->
                         <div class="pull-left">
                             <div class="form-group form-inline">
                                 <div class="btn-group">
                                     <button type="button" class="btn btn-default" id="comeback">
                                         <i class="fa fa-mail-reply"></i>返回
                                     </button>
                                 </div>
                             </div>
                         </div>
                         <!--工具栏/-->

                         <!--数据列表-->
                         <div class="tab-pane" id="tab-treetable">
                             <table id="collapse-table"
                                    class="table table-bordered table-hover dataTable">
                                 <thead>
                                 <tr>
                                     <th>名称</th>
                                     <th>描述</th>
                                 </tr>
                                 </thead>
                                 <tr data-tt-id="0">
                                     <td colspan="2">${user.username}</td>
                                 </tr>

                                 <tbody>
                                 <c:forEach items="${user.roles}" var="role" varStatus="vs1">
                                     <tr data-tt-id="${vs1.index+1}" data-tt-parent-id="0">
                                     <td>${role.roleName }</td>
                                     <td>${role.roleDesc }</td>
                                     </tr>
                                     <c:forEach items="${role.permissions}" var="permission" varStatus="vs2">
                                         <tr data-tt-id="${vs1.index+1}-${vs2.index+1}"
                                             data-tt-parent-id="${vs1.index+1}">
                                             <td>${permission.permissionName}</td>
                                             <td>${permission.url}</td>
                                         </tr>
                                     </c:forEach>
                                 </c:forEach>
                                 </tbody>
                             </table>
                         </div>
                         <!--数据列表/-->

                     </div>
                     <!-- 数据表格 /-->

                 </div>
                 <!-- /.box-body -->

                 <!-- .box-footer-->
                 <!-- /.box-footer-->

             </div>

         </section>
         <!-- 正文区域 /-->

     </div>
     <!-- @@close -->
     <!-- 内容区域 /-->

     <footer class="main-footer">
         <div class="pull-right hidden-xs">
             <b>Version</b> 1.0.0
         </div>
         <strong>Copyright &copy; 2020 <a href="#">明月创作</a>.</strong> All rights reserved.
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
         $(document).ready(function () {
             /*table tree*/
             $("#collapse-table").treetable({
                 expandable: true
             });
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

         $(document).ready(function () {

             // 激活导航位置
             setSidebarActive("admin-datalist");

             // 列表按钮
             $("#dataList td input[type='checkbox']").iCheck({
                 checkboxClass: 'icheckbox_square-blue',
                 increaseArea: '20%'
             });
             // 全选操作
             $("#selall").click(function () {
                 var clicks = $(this).is(':checked');
                 if (!clicks) {
                     $("#dataList td input[type='checkbox']").iCheck("uncheck");
                 } else {
                     $("#dataList td input[type='checkbox']").iCheck("check");
                 }
                 $(this).data("clicks", !clicks);
             });
         });
     </script>
<script type="text/javascript">
    $("#comeback").click(function () {
        window.location.href="${pageContext.request.contextPath}/user/findAll.do";
    });
</script>

</body>
</html>
