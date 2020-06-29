<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/5/27
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>告警与预警页</title>
    <meta
            content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
            name="viewport">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
    <style type="text/css">
    </style>
</head>
<body class="hold-transition skin-purple sidebar-mini">
   <div class="wrapper">
       <!--页面头部-->
       <jsp:include page="header.jsp"></jsp:include>
       <!--页面头部/-->

       <!-- 导航侧栏 -->
       <jsp:include page="sidebar.jsp"></jsp:include>
       <div class="content-wrapper">
           <!-- 内容头部 -->
           <section class="content-header">
               <h1>
                   监控中心 <small>预警和告警</small>
               </h1>
               <ol class="breadcrumb">
                   <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
                   <li><a href="${pageContext.request.contextPath}/monitoring/list.do">监控中心</a></li>
                   <li class="active">告警与预警</li>
               </ol>
           </section>
           <!-- 内容头部 /-->
           <section class="content">
               <!-- /.row -->
               <div class="row">
                   <div class="col-md-3 col-sm-6 col-xs-12">
                       <div class="info-box">
                           <span class="info-box-icon" style="border-radius: 50%;box-shadow: 0 0 0 6px cornflowerblue;margin-left: 80px;background-color: #F0FFFF;"><h3 style="color: cornflowerblue;margin-top: 35%">今日</h3></span>
                           <div class="info-box-content">
                               <span class="info-box-number" style="margin-left: 100px;margin-top: 10px;color: #FD7979">告警&nbsp;&nbsp;<smaller style="color: #0c0c0c">${dayM}条</smaller></span>
                               <span class="info-box-number" style="margin-left: 100px;margin-top: 20px;color: #F39C1C">预警&nbsp;&nbsp;<smaller style="color: #0c0c0c">${dayY}条</smaller></span>
                           </div>
                           <!-- /.info-box-content -->
                       </div>
                       <!-- /.info-box -->
                   </div>
                   <!-- /.col -->
                   <div class="col-md-3 col-sm-6 col-xs-12">
                       <div class="info-box">
                           <span class="info-box-icon" style="border-radius: 50%;box-shadow: 0 0 0 6px #90CC70;margin-left: 80px;background-color: #F0FFFF"><h3 style="color: #90CC70;margin-top: 35%">当月</h3></span>
                           <div class="info-box-content">
                               <span class="info-box-number" style="margin-left: 100px;margin-top: 10px;color: #FD7979">告警&nbsp;&nbsp;<smaller style="color: #0c0c0c">${monthM}条</smaller></span>
                               <span class="info-box-number" style="margin-left: 100px;margin-top: 20px;color: #F39C1C">预警&nbsp;&nbsp;<smaller style="color: #0c0c0c">${monthY}条</smaller></span>
                           </div>
                           <!-- /.info-box-content -->
                       </div>
                       <!-- /.info-box -->
                   </div>
                   <!-- /.col -->

                   <div class="col-md-3 col-sm-6 col-xs-12">
                       <div class="info-box">
                           <span class="info-box-icon" style="border-radius: 50%;box-shadow: 0 0 0 6px #FD7979;margin-left: 80px;background-color: #F0FFFF"><h3 style="color: #FD7979;margin-top: 35%"><strong>本年</strong></h3></span>
                           <div class="info-box-content">
                               <span class="info-box-number" style="margin-left: 100px;margin-top: 10px;color: #FD7979">告警&nbsp;&nbsp;<smaller style="color: #0c0c0c">${yearM}条</smaller></span>
                               <span class="info-box-number" style="margin-left: 100px;margin-top: 20px;color: #F39C1C">预警&nbsp;&nbsp;<smaller style="color: #0c0c0c">${yearY}条</smaller></span>
                           </div>
                           <!-- /.info-box-content -->
                       </div>
                       <!-- /.info-box -->
                   </div>
                   <!-- /.col -->
               </div>
               <!-- /.row -->
               <div class="box box-primary" style="margin-top: 30px">
                   <div class="box-body">
                   <div class="table-box">
                       <div class="row" style="margin-top: 20px;margin-left: 20px">
                           <form id="queryForm" action="${pageContext.request.contextPath}/monitoring/search.do" method="post">
                               <div class="has-feedback col-xs-2" >
                                   <input type="text" class="form-control" placeholder="输入关键字" name="objNameStr" id="objNameStr">
                               </div>
                               <div class="col-xs-1" ><label>选择时间</label></div>
                               <div class="col-xs-2">
                                   <div class="input-group">
                                       <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                       <input type="text"  placeholder="开始时间" class="form-control" name="date1" id="date1">
                                   </div>
                               </div>
                               <div class="col-xs-2">
                                   <div class="input-group">
                                       <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                       <input type="text" placeholder="结束时间" class="form-control" name="date2" id="date2">
                                   </div>
                               </div>
                               <button type="submit" class="btn btn-primary" id="btn-sure" >
                                   <i class="fa fa-search"></i> 查询
                               </button>
                           </form>
                       </div>

                       <!--数据列表-->
                       <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                           <thead>
                           <tr>
                               <th class="" style="padding-right: 0px"><input id="selall" type="checkbox" class="icheckbox_square-blue"></th>
                               <th class="" style="font-size: 90%">序号</th>
                               <th class="text-center" style="font-size: 90%">监测对象</th>
                               <th class="text-center" style="font-size: 90%">指标类型</th>
                               <th class="text-center" style="font-size: 90%">越限级别</th>
                               <th class="text-center" style="font-size: 90%">首发时间</th>
                               <th class="text-center" style="font-size: 90%">持续时间(h)</th>
                               <th class="text-center" style="font-size: 90%">状态</th>
                               <th class="text-center" style="font-size: 90%">操作</th>
                           </tr>
                           </thead>
                           <tbody>
                           <c:forEach items="${cautionList}" var="caution">
                               <tr>
                                   <td><input name="ids" type="checkbox" id="idM" value=${caution.id}></td>
                                   <td>${caution.id }</td>
                                   <td class="text-center">${caution.objName }</td>
                                   <td class="text-center">${caution.targetType }</td>
                                   <td class="text-center">${caution.alarmStr}</td>
                                   <td class="text-center">${caution.startStr}</td>
                                   <td class="text-center">${caution.durationTime }</td>
                                   <td class="text-center">${caution.statusStr}</td>
                                   <td class="text-center">
                                       <button class="btn bg-olive btn-xs" onclick="edit(${caution.id})">编辑</button>
                                       <a href="${pageContext.request.contextPath}/monitoring/delete.do?id=${caution.id}" class="btn bg-olive btn-xs">删除</a>
                                   </td>
                               </tr>
                           </c:forEach>
                           <c:forEach items="${cautions}" var="caution">
                               <tr>
                                   <td><input name="ids" type="checkbox" id="idS" value=${caution.id}></td>
                                   <td>${caution.id }</td>
                                   <td class="text-center">${caution.objName }</td>
                                   <td class="text-center">${caution.targetType }</td>
                                   <td class="text-center">${caution.alarmStr}</td>
                                   <td class="text-center">${caution.startStr}</td>
                                   <td class="text-center">${caution.durationTime }</td>
                                   <td class="text-center">${caution.statusStr}</td>
                                   <td class="text-center">
                                       <button class="btn bg-olive btn-xs" onclick="edit(${caution.id})">编辑</button>
                                       <a href="${pageContext.request.contextPath}/monitoring/delete.do?id=${caution.id}" class="btn bg-olive btn-xs">删除</a>
                                   </td>
                               </tr>
                           </c:forEach>
                           </tbody>

                       </table>
                     </div>
                   </div>
                   <!-- .box-footer-->
                   <div class="box-footer">

                       <div class="box-tools pull-right">
                           <ul class="pagination">
                               <li>
                                   <a href="${pageContext.request.contextPath}/area/getlist.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
                               </li>
                               <li><a href="${pageContext.request.contextPath}/area/getlist.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                               <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                   <li><a href="${pageContext.request.contextPath}/area/getlist.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                               </c:forEach>
                               <li><a href="${pageContext.request.contextPath}/area/getlist.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                               <li>
                                   <a href="${pageContext.request.contextPath}/area/getlist.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
                               </li>
                           </ul>
                       </div>

                   </div>
                   <!-- /.box-footer-->
               </div>

               <!--新增预警和告警-->
               <!--添加数据框-->
               <div class="modal fade" role="dialog" id="editWarning" tabindex="-1" aria-hidden="true">
                   <div class="modal-dialog modal-lg">
                       <div class="modal-content">
                           <div class="modal-header">
                               <button type="button" class="close" data-dismiss="modal">
                                   <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                               </button>
                               <h4 class="modal-title">编辑预警和告警信息</h4>
                           </div>
                           <div class="modal-body">
                               <form class="form-horizontal" id="addAlarm" method="post" action="${pageContext.request.contextPath}/monitoring/update.do">
                                   <div class="form-group">
                                       <label for="id" class="col-sm-3 control-label">ID:</label>
                                       <div class="col-sm-9">
                                           <input name="id" type="text" class="form-control" id="id" placeholder="ID"/>
                                       </div>
                                   </div>
                                   <div class="form-group">
                                       <label for="objName" class="col-sm-3 control-label">监测对象:</label>
                                       <div class="col-sm-9">
                                           <input name="objName" type="text" class="form-control" id="objName" placeholder="监测对象"/>
                                       </div>
                                   </div>
                                   <div class="form-group">
                                       <label for="targetType" class="col-sm-3 control-label">指标类型:</label>
                                       <div class="col-sm-9">
                                           <input name="targetType" type="text" class="form-control" id="targetType" placeholder="指标类型"/>
                                       </div>
                                   </div>
                                   <div class="form-group">
                                       <label for="alarmLevel" class="col-sm-3 control-label">越限级别:</label>
                                       <div class="col-sm-9">
                                           <input name="alarmLevel" type="text" class="form-control" id="alarmLevel" placeholder="越限级别"/>
                                       </div>
                                   </div>
                                   <div class="form-group">
                                       <label for="date3" class="col-sm-3 control-label">首发时间:</label>
                                       <div class="col-sm-9">
                                           <input name="startTime" type="text" class="form-control" id="date3" placeholder="首发时间"/>
                                       </div>
                                   </div>
                                   <div class="form-group">
                                       <label for="durationTime" class="col-sm-3 control-label">持续时间(h):</label>
                                       <div class="col-sm-9">
                                           <input name="durationTime" type="text" class="form-control" id="durationTime" placeholder="持续时间"/>
                                       </div>
                                   </div>
                                   <div class="form-group">
                                       <label for="status" class="col-sm-3 control-label">状态:</label>
                                       <div class="col-sm-9">
                                           <input name="status" type="text" class="form-control" id="status" placeholder="持续时间"/>
                                       </div>
                                   </div>
                                   <div class="modal-footer">
                                       <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                       <button type="submit" class="btn btn-primary">确认保存</button>
                                   </div>
                               </form>
                           </div>
                       </div>
                   </div>
               </div>
               <!--新增预警和告警-->
           </section>
       </div>
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
   <script
           src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
   <script>
       $.widget.bridge('uibutton', $.ui.button);
   </script>
   <script
           src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
   <script
           src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>

   <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.js"></script>
   <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.min.js"></script>
   <script src="${pageContext.request.contextPath}/bootstrap/spop/src/prism.js"></script>
   <script src="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.js"></script>
   <script src="${pageContext.request.contextPath}/bootstrap/js/toastr.min.js"></script>
   <script>
       $.widget.bridge('uibutton', $.ui.button);
   </script>
   <script>
       $(document).ready(function() {
           // 选择框
           $(".select2").select2();

           // WYSIHTML5编辑器
           $(".textarea").wysihtml5({
               locale : 'zh-CN'
           });
           $('#date1').datepicker({
               format : "yyyy-mm-dd",
               autoclose : true,
               todayBtn : true,
               language : "zh-CN"
           });
           $('#date2').datepicker({
               format : "yyyy-mm-dd",
               autoclose : true,
               todayBtn : true,
               language : "zh-CN"
           });
           $('#date3').datepicker({
               format : "yyyy-mm-dd",
               autoclose : true,
               todayBtn : true,
               language : "zh-CN"
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

       $(document)
           .ready(
               function() {

                   // 激活导航位置
                   setSidebarActive("admin-datalist");

                   // 列表按钮
                   $("#dataList td input[type='checkbox']")
                       .iCheck(
                           {
                               checkboxClass : 'icheckbox_square-blue',
                               increaseArea : '20%'
                           });
                   // 全选操作
                   $("#selall")
                       .click(
                           function() {
                               var clicks = $(this).is(
                                   ':checked');
                               if (!clicks) {
                                   $(
                                       "#dataList td input[type='checkbox']")
                                       .iCheck(
                                           "uncheck");
                               } else {
                                   $(
                                       "#dataList td input[type='checkbox']")
                                       .iCheck("check");
                               }
                               $(this).data("clicks",
                                   !clicks);
                           });
               });
   </script>
<script type="text/javascript">
    function edit(id) {
        var idStr = id;
        $.ajax({
            dataType:"json",
            data:{"id":idStr},
            type:"post",
            url:"${pageContext.request.contextPath}/monitoring/findById.do",
            success:function(result) {
                var data = result.entity;
                $("#id").val(data.id);
                $("#objName").val(data.objName);
                $("#targetType").val(data.targetType);
                $("#alarmLevel").val(data.alarmLevel);
                $("#date3").val(data.startStr);
                $("#durationTime").val(data.durationTime);
                $("#status").val(data.status);
                $("#editWarning").modal('show');
            }
        })

    }
</script>
</body>
</html>
