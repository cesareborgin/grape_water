<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/5/4
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>水泵台账新建</title>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
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
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body class="hold-transition skin-purple sidebar-mini">
     <div class="wrapper">
         <!--页面头部-->
         <jsp:include page="header.jsp"></jsp:include>
         <!--页面头部/-->
         <!-- 导航侧栏 -->
         <jsp:include page="sidebar.jsp"></jsp:include>
         <!-- 导航侧栏 -->
         <div class="content-wrapper">
             <!-- 内容头部 -->
             <section class="content-header">
                 <h1>水泵台账<small>水泵台账表单</small></h1>
                 <ol class="breadcrumb">
                     <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
                     <li><a href="${pageContext.request.contextPath}/pumps/findAll.do">水泵台账列表</a></li>
                     <li class="active">水泵台账表单</li>
                 </ol>
             </section>
             <!-- 内容头部 /-->
             <form action="${pageContext.request.contextPath}/pumps/save.do" method="post">
                 <!-- 正文区域 -->
                 <section class="content"> <!--产品信息-->

                     <div class="panel panel-default">
                         <div class="panel-heading">水泵台账信息</div>
                         <div class="row data-type">
                             <div class="col-md-2 title">内部名称：</div>
                             <div class="col-md-4 data">
                                 <input type="text" class="form-control" name="inernalName" placeholder="内部名称" value="" >
                             </div>
                             <div class="col-md-2 title">型号</div>
                             <div class="col-md-4 data">
                                 <input type="text" class="form-control" name="modelType" placeholder="型号" value="" >
                             </div>
                             <div class="col-md-2 title">配套电机功率(kw):</div>
                             <div class="col-md-4 data">
                                 <input type="text" class="form-control" name="MTOP" placeholder="电机功率" value="" >
                             </div>
                             <div class="col-md-2 title">水泵流量(m³/h):</div>
                             <div class="col-md-4 data">
                                 <input type="text" class="form-control" name="ROF" placeholder="流量" value="" >
                             </div>
                             <div class="col-md-2 title">电流(A):</div>
                             <div class="col-md-4 data">
                                 <input type="text" class="form-control" name="electricity" placeholder="电流" value="" >
                             </div>
                             <div class="col-md-2 title">电压(V)</div>
                             <div class="col-md-4 data">
                                 <input type="text" class="form-control" name="voltage" placeholder="电压" value="" >
                             </div>
                             <div class="col-md-2 title">效率(%)</div>
                             <div class="col-md-4 data">
                                 <input type="text" class="form-control" name="efficiency" placeholder="效率" value="" >
                             </div>
                             <div class="col-md-2 title">轴功率(kw)</div>
                             <div class="col-md-4 data">
                                 <input type="text" class="form-control" name="shaft" placeholder="轴功率(kw)" value="" >
                             </div>
                             <div class="col-md-2 title">排出口径(mm)</div>
                             <div class="col-md-4 data">
                                 <input type="text" class="form-control" name="DGAT" placeholder="排出口径" value="" >
                             </div>
                             <div class="col-md-2 title">吸入口径(mm)</div>
                             <div class="col-md-4 data">
                                 <input type="text" class="form-control" name="SGAT" placeholder="吸入口径" value="" >
                             </div>
                             <div class="col-md-2 title">转速(r/min)</div>
                             <div class="col-md-4 data">
                                 <input type="text" class="form-control" name="REV" placeholder="转速" value="" >
                             </div>
                             <div class="col-md-2 title">扬程(m)</div>
                             <div class="col-md-4 data">
                                 <input type="text" class="form-control" name="HODL" placeholder="扬程" value="" >
                             </div>
                             <div class="col-md-2 title">防护等级</div>
                             <div class="col-md-4 data">
                                 <input type="text" class="form-control" name="LOFT" placeholder="防护等级" value="" >
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
