<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/5/2
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>传感器台账列表</title>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,sensors-scalable=no" name="viewport">
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
    <!--页面头部-->
    <jsp:include page="header.jsp"></jsp:include>
    <!--页面头部/-->
    <!-- 导航侧栏 -->
    <jsp:include page="sidebar.jsp"></jsp:include>
    <!-- 导航侧栏 -->
    <div class="content-wrapper">
        <!-- 内容头部 -->
        <section class="content-header">
            <h1>管理中心<small>传感器台账</small></h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
                <li><a href="${pageContext.request.contextPath}/sensors/findAll.do">传感器台账</a></li>
                <li class="active">全部传感器</li>
            </ol>
        </section>
        <!-- 内容头部 /-->
        <section class="content">
            <div class="box box-primary">
                <div class="box-header with-border"><i class="fa fa-cube"></i><h3 class="box-title">列表</h3> </div>
            <!--数据表格-->
            <div class="box-body">
                <!-- 数据表格 -->
                <div class="table-box">

                    <!-- 查询、添加、批量删除、导出、刷新 -->
                    <div class="row-fluid">
                        <div class="pull-right">
                                <button type="button" class="btn btn-primary btn-sm" id="btn-add" onclick="location.href='${pageContext.request.contextPath}/sensors/toAdd.do'">
                                    <i class="fa fa-plus"></i> 新建
                                </button>
                                <button type="button" class="btn btn-primary btn-sm" id="btn-del">
                                    <i class="fa fa-remove"></i> 删除
                                </button>
                                <button type="button" class="btn btn-primary btn-sm" id="btn-re" data-toggle="modal" data-target="#importExcel">
                                    <i class="fa fa-cloud-upload"></i> 导入
                                </button>
                               <button type="button" class="btn btn-primary btn-sm" id="btn-export" onclick="location.href='${pageContext.request.contextPath}/sensors/exportExcel.do'">
                                    <i class="fa fa-cloud-download"></i> 导出
                               </button>
                        </div>
                        <div id="importExcel" class="modal modal-primary" role="dialog" name="importExcel">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">文件导入</h4>
                                    </div>
                                    <div class="modal-body">


                                        <div class="box-body">
                                            <button type="button" class="btn btn-default"  onclick="location.href='${pageContext.request.contextPath}/sensors/downloadModal.do'">
                                                <a href="${pageContext.request.contextPath}/sensors/downloadModal.do"><i class="glyphicon glyphicon-save"></i> </a>模板下载
                                            </button>
                                            <form role="form" action="${pageContext.request.contextPath}/sensors/importExcel.do" enctype="multipart/form-data" method="post">
                                                <div class="form-group">
                                                    <label for="InputFile">文件写入：</label>
                                                    <input type="file" id="inputFile" name="inputFile">
                                                </div>
                                                <!-- /.box-body -->
                                                <div class="box-footer">
                                                    <button type="submit" class="btn btn-primary">提交</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer">

                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                        </div>

                        <div class="row">
                            <form id="queryForm" action="${pageContext.request.contextPath}/sensors/searchList.do" method="post">
                                <div class="col-xs-2">
                                    <input type="text" id="searchName" name="searchName" class="form-control input-sm" placeholder="关键字" value=""/>
                                </div>
                                <button type="submit" class="btn btn-primary btn-sm" id="btn-query" >
                                    <i class="fa fa-search"></i> 查询
                                </button>
                            </form>
                        </div>
                    </div>
                    <!--工具栏/-->
                    <!--导入窗口-->
                    <!--删除弹框-->
                    <div class="modal inmodal fade" id="del" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">
                                        <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                    </button>
                                    <h4 class="modal-title">确认删除</h4>
                                </div>
                                <div class="modal-body">
                                    <p style="color: #00CD00">
                                        <strong>注意！</strong> 是否确定删除数据？
                                    </p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" id="sure-del" class="btn btn-primary"
                                            data-dismiss="modal">确认</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--删除弹框-->

                    <!-- 编辑模态框（Modal） -->
                    <div class="modal fade" role="dialog" id="edit-modal" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">
                                        <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                    </button>
                                    <h4 class="modal-title">修改传感器台账信息</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" name="sensors" id="sensors" method="post">
                                        <div class="form-group">
                                            <label for="id" class="col-sm-3 control-label">台账表单id:</label>
                                            <div class="col-sm-9">
                                                <input name="id" type="text" class="form-control" id="id" placeholder="台账表单id" value=""/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sensorsName" class="col-sm-3 control-label">传感器名称:</label>
                                            <div class="col-sm-9">
                                                <input name="sensorsName" type="text" class="form-control" id="sensorsName" placeholder="设备名称" value=""/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sensorsType" class="col-sm-3 control-label">传感器型号:</label>
                                            <div class="col-sm-9">
                                                <input name="sensorsType" type="text" class="form-control" id="sensorsType" placeholder="传感器型号" value=""/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="address" class="col-sm-3 control-label">安装地址:</label>
                                            <div class="col-sm-9">
                                                <input name="installtionAddr" type="text" class="form-control" id="address" placeholder="安装地址" value=""/>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                            <button type="button" id="edit" class="btn btn-primary" >确认保存</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--编辑弹框-->


                    <!--数据列表-->
                    <table id="dataList" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="" style="padding-right: 0px"><input id="selall" type="checkbox" class="icheckbox_square-blue"></th>
                            <th class="" style="font-size: small">序号</th>
                            <th class="" style="font-size: small">设备名称</th>
                            <th class="" style="font-size: small">设备型号</th>
                            <th class="" style="font-size: small">安装地址</th>
                            <th class="" style="font-size: small">精度</th>
                            <th class="" style="font-size: small">波特率(HZ)</th>
                            <th class="" style="font-size: small">上次检定时间</th>
                            <th class="" style="font-size: small">下次检定时间</th>
                            <th class="" style="font-size: small">压力等级</th>
                            <th class="" style="font-size: small">温度等级</th>
                            <th class="" style="font-size: small">防护等级</th>
                            <th class="" style="font-size: small">连接状态</th>
                            <th class="text-center" style="font-size: small">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sensorsList}" var="sensors">
                            <tr>
                                <td><input name="mid" type="checkbox" value="${sensors.id}" id="mid"></td>
                                <td style="font-size: 90%">${sensors.id }</td>
                                <td style="font-size: 90%">${sensors.sensorsName }</td>
                                <td style="font-size: 90%">${sensors.sensorsType }</td>
                                <td style="font-size: 90%">${sensors.installtionAddr }</td>
                                <td style="font-size: 90%">${sensors.precision }</td>
                                <td style="font-size: 90%">${sensors.baudRate }</td>
                                <td style="font-size: 90%">${sensors.lastTimeStr }</td>
                                <td style="font-size: 90%">${sensors.nextTimeStr }</td>
                                <td style="font-size: 90%">${sensors.pressureGradeStr }</td>
                                <td style="font-size: 90%">${sensors.tempGradeStr }</td>
                                <td style="font-size: 90%">${sensors.prl }</td>
                                <td style="font-size: 90%">${sensors.statusStr }</td>

                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/sensors/editGo.do?id=${sensors.id}" class="btn bg-olive btn-xs">详情</a>
                                    <button onclick="editfo(${sensors.id})" id="edit-md1" class="btn bg-olive btn-xs">修改</button>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:forEach items="${searchList}" var="sensors">
                            <tr>
                                <td><input name="mds" type="checkbox" value="${sensors.id}" id="mds"></td>
                                <td style="font-size: 90%">${sensors.id }</td>
                                <td style="font-size: 90%">${sensors.sensorsName }</td>
                                <td style="font-size: 90%">${sensors.sensorsType }</td>
                                <td style="font-size: 90%">${sensors.installtionAddr }</td>
                                <td style="font-size: 90%">${sensors.precision }</td>
                                <td style="font-size: 90%">${sensors.baudRate }</td>
                                <td style="font-size: 90%">${sensors.lastTimeStr }</td>
                                <td style="font-size: 90%">${sensors.nextTimeStr }</td>
                                <td style="font-size: 90%">${sensors.pressureGradeStr }</td>
                                <td style="font-size: 90%">${sensors.tempGradeStr }</td>
                                <td style="font-size: 90%">${sensors.prl }</td>
                                <td style="font-size: 90%">${sensors.statusStr }</td>

                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/sensors/editGo.do?id=${sensors.id}" class="btn bg-olive btn-xs">详情</a>
                                    <button onclick="editfo(${sensors.id})" id="edit-md2" class="btn bg-olive btn-xs">修改</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <!--数据列表/-->

                </div>
                <!-- 数据表格 /-->
            </div>
            <div class="box-footer">

                <div class="pull-left">
                    <div class="form-group form-inline">
                        总共<span>${pageInfo.pages }</span> 页，共<span>${pageInfo.total }</span> 条数据。 每页
                        <select class="form-control" id="changePageSize" onchange="changePageSize()" name="pageSize">
                            <option value="" selected>${pageInfo.size}</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                        </select> 条
                    </div>
                </div>
                <div class="box-tools pull-right">
                    <ul class="pagination">
                        <li><a href="${pageContext.request.contextPath}/sensors/findAll.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a></li>
                        <li><a href="${pageContext.request.contextPath}/sensors/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                            <li><a href="${pageContext.request.contextPath}/sensors/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                        </c:forEach>
                        <li><a href="${pageContext.request.contextPath}/sensors/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                        <li><a href="${pageContext.request.contextPath}/sensors/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a></li>
                    </ul>
                </div>
            </div>
            </div>
        </section>
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
    });
    function changePageSize() {
        //获取下拉框的值
        var pageSize = $("#changePageSize").val();

        //向服务器发送请求，改变没页显示条数
        window.location.href = "${pageContext.request.contextPath}/sensors/findAll.do?page=1&size="
            + pageSize;
    }

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
    $("#btn-del").click(function () {
        $("#del").modal('show');
    });
    $("#sure-del").click(function () {
        var idArr = [];
        $("#dataList td input[name='mid']:checked").each(function () {
            idArr.push($(this).val());
        });
        if(idArr.length<1){
            spop({template:'请选择您要删除的数据！',style:'warning',position:'top-center',autoclose:2000});
        }else {
            var ids = idArr.join(",");
            $.ajax({
                type:"post",
                dataType:"json",
                data:{"ids":ids},
                url:"${pageContext.request.contextPath}/sensors/delete.do",
                success:function (response) {
                    if(response.type=="success"){
                        window.location.href="${pageContext.request.contextPath}/sensors/findAll.do";
                    }else if(response.type=="error"){
                        $("#del").modal('hide');
                        spop({template:'删除失败',style:'error',position:'top-center',autoclose:2000});
                    }
                },
                error:function () {
                    spop({template:'其他错误，请检查数据！',style:'warning',position:'top-center',autoclose:2000});
                }
            })
        }
    });
    $("#dataList tbody").on("click","#edit-md1",function () {
        var row = $("table#dataList tr").index($(this).closest("tr"));
        var id = $("table#dataList").find("tr").eq(row).find("td").eq(1).text();
        var sensorsName = $("table#dataList").find("tr").eq(row).find("td").eq(2).text();
        var sensorsType = $("table#dataList").find("tr").eq(row).find("td").eq(3).text();
        var address = $("table#dataList").find("tr").eq(row).find("td").eq(4).text();
        $("#id").val(id);
        $("#sensorsName").val(sensorsName);
        $("#sensorsType").val(sensorsType);
        $("#address").val(address);
        $("#edit-modal").modal('show');
    });
    $("#dataList tbody").on("click","#edit-md2",function () {
        var row = $("table#dataList tr").index($(this).closest("tr"));
        var id = $("table#dataList").find("tr").eq(row).find("td").eq(1).text();
        var sensorsName = $("table#dataList").find("tr").eq(row).find("td").eq(2).text();
        var sensorsType = $("table#dataList").find("tr").eq(row).find("td").eq(3).text();
        var address = $("table#dataList").find("tr").eq(row).find("td").eq(4).text();
        $("#id").val(id);
        $("#sensorsName").val(sensorsName);
        $("#sensorsType").val(sensorsType);
        $("#address").val(address);
        $("#edit-modal").modal('show');
    });
    $("#edit").click(function () {
        $.ajax({
            type:"POST",
            dataType:"json",
            url:"${pageContext.request.contextPath}/sensors/update.do",
            data:{"sensorsName":$("#sensorsName").val(),"sensorsType":$("#sensorsType").val(),"installtionAddr":$("#address").val(),"id":$("#id").val()},
            success:function (response) {
                if(response.type=="success"){
                    window.location.href="${pageContext.request.contextPath}/sensors/findAll.do";
                }else {
                    spop({template:'修改失败！',style:'error',position:'top-center',autoclose:2000});
                }
            },
            error:function () {
                spop({template:'其他错误!',style:'warning',position:'top-center',autoclose:2000});
            }
        })
    })
</script>
</body>
</html>
