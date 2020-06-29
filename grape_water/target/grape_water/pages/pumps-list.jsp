<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/5/4
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>水泵设备台账</title>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,pumps-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
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
            <h1>水泵台账<small>台账信息</small></h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
                <li><a href="${pageContext.request.contextPath}/pumps/findAll.do">水泵表单</a></li>
                <li class="active">全部水泵</li>
            </ol>
        </section>
        <!-- 内容头部 /-->
        <section class="content">
            <div class="box box-primary">
                <div class="box-header with-border"><i class="fa fa-book"></i><h3 class="box-title">列表</h3> </div>
            <!--数据表格-->
            <div class="box-body">
                <!-- 数据表格 -->
                <div class="table-box" >

                    <!-- 查询、添加、批量删除、导出、刷新 -->
                    <div class="row-fluid">
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
                                            <form role="form" action="${pageContext.request.contextPath}/pumps/importExcel.do" enctype="multipart/form-data" method="post">
                                                <div class="form-group">
                                                    <label for="InputFile">文件写入：</label>
                                                    <input type="file" id="InputFile"name="InputFile">
                                                </div>
                                                <div class="form-group">
                                                    <button type="button" class="btn btn-default btn-sm" id="model-download" onclick="location.href='${pageContext.request.contextPath}/pumps/downloadModel.do'">
                                                        <i class="fa fa-cloud-download"></i> 模板下载
                                                    </button>
                                                </div>
                                                <!-- /.box-body -->
                                                <div class="box-footer">
                                                    <button type="submit" class="btn btn-success">&emsp;提交 &emsp;</button>
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
                            <form id="queryForm" action="${pageContext.request.contextPath}/pumps/findByName.do" method="post">
                                <div class="col-xs-2">
                                    <input type="text" id="searchName" name="searchName" class="form-control input-sm" placeholder="搜索" value=""/>
                                </div>
                                <button type="submit" class="btn btn-primary btn-sm" id="btn-query" >
                                    <i class="fa fa-search"></i> 查询
                                </button>
                                <button type="button" class="btn btn-primary btn-sm" id="btn-add" onclick="location.href='${pageContext.request.contextPath}/pumps/pumps-add.do'">
                                    <i class="fa fa-plus"></i> 添加
                                </button>
                                <button type="button" class="btn btn-primary btn-sm" id="btn-export" onclick="location.href='${pageContext.request.contextPath}/pumps/exportExcel.do'">
                                    <i class="fa fa-cloud-download"></i>导出
                                </button>
                                <button type="button" class="btn btn-primary btn-sm" id="btn-re" data-toggle="modal" data-target="#importExcel">
                                    <i class="fa  fa-cloud-upload"></i> 导入
                                </button>
                                <button type="button" class="btn btn-primary btn-sm" id="btn-del" >
                                    <i class="fa fa-trash"></i> 删除
                                </button>
                            </form>
                        </div>
                    </div>
                    <!--工具栏/-->
                    <!--导入窗口-->
                        <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="del-modal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">确认删除</h4>
                                    </div>
                                    <div class="modal-body">
                                        <h3 style="color: #00CD00"><strong>是否确定删除数据？</strong></h3>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                        <button type="button" class="btn btn-primary" id="btn-sure">确定</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->

                    <!--数据列表-->
                    <div style="width:1460px;overflow-x: scroll">
                    <table id="dataList" class="table table-bordered table-striped table-hover dataTable" style="width: 1800px">
                        <thead>
                        <tr>
                            <th class="t" style="padding-right: 0px"><input id="selall" type="checkbox" class="icheckbox_square-blue"></th>
                            <th class="" style="font-size: small">序号</th>
                            <th class="text-center" style="font-size: small">设备内部名称</th>
                            <th class="text-center" style="font-size: small">设备型号</th>
                            <th class="text-center" style="font-size:small">电机额定功率(kw)</th>
                            <th class="text-center" style="font-size: small">额定流量(m³/h)</th>
                            <th class="text-center" style="font-size: small">额定电流(A)</th>
                            <th class="text-center" style="font-size: small">额定电压(V)</th>
                            <th class="text-center" style="font-size: small">泵额定效率(%)</th>
                            <th class="text-center" style="font-size: small">额定轴功率(kw)</th>
                            <th class="text-center" style="font-size: small">排出口径(mm)</th>
                            <th class="text-center" style="font-size: small">吸入口径(mm)</th>
                            <th class="text-center" style="font-size: small">转速(r/min)</th>
                            <th class="text-center" style="font-size: small">扬程(m)</th>
                            <th class="text-center" style="font-size: small">防护等级</th>
                            <th class="text-center" style="font-size: small">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${pumpsList}" var="pumps">
                            <tr>
                                <td><input name="mds" type="checkbox" value="${pumps.id }"></td>
                                <td class="text-center" style="font-size: 90%">${pumps.id }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.inernalName }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.modelType }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.MTOP }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.ROF }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.electricity }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.voltage }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.efficiency }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.shaft }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.DGAT }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.SGAT }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.REV }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.HODL }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.LOFT }</td>
                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/pumps/editGo.do?id=${pumps.id}" class="btn bg-olive btn-xs">修改</a>
                                    <a href="${pageContext.request.contextPath}/pumps/deleteById.do?id=${pumps.id}" class="btn bg-olive btn-xs">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:forEach items="${searchList}" var="pumps">
                            <tr>
                                <td><input name="mid" type="checkbox" value="${pumps.id }"></td>
                                <td class="text-center" style="font-size: 90%">${pumps.id }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.inernalName }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.modelType }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.MTOP }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.ROF }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.electricity }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.voltage }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.efficiency }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.shaft }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.DGAT }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.SGAT }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.REV }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.HODL }</td>
                                <td class="text-center" style="font-size: 90%">${pumps.LOFT }</td>
                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/pumps/editGo.do?id=${pumps.id}" class="btn bg-olive btn-xs">修改</a>
                                    <a href="${pageContext.request.contextPath}/pumps/deleteById.do?id=${pumps.id}" class="btn bg-olive btn-xs">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    </div>
                    <!--数据列表/-->

                </div>
                <!-- 数据表格 /-->
            </div>
            <div class="box-footer">

                <div class="pull-left">
                    <div class="form-group form-inline">
                        总共<span>${pageInfo.pages }</span> 页，共<span>${pageInfo.total }</span> 条数据。 每页
                        <select class="form-control" id="changePageSize" onchange="changePageSize()">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                            <option>13</option>
                            <option>14</option>
                            <option>15</option>
                            <option>16</option>
                        </select> 条
                    </div>
                </div>
                <div class="box-tools pull-right">
                    <ul class="pagination">
                        <li><a href="${pageContext.request.contextPath}/pumps/findAll.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a></li>
                        <li><a href="${pageContext.request.contextPath}/pumps/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                            <li><a href="${pageContext.request.contextPath}/pumps/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                        </c:forEach>
                        <li><a href="${pageContext.request.contextPath}/pumps/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                        <li><a href="${pageContext.request.contextPath}/pumps/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a></li>
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
<script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
<script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
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

    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }
    function changePageSize() {
        //获取下拉框的值
        var pageSize = $("#changePageSize").val();

        //向服务器发送请求，改变没页显示条数
        location.href = "${pageContext.request.contextPath}/pumps/findAll.do?page=1&size="
            + pageSize;
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
        $("#del-modal").modal('show');
    });
    $("#btn-sure").click(function () {
        var idArr = [];
        $("#dataList td input[name='mds']:checked").each(function () {
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
                url:"${pageContext.request.contextPath}/pumps/delete.do",
                success:function (response) {
                    if(response.type=="success"){
                        window.location.href="${pageContext.request.contextPath}/pumps/findAll.do";
                    }else if(response.type=="error"){
                        $("#del-modal").modal('hide');
                        spop({template:'删除失败',style:'error',position:'top-center',autoclose:2000});
                    }
                },
                error:function () {
                    spop({template:'其他错误，请检查数据！',style:'warning',position:'top-center',autoclose:2000});
                }
            })
        }
    });
</script>
</body>
</html>
