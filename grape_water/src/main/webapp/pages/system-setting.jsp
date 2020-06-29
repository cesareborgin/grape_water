<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/5/22
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>账号信息</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/toastr.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/toastr.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body class="hold-transition skin-purple sidebar-mini">
<div class="wrapper">
    <!-- 页面头部 -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- 页面头部 /-->
    <!-- 导航侧栏 -->
    <jsp:include page="sidebar.jsp"></jsp:include>
    <!-- 内容区域 -->
    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                账号信息
                <small>详情</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">账号信息</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <div class="box-body">

                <!--tab页-->
                <div class="nav-tabs-custom">

                    <!--tab头-->
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab-form" data-toggle="tab">账号信息</a>
                        </li>
                    </ul>
                    <!--tab头/-->

                    <!--tab内容-->
                    <div class="tab-content">

                        <!--基本设置-->
                        <div class="tab-pane active" id="tab-form">
                            <div class="row data-type">

                                <div class="col-md-2 title "><b>账户ID：</b></div>
                                <div class="col-md-10 data text">
                                    <span style="margin: auto">${userInfo.id}</span>
                                </div>

                                <div class="col-md-2 title "><b>账户名称：</b></div>
                                <div class="col-md-10 data text">
                                    <span style="margin: auto">${userInfo.username}</span>
                                </div>

                                <div class="col-md-2 title "><b>系统登录密码：</b></div>
                                <div class="col-md-10 data  ">
                                    <input type="password" class="form-control" value="${userInfo.password}" style="width: 30%;border-color: #FFFFFF" readonly="readonly"/>
                                </div>

                                <div class="col-md-2 title "><b>手机号码：</b></div>
                                <div class="col-md-10 data text ">
                                    <span style="margin: auto">${userInfo.phoneNum}</span>
                                </div>
                                <div class="col-md-2 title "><b>登录角色：</b></div>
                                <div class="col-md-10 data text ">
                                    <c:forEach items="${userInfo.roles}" var="role">
                                       <button type="button" class="btn btn-sm bg-olive margin" style="margin: auto">${role.roleDesc}</button>
                                    </c:forEach>
                                </div>

                                <div class="col-md-2 title "><b>账号授权状态：</b></div>
                                <div class="col-md-10 data text ">
                                    <select class="form-control select2" style="width: 10%" >
                                        <option><h6>${userInfo.statusStr}</h6></option>
                                    </select>
                                </div>


                                <div class="col-md-2 title "><b>重置密码：</b></div>
                                <div class="col-md-10 data ">
                                    <button type="button" class="btn btn-primary" id="setPassword">重置</button>
                                </div>
                                <div class="col-md-2 title"></div>
                                <div class="col-md-10 data text-center">
                                    <a href="${pageContext.request.contextPath}/firm/getIndex.do" class="btn btn-default" style="margin: auto">返回</a>
                                </div>
                            </div>
                        </div>
                        <!--基本设置/-->
                        <!--添加数据框-->
                        <div class="modal fade" role="dialog" id="reset-modal" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">
                                            <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                        </button>
                                        <h4 class="modal-title">重置密码</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal" id="password-form" method="post">
                                            <div class="form-group">
                                                <label for="original" class="col-sm-3 control-label">原始密码：</label>
                                                <div class="col-sm-9">
                                                    <input name="original" type="password" class="form-control" id="original" placeholder="原始密码"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="getPassword" class="col-sm-3 control-label">新的密码:</label>
                                                <div class="col-sm-9">
                                                    <input name="getPassword" type="password" class="form-control" id="getPassword" placeholder="新密码"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="surePassword" class="col-sm-3 control-label">确认密码:</label>
                                                <div class="col-sm-9">
                                                    <input name="surePassword" type="password" class="form-control" id="surePassword" placeholder="确认密码"/>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                                <button type="button" id="reset" class="btn btn-default" >重置</button>
                                                <button type="button" id="btn-save" class="btn btn-primary" onclick="savePassword()">确认</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--tab内容/-->

                        <!--修改成功-->
                        <div class="modal fade modal-success" id="successModal" tabindex="-1"
                             role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title"><i class="icon fa fa-check">密码重置成功！</i></h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>
                                            <strong>注意！</strong> 您修改密码成功，必须退出系统，才能登陆！
                                        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="${pageContext.request.contextPath}/logout.do" class="btn btn-default btn-flat">确定</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--修改成功-->

                    </div>
                    <!--tab内容/-->

                </div>
                <!--tab页/-->



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
        <strong>Copyright &copy; 2020 <a href="#">明月制作</a>.</strong> All rights reserved.
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
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/spop/src/prism.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/toastr.min.js"></script>
<script>
    $(document).ready(function() {

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
<script type="text/javascript">
    $("#setPassword").click(function () {
        $("#reset-modal").modal('show');
    });

</script>
<script type="text/javascript">
  $(function () {
      $('#password-form').bootstrapValidator({
          live:'enabled',
          message: 'This value is not valid',
          //提供输入验证图标提示
          feedbackIcons: {
              valid: 'glyphicon glyphicon-ok',
              invalid: 'glyphicon glyphicon-remove',
              validating: 'glyphicon glyphicon-refresh'
          },
          fields:{
              original:{
                  massage:'原始密码输入有误!',
                  validators:{
                      notEmpty:{
                          message:'原密码不能为空'
                      },
                      regexp: {
                          regexp: /^[^ ]+$/,
                          message: '原密码不能有空格'
                      }
                  }
              },
              getPassword:{
                  validators:{
                      notEmpty:{
                          message:'新的密码不能为空'
                      },
                      stringLength: {
                          min: 6,
                          max: 50,
                          message: '新密码长度大于8'
                      },
                      regexp : {
                          regexp : /^(?:(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])|(?=.*[A-Z])(?=.*[a-z])(?=.*[^A-Za-z0-9])|(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])|(?=.*[a-z])(?=.*[0-9])(?=.*[^A-Za-z0-9])).{6,16}$/,
                          message : '新密码长度为6至16位,并且需要包含数字、小写字母、大写字母、符号(至少三种)'
                      }
                  }
              },
              surePassword:{
                  validators:{
                      notEmpty:{
                          message:'确认密码不能为空'
                      },
                      regexp : {
                          regexp : /^(?:(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])|(?=.*[A-Z])(?=.*[a-z])(?=.*[^A-Za-z0-9])|(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])|(?=.*[a-z])(?=.*[0-9])(?=.*[^A-Za-z0-9])).{6,16}$/,
                          message : '用户确认密码长度为6至16位,并且需要包含数字、小写字母、大写字母、符号(至少三种)'
                      },
                      identical: {
                          field: 'getPassword',
                          message: '新密码与确认密码不一致！'
                      },
                      stringLength: {
                          min: 6,
                          max: 50,
                          message: '确认密码长度在6-50之间'
                      }
                  }
              }
          }

      });
      $("#reset").click(function () {
          $("#original").val("");
          $("#getPassword").val("");
          $("#surePassword").val("");
      });
      $("#btn-save").click(function () {
          $.ajax({
              data:{"original":$("#original").val(),"getPassword":$("#getPassword").val()},
              type:"post",
              dataType:"json",
              url:"${pageContext.request.contextPath}/system/resetPassword.do",
              success:function (data) {
                  if(data.type=="success"){
                      $("#reset-modal").modal('hide');
                      $("#successModal").modal('show');
                  }else {
                      spop({template:'原密码输入有误！',style:'error',autoclose:2000,position:'top-center'});
                  }
              },
              error:function (errorMsg) {
                  spop({template:'数据加载失败！',style:'warning',position:'top-center'});
              }
          })
      });
  })
</script>
</body>
</html>
