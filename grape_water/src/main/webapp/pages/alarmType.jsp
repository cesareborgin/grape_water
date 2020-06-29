<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/5/29
  Time: 2:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>越限级别类型页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.css">
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
         <div class="content-wrapper">
             <!-- 内容头部 -->
             <section class="content-header">
                 <h1>
                     管理中心 <small>数字字典：越限级别类型</small>
                 </h1>
                 <ol class="breadcrumb">
                     <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
                     <li><a href="${pageContext.request.contextPath}/alarmType/list.do">数字字典</a></li>
                     <li class="active">越限级别类型</li>
                 </ol>
             </section>
             <!-- 内容头部 /-->
             <!-- 正文区域 -->
             <section class="content">

                 <!-- .box-body -->
                 <div class="box box-primary">
                     <div class="box-header with-border">
                         <i class="fa fa-book"></i> <h3 class="box-title">列表</h3>
                     </div>

                     <div class="box-body">

                         <!-- 数据表格 -->
                         <div class="table-box">

                             <!--工具栏-->
                             <div class="pull-left">
                                 <div class="form-group form-inline">
                                     <button type="button" class="btn btn-primary btn-sm " title="新建" id="btn-add">
                                         <i class="fa fa-folder-open"></i> 新建
                                     </button>
                                     <button type="button" class="btn btn-primary btn-sm " title="刷新" id="btn-new" onclick="location.href='${pageContext.request.contextPath}/alarmType/list.do'">
                                         <i class="fa fa-spinner"></i> 刷新
                                     </button>
                                 </div>
                             </div>
                             <!--工具栏/-->

                             <!--数据列表-->
                             <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                                 <thead>
                                 <tr>
                                     <th class="" style="padding-right: 0px;"><input id="selall" type="checkbox" class="icheckbox_square-blue" >
                                     </th>
                                     <th  style="font-size: 90%">序号</th>
                                     <th  style="font-size: 90%">分类值</th>
                                     <th  style="font-size: 90%">越限值</th>
                                     <th  style="font-size: 90%">越限名称</th>
                                     <th class="text-center" style="font-size: 90%">操作</th>
                                 </tr>
                                 </thead>
                                 <tbody>
                                 <c:forEach items="${list}" var="alarm">
                                     <tr>
                                     <td><input name="ids" type="checkbox" id="idM" value=${alarm.id}></td>
                                     <td>${alarm.id }</td>
                                     <td>${alarm.uid }</td>
                                     <td>${alarm.alarmId }</td>
                                     <td>${alarm.alarmStr }</td>
                                     <td class="text-center">
                                         <button type="button" class="btn bg-olive btn-xs" id="editck">编辑</button>
                                         <a href="${pageContext.request.contextPath}/alarmType/deleteById.do?id=${alarm.id}" class="btn bg-olive btn-xs">删除</a>
                                     </td>
                                     </tr>
                                 </c:forEach>
                                 </tbody>

                             </table>
                             <!--数据列表/-->

                             <!--工具栏-->
                             <!--工具栏/-->

                         </div>
                         <!-- 数据表格 /-->


                     </div>
                     <!-- /.box-body -->

                     <!-- .box-footer-->
                     <div class="box-footer">

                         <div class="box-tools pull-right">
                             <ul class="pagination">
                                 <li>
                                     <a href="${pageContext.request.contextPath}/alarmType/list.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
                                 </li>
                                 <li><a href="${pageContext.request.contextPath}/alarmType/list.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                                 <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                     <li><a href="${pageContext.request.contextPath}/alarmType/list.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                                 </c:forEach>
                                 <li><a href="${pageContext.request.contextPath}/alarmType/list.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                                 <li>
                                     <a href="${pageContext.request.contextPath}/alarmType/list.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
                                 </li>
                             </ul>
                         </div>

                     </div>
                     <!-- /.box-footer-->
                     <!--添加数据框-->
                     <div class="modal fade" role="dialog" id="add-modal" tabindex="-1" aria-hidden="true">
                         <div class="modal-dialog modal-lg">
                             <div class="modal-content">
                                 <div class="modal-header">
                                     <button type="button" class="close" data-dismiss="modal">
                                         <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                     </button>
                                     <h4 class="modal-title">新建越限类型</h4>
                                 </div>
                                 <div class="modal-body">
                                     <form class="form-horizontal" id="add-form" method="post" action="${pageContext.request.contextPath}/alarmType/insert.do">
                                         <div class="form-group">
                                             <label for="ids" class="col-sm-3 control-label">序号:</label>
                                             <div class="col-sm-9">
                                                 <input name="id" type="text" class="form-control" id="ids" placeholder="序号"/>
                                             </div>
                                         </div>
                                         <div class="form-group">
                                             <label for="uid" class="col-sm-3 control-label">分类:</label>
                                             <div class="col-sm-9">
                                                 <select class="form-control select2" style="width: 100%" name="uid" id="uid">
                                                     <option value="0">告警</option>
                                                     <option value="1">预警</option>
                                                 </select>
                                             </div>
                                         </div>
                                         <div class="form-group">
                                             <label for="alarmId" class="col-sm-3 control-label">越限值:</label>
                                             <div class="col-sm-9">
                                                 <input name="alarmId" type="text" class="form-control" id="alarmId" placeholder="越限值"/>
                                             </div>
                                         </div>
                                         <div class="form-group">
                                             <label for="alarmStr" class="col-sm-3 control-label">越限名称:</label>
                                             <div class="col-sm-9">
                                                 <input name="alarmStr" type="text" class="form-control" id="alarmStr" placeholder="越限名称"/>
                                             </div>
                                         </div>
                                         <div class="modal-footer">
                                             <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                             <button type="submit"  class="btn btn-primary">确认保存</button>
                                         </div>
                                     </form>
                                 </div>
                             </div>
                         </div>
                     </div>

                     <!--编辑框-->
                     <div class="modal fade" role="dialog" id="editModal" tabindex="-1" aria-hidden="true">
                         <div class="modal-dialog modal-lg">
                             <div class="modal-content">
                                 <div class="modal-header">
                                     <button type="button" class="close" data-dismiss="modal">
                                         <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                     </button>
                                     <h4 class="modal-title">编辑越限类型</h4>
                                 </div>
                                 <div class="modal-body">
                                     <form class="form-horizontal" id="edit-form" method="post" action="${pageContext.request.contextPath}/alarmType/edit.do">
                                         <div class="form-group">
                                             <label for="ids" class="col-sm-3 control-label">序号:</label>
                                             <div class="col-sm-9">
                                                 <input name="id" type="text" class="form-control" id="id" placeholder="序号"/>
                                             </div>
                                         </div>
                                         <div class="form-group">
                                             <label for="uid" class="col-sm-3 control-label">分类:</label>
                                             <div class="col-sm-9">
                                                 <input name="uid" type="text" class="form-control" id="uid2" placeholder="分类值"/>
                                             </div>
                                         </div>
                                         <div class="form-group">
                                             <label for="alarmId" class="col-sm-3 control-label">越限值:</label>
                                             <div class="col-sm-9">
                                                 <input name="alarmId" type="text" class="form-control" id="alarmId2" placeholder="越限值"/>
                                             </div>
                                         </div>
                                         <div class="form-group">
                                             <label for="alarmStr" class="col-sm-3 control-label">越限名称:</label>
                                             <div class="col-sm-9">
                                                 <input name="alarmStr" type="text" class="form-control" id="alarmStr2" placeholder="越限名称"/>
                                             </div>
                                         </div>
                                         <div class="modal-footer">
                                             <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                             <button type="submit"  class="btn btn-primary">确认保存</button>
                                         </div>
                                     </form>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>

             </section>
             <!-- 正文区域 /-->
         </div>
         <!-- 内容区域 -->
         <!-- 底部导航 -->
         <footer class="main-footer">
             <div class="pull-right hidden-xs">
                 <b>Version</b> 1.0.0
             </div>
             <strong>Copyright &copy; 2020 <a
                     href="#">明月制作</a>.
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
<script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
<script src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
<script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/spop/src/prism.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.js"></script>
     <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-table.js"></script>
     <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-table-locale-all.js"></script>
     <script>
         $(document).ready(function() {
             // 选择框
             $(".select2").select2();

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
             // 全选操作
             $("#selall").click(function() {
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
    $("#btn-add").click(function () {
        $("#add-modal").modal('show');
    });
    $("#dataList tbody").on("click","#editck",function () {
        var row = $("table#dataList tr").index($(this).closest("tr"));
        var id = $("table#dataList").find("tr").eq(row).find("td").eq(1).text();
        var uid  = $("table#dataList").find("tr").eq(row).find("td").eq(2).text();
        var alarmId = $("table#dataList").find("tr").eq(row).find("td").eq(3).text();
        var alarmStr = $("table#dataList").find("tr").eq(row).find("td").eq(4).text();
        $("#id").val(id);
        $("#uid2").val(uid);
        $("#alarmId2").val(alarmId);
        $("#alarmStr2").val(alarmStr);
        $("#editModal").modal('show');
    });
</script>
</body>
</html>
