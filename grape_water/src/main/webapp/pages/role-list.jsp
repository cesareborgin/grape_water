<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/4/23
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <title>角色列表</title>
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
                  角色管理 <small>全部角色</small>
              </h1>
              <ol class="breadcrumb">
                  <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i
                          class="glyphicon glyphicon-home"></i> 首页</a></li>
                  <li><a
                          href="${pageContext.request.contextPath}/role/findAll.do">角色管理</a></li>

                  <li class="active">全部角色</li>
              </ol>
          </section>
          <!-- 内容头部 /-->

          <!-- 正文区域 -->
          <section class="content"> <!-- .box-body -->
              <div class="box box-primary">
                  <div class="box-header with-border">
                      <i class="fa fa-cube"></i>  <h3 class="box-title">列表</h3>
                  </div>

                  <div class="box-body">

                      <!-- 数据表格 -->
                      <div class="table-box">

                          <!--工具栏-->
                          <div class="pull-left">
                              <div class="form-group form-inline">
                                    <form action="">
                                        <button type="button" class="btn btn-primary btn-sm" title="新建" onclick="location.href='${pageContext.request.contextPath}/pages/role-add.jsp'">
                                            <i class="glyphicon glyphicon-plus"></i> 新建
                                        </button>
                                        <button type="button" class="btn btn-primary btn-sm" title="刷新" id="refresh">
                                            <i class="glyphicon glyphicon-refresh"></i> 刷新
                                        </button>
                                    </form>
                              </div>
                          </div>
                          <!--工具栏/-->

                          <!--数据列表-->
                          <table id="dataList"
                                 class="table table-bordered table-striped table-hover dataTable">
                              <thead>
                              <tr>
                                  <th class="" style="padding-right: 0px"><input
                                          id="selall" type="checkbox" class="icheckbox_square-blue">
                                  </th>
                                  <th class="sorting_asc">角色id</th>
                                  <th class="sorting_desc">角色名称</th>
                                  <th class="sorting_asc sorting_asc_disabled">描述</th>
                                  <th class="text-center">操作</th>
                              </tr>
                              </thead>
                              <tbody>

                              <c:forEach items="${roleList}" var="role">
                                  <tr>
                                      <td><input name="ids" type="checkbox"></td>
                                      <td>${role.id }</td>
                                      <td>${role.roleName }</td>
                                      <td>${role.roleDesc }</td>
                                      <td class="text-center">
                                          <a href="${pageContext.request.contextPath}/role/findById.do?id=${role.id}" class="btn bg-olive btn-xs">详情</a>
                                          <a href="${pageContext.request.contextPath}/role/deleteRole.do?id=${role.id}" class="btn bg-olive btn-xs">删除角色</a>
                                          <a href="${pageContext.request.contextPath}/role/findRoleByIdAndAllPermission.do?id=${role.id}" class="btn bg-olive btn-xs">添加权限</a>
                                      </td>
                                  </tr>
                              </c:forEach>
                              </tbody>
                          </table>
                          <!--数据列表/-->

                      </div>
                      <!-- 数据表格 /-->

                  </div>
                  <!-- /.box-body -->

                  <!-- .box-footer-->
                  <div class="box-footer">

                      <div class="pull-left">
                          <div class="form-group form-inline">
                              总共<span>${pageInfo.pages }</span> 页，共<span>${pageInfo.total }</span> 条数据。 每页<span>${pageInfo.size }</span> 条
                          </div>
                      </div>
                      <div class="box-tools pull-right">
                          <ul class="pagination">
                              <li><a href="${pageContext.request.contextPath}/role/findAll.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a></li>
                              <li><a href="${pageContext.request.contextPath}/role/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                              <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                  <li><a href="${pageContext.request.contextPath}/role/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                              </c:forEach>
                              <li><a href="${pageContext.request.contextPath}/role/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                              <li><a href="${pageContext.request.contextPath}/role/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a></li>
                          </ul>
                      </div>
                  </div>
                  <!-- /.box-footer-->

              </div>

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
    $("#refresh").click(function () {
        window.location.href="${pageContext.request.contextPath}/role/findAll.do";
    });
</script>
</body>
</html>
