<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/5/20
  Time: 13:12
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




    <title>区域模型页</title>



    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/toastr.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/toastr.css">

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
                区域模型 <small>名称管理</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
                <li><a href="${pageContext.request.contextPath}/area/getlist.do">区域模型</a></li>
                <li class="active">名称管理</li>
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
                        <div class="pull-right">
                          <form>
                              <button type="button" class="btn btn-primary btn-sm " title="新建" id="btn-add">
                                  <i class="fa fa-folder-open"></i> 新建
                              </button>
                              <button type="button" class="btn btn-primary btn-sm" title="删除" id="btn-del">
                                  <i class="fa fa-trash-o"></i> 删除
                              </button>
                              <button type="button" class="btn btn-primary btn-sm" title="刷新" id="refresh">
                                  <i class="fa fa-refresh"></i> 刷新
                              </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                          </form>
                        </div>
                        <div class="row">
                            <form id="queryForm" action="${pageContext.request.contextPath}/area/search.do" method="post">
                                <div class="col-xs-2">
                                    <input type="text" id="nameStr" name="nameStr" class="form-control input-sm" placeholder="搜索" value=""/>
                                </div>
                                <button type="submit" class="btn btn-primary btn-sm" id="btn-query" >
                                    <i class="fa fa-search"></i> 查询
                                </button>
                            </form>
                        </div>
                        <!--工具栏/-->

                        <!--数据列表-->
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="" style="padding-right: 0px;"><input id="selall" type="checkbox" class="icheckbox_square-blue" >
                                </th>
                                <th class="sorting_asc">ID</th>
                                <th class="sorting_desc">区域名称</th>
                                <th class="sorting_asc sorting_asc_disabled">区域码</th>
                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>


                            <c:forEach items="${areaList}" var="area">

                                <tr>
                                    <td><input name="mids" type="checkbox" id="mids" value=${area.id}></td>
                                    <td>${area.id }</td>
                                    <td>${area.enLocal }</td>
                                    <td>${area.enCode }</td>
                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs" id="editck">编辑</button>
                                        <a href="${pageContext.request.contextPath}/area/deleteById.do?id=${area.id}" class="btn bg-olive btn-xs">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:forEach items="${list}" var="area">

                                <tr>
                                    <td><input name="mid" type="checkbox" id="Mid" value=${area.id}></td>
                                    <td>${area.id }</td>
                                    <td>${area.enLocal }</td>
                                    <td>${area.enCode }</td>
                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs" id="editck2">编辑</button>
                                        <a href="${pageContext.request.contextPath}/area/deleteById.do?id=${area.id}" class="btn bg-olive btn-xs">删除</a>
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
                <!--添加数据框-->
                <div class="modal fade" role="dialog" id="add-modal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                </button>
                                <h4 class="modal-title">新建区域模型</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" id="add-form" method="post">
                                    <div class="form-group">
                                        <label for="enLocal" class="col-sm-3 control-label">区域名称:</label>
                                        <div class="col-sm-9">
                                            <input name="enLocal" type="text" class="form-control" id="enLocal" placeholder="区域名称"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="enCode" class="col-sm-3 control-label">区域代码:</label>
                                        <div class="col-sm-9">
                                            <input name="enCode" type="text" class="form-control" id="enCode" placeholder="区域代码"/>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                        <button type="button" id="reset" class="btn btn-default" >清空</button>
                                        <button type="button" id="addItem" class="btn btn-primary" onclick="add()">确认保存</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!--删除弹框-->
                <div class="modal inmodal fade" id="del" tabindex="-1"
                     role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                </button>
                                <h4 class="modal-title">确认删除</h4>
                            </div>
                            <div class="modal-body">
                                <p>
                                    <strong>注意！</strong> 是否确定删除数据？
                                </p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="delyes_btn1" class="btn btn-primary"
                                        data-dismiss="modal">确认</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--删除弹框-->

                <!--编辑框-->
                <div class="modal fade" role="dialog" id="editModal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                </button>
                                <h4 class="modal-title">编辑区域模型</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" id="edit-form" method="post">
                                    <div class="form-group">
                                        <label for="id" class="col-sm-3 control-label">ID:</label>
                                        <div class="col-sm-9">
                                            <input name="id" type="text" class="form-control" id="id" placeholder="ID"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="local" class="col-sm-3 control-label">区域名称:</label>
                                        <div class="col-sm-9">
                                            <input name="local" type="text" class="form-control" id="local" placeholder="区域名称"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="code" class="col-sm-3 control-label">区域代码:</label>
                                        <div class="col-sm-9">
                                            <input name="code" type="text" class="form-control" id="code" placeholder="区域代码"/>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                        <button type="button" id="editItem" class="btn btn-primary" onclick="add()">确认保存</button>
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
    <!-- @@close -->
    <!-- 内容区域 /-->

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
<script type="text/javascript">
    toastr.options = {
        closeButton: false,                                            // 是否显示关闭按钮，（提示框右上角关闭按钮）
        debug: false,                                                    // 是否使用deBug模式
        progressBar: true,                                            // 是否显示进度条，（设置关闭的超时时间进度条）
        positionClass: "toast-top-center",              // 设置提示款显示的位置
        onclick: null,                                                     // 点击消息框自定义事件
        showDuration: "3000",                                      // 显示动画的时间
        hideDuration: "1000",                                     //  消失的动画时间
        timeOut: "3000",                                             //  自动关闭超时时间
        extendedTimeOut: "1000",                             //  加长展示时间
        showEasing: "swing",                                     //  显示时的动画缓冲方式
        hideEasing: "linear",                                       //   消失时的动画缓冲方式
        showMethod: "fadeIn",                                   //   显示时的动画方式
        hideMethod: "fadeOut"                                   //   消失时的动画方式
    };
</script>
<script>
    function changePageSize() {
        //获取下拉框的值
        var pageSize = $("#changePageSize").val();

        //向服务器发送请求，改变没页显示条数
        location.href = "${pageContext.request.contextPath}/area/getlist.do?page=1&pageSize="
            + pageSize;
    }
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
    $("#refresh").click(function () {
        window.location.href="${pageContext.request.contextPath}/area/getlist.do";
    });
    $("#btn-add").click(function () {
        $("#add-modal").modal('show');
    });
    $("#reset").click(function () {
        $("#enLocal").val("");
        $("#enCode").val("");
    });
    $(function () {
       $("#add-form").bootstrapValidator({
           live:'enabled',
           message: 'This value is not valid',
           //提供输入验证图标提示
           feedbackIcons: {
               valid: 'glyphicon glyphicon-ok',
               invalid: 'glyphicon glyphicon-remove',
               validating: 'glyphicon glyphicon-refresh'
           },
           fields:{
               enLocal:{
                   validators:{
                       notEmpty:{
                           message:'区域名称不能为空'
                       }
                   }
               },
               enCode:{
                   validators:{
                       notEmpty:{
                           message:'区域代码不能为空'
                       }
                   }
               }
           }
       });
    });
    $("#addItem").click(function () {
        $("#add-form").bootstrapValidator('validate');
        var flag = $("#add-form").data('bootstrapValidator').isValid();
        if(!flag){
            toastr.error("填写有误，请重新填写！",{timeOut:1000});
        }else {
            $.ajax({
                url:"${pageContext.request.contextPath}/area/add.do",
                dataType:"json",
                type:"POST",
                data:{"enLocal":$("#enLocal").val(),"enCode":$("#enCode").val()},
                success:function (result) {
                    if(result.type=="success"){
                        $("#add-modal").modal('hide');
                        var mag = "您添加数据已成功！"
                        if(confirm(mag)==true){
                            window.location.href="${pageContext.request.contextPath}/area/getlist.do";
                            return true;
                        }
                        spop({template:'添加成功',style:'success',position:'top-center',autoclose:1500});
                        return;
                    }else if(result.type=="error"){
                        spop({template:result.msg,style:'error',position:'top-center',autoclose:1500});
                    }
                },
                error:function (errorMsg) {
                    spop({template:'请求数据加载失败！',style:'error',position:'top-center',autoclose:1500});
                }
            });
        }
    });

    //实现批量删除
    $("#btn-del").click(function () {
        if($("#dataList td input[name='mids']:checked")[0]==null){
            toastr.warning('请选择要删除的数据！','提示');
            return;
        }
        if(confirm("确定删除吗？")){
            var strIds =[];
            $("#dataList td input[name='mids']:checked").each(function () {
                strIds.push($(this).val());
            });

            var ids = strIds.join(",");
            $.ajax({
                type:"post",
                data:{ids:ids},
                dataType:"json",
                url:"${pageContext.request.contextPath}/area/delete.do",
                success:function (result) {
                    if(result.type=="success"){
                        window.location.href="${pageContext.request.contextPath}/area/getlist.do";
                    }else if(result.type=="error"){
                        spop({template:'删除失败',style:'error',position:'top-center',autoclose:1500});
                    }
                },
                error:function () {
                    spop({template:'后台出错',style:'warning',position:'top-center',autoclose:1500});
                }
            });
        }
    })
</script>
<script type="text/javascript">
    $("#dataList tbody").on("click","#editck",function () {
        var row = $("table#dataList tr").index($(this).closest("tr"));
        var id = $("table#dataList").find("tr").eq(row).find("td").eq(1).text();
        var local  = $("table#dataList").find("tr").eq(row).find("td").eq(2).text();
        var code = $("table#dataList").find("tr").eq(row).find("td").eq(3).text();
        $("#id").val(id);
        $("#local").val(local);
        $("#code").val(code);
        $("#editModal").modal('show');
    });
    $("#dataList tbody").on("click","#editck2",function () {
        var row = $("table#dataList tr").index($(this).closest("tr"));
        var id = $("table#dataList").find("tr").eq(row).find("td").eq(1).text();
        var local  = $("table#dataList").find("tr").eq(row).find("td").eq(2).text();
        var code = $("table#dataList").find("tr").eq(row).find("td").eq(3).text();
        $("#id").val(id);
        $("#local").val(local);
        $("#code").val(code);
        $("#editModal").modal('show');
    });
    $("#editItem").click(function () {
        $('#edit-form').bootstrapValidator('validate');
        var flag = $("#edit-form").data('bootstrapValidator').isValid();
        if(!flag){
            toastr.error("填写有误，请重新填写！",{timeOut:1000});
            return;
        }else {
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/area/edit.do",
                data:{"id":$("#id").val(),"enLocal":$("#local").val(),"enCode":$("#code").val()},
                dataType:"json",
                success : function (data) {
                    if(data.type=="success"){
                        spop({template:'修改成功',style:'success',autoclose:2000,position:'top-center'});
                        $("#editModal").modal('hide');
                    }else {
                        spop({template:data.msg,style:'error',autoclose:2000,position:'top-center'});
                    }
                }
            });
        }
    })
</script>
</body>

</html>
