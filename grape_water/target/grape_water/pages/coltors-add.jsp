<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/4/29
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>采集器添加</title>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.css">
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
                     <li class="active">采集器表单</li>
                 </ol>
             </section>
             <form action="${pageContext.request.contextPath}/coltors/save.do" method="post">
                 <!-- 正文区域 -->
                 <section class="content"> <!--产品信息-->

                     <div class="panel panel-default">
                         <div class="panel-heading">采集器信息</div>
                         <div class="row data-type">
                             <div class="col-md-2 title">采集器名称：</div>
                             <div class="col-md-10 data">
                                 <input type="text" class="form-control" name="coltorName" placeholder="采集器名称" value="" id="coltorName">
                             </div>
                             <div class="col-md-2 title">采集器型号：</div>
                             <div class="col-md-10 data">
                                 <input type="text" class="form-control" name="coltorType" placeholder="采集器型号" value="">
                             </div>
                             <div class="col-md-2 title">系统编号：</div>
                             <div class="col-md-10 data">
                                 <input type="text" class="form-control" name="sysNumber" placeholder="系统编号" value="">
                             </div>
                             <div class="col-md-2 title">编码：</div>
                             <div class="col-md-10 data">
                                 <input type="text" class="form-control" name="code" placeholder="编码" value="">
                             </div>
                             <div class="col-md-2 title">安装位置名称：</div>
                             <div class="col-md-10 data">
                                 <select class="form-control select2" style="width: 100%" name="installtionName" id="installtionName" onchange="getCode()">
                                     <option value="">选择区域</option>
                                     <c:forEach items="${areas}" var="areas">
                                         <option value="${areas.enLocal}">${areas.enLocal}</option>
                                     </c:forEach>
                                 </select>
                             </div>
                             <div class="col-md-2 title">安装位置编号：</div>
                             <div class="col-md-10 data">
                                 <select class="form-control select2" style="width: 100%" name="installtionCode" id="locationCode">
                                 </select>
                             </div>
                             <div class="col-md-2 title">检测对象名称：</div>
                             <div class="col-md-10 data">
                                 <select class="form-control select2" style="width: 100%" name="testobjName" id="testobjName">
                                     <option value="">选择检测对象</option>
                                     <c:forEach items="${entities}" var="entity">
                                         <option value="${entity.entityName}">${entity.entityName}</option>
                                     </c:forEach>
                                 </select>
                             </div>
                             <div class="col-md-2 title">串口号：</div>
                             <div class="col-md-10 data">
                                 <input type="text" class="form-control" name="serialPort" placeholder="串口号" value="">
                             </div>
                             <div class="col-md-2 title">表地址：</div>
                             <div class="col-md-10 data">
                                 <input type="text" class="form-control" name="tableAdrr" placeholder="表地址" value="">
                             </div>
                             <div class="col-md-2 title">连接状态</div>
                             <div class="col-md-10 data">
                                 <select class="form-control select2" style="width: 100%" name="status">
                                     <option value="0" selected="selected">离线</option>
                                     <option value="1">连接正常</option>
                                     <option value="2">连接异常</option>
                                 </select>
                             </div>

                         </div>
                     </div>
                     <!--订单信息/--> <!--工具栏-->
                     <div class="box-tools text-center">
                         <button type="submit" class="btn bg-maroon">保存</button>
                         <button type="button" class="btn bg-default"
                                 onclick="history.back(-1);">返回</button>
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
             <strong>Copyright &copy; 2020 <a href="#">明月创作</a>.</strong> All rights reserved.
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
     <script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
     <script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
     <script src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
     <script src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
     <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.js"></script>
     <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.min.js"></script>
     <script src="${pageContext.request.contextPath}/bootstrap/spop/src/prism.js"></script>
     <script src="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.js"></script>
     <script src="${pageContext.request.contextPath}/bootstrap/js/toastr.min.js"></script>
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
     <script type="text/javascript">
         function getCode() {
             var location= $("#installtionName").val();
             var oSel = document.getElementById("locationCode");//获取供应商的下拉信息
             var oOp = oSel.children; //获取select列表的所有子元素。
             for(var i=0,len = oOp.length;i<len;i++)
             {//将供应商的下拉菜单的数据清除
                 oSel.removeChild(oOp[i]);  //循环删除所有子元素
             }
             $.ajax({
                 dataType:"json",
                 type:"post",
                 data:{"location":location},
                 url:"${pageContext.request.contextPath}/meters/getLocation.do",
                 success:function (data) {
                     var areas =data.areas;
                     if(areas.length!=0){
                         for(var i=0;i<areas.length;i++){
                             $("#locationCode").append("<option value="+areas[i].enCode+">"+areas[i].enCode+"</option>");
                         }
                     }else {
                         document.getElementById("locationCode").innerHTML = "<option value = "+""+">"+null+"</option>" ;
                     }
                 }
             })
         }
     </script>
</body>
</html>
