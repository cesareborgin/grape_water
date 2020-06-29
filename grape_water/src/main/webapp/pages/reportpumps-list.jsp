<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/5/7
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>泵类传输报表</title>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,repumps-scalable=no" name="viewport">
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
        <h1>报表统计<small>泵类监测</small></h1>
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
            <li><a href="${pageContext.request.contextPath}/reports/formsA.do">泵类液体传输节能监测报表</a></li>
            <li class="active">全部水泵</li>
        </ol>
    </section>
    <!-- 内容头部 /-->
    <section class="content">
        <div class="box box-primary">
            <div class="box-header with-border"><i class="fa fa-cube"></i><h3 class="box-title">列表</h3> </div>
        <!--数据表格-->
        <div class="box-body">
            <!-- 数据表格 -->
            <div class="table-box" >

                <!-- 查询、添加、批量删除、导出、刷新 -->
                <div class="row-fluid">
                    <div class="pull-right">
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary btn-sm" id="btn-reload">
                                <i class="fa fa-spinner"></i> 刷新
                            </button>
                            <button type="button" class="btn btn-primary btn-sm" id="btn-add" onclick="location.href='${pageContext.request.contextPath}/pages/reportpumps-add.jsp'">
                                <i class="fa fa-folder-open"></i> 添加
                            </button>
                            <button type="button" class="btn btn-primary btn-sm" id="btn-export" onclick="location.href='${pageContext.request.contextPath}/reports/exportExcel.do'">
                                <i class="fa fa-download"></i>导出
                            </button>
                            <button type="button" class="btn btn-primary btn-sm" id="btn-re" data-toggle="modal" data-target="#importExcel">
                                <i class="fa  fa-sign-in"></i> 导入
                            </button>
                        </div>
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
                                        <button type="button" class="btn btn-default"  onclick="location.href='${pageContext.request.contextPath}/reports/downloadModal.do'">
                                            <a href="${pageContext.request.contextPath}/reports/downloadModal.do"><i class="glyphicon glyphicon-save"></i> </a>模板下载
                                        </button>
                                        <form role="form" action="${pageContext.request.contextPath}/reports/importExcel.do" enctype="multipart/form-data" method="post">
                                            <div class="form-group">
                                                <label for="InputFile">文件写入：</label>
                                                <input type="file" id="InputFile" name="InputFile">
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
                        <form id="queryForm" action="${pageContext.request.contextPath}/reports/findByCode.do" method="post">
                            <div class="col-xs-2">
                                <input type="text" id="searchName" name="codeStr" class="form-control input-sm" placeholder="搜索" value=""/>
                            </div>
                            <button type="submit" class="btn btn-primary btn-sm" id="btn-query" >
                                <i class="fa fa-search"></i> 查询
                            </button>
                            <button type="button" class="btn btn-danger btn-sm" id="btn-warning" >
                                <i class="fa fa-bell"></i> 警示
                            </button>
                        </form>

                    </div>
                </div>
                <!--工具栏/-->
                <!--导入窗口-->
                <div style="width:1650px;overflow-x: scroll">
                <!--数据列表-->
                <table id="dataList" class="table table-bordered table-striped table-hover table-scroll" style="width: 2100px" >
                    <thead>
                    <tr>
                        <th class="" style="padding-right: 0px"><input id="selall" type="checkbox" class="icheckbox_square-blue"></th>
                        <th class="" style="font-size: small">序号</th>
                        <th class="text-center" style="font-size: small;">监测时段</th>
                        <th class="text-center" style="font-size: small">系统编号</th>
                        <th class="text-center" style="font-size: small">泵入口压力(MPa)</th>
                        <th class="text-center" style="font-size: small">泵出口压力(MPa)</th>
                        <th class="text-center" style="font-size: small">泵进、出口温差(℃)</th>
                        <th class="text-center" style="font-size: small">泵实际扬程(m)</th>
                        <th class="text-center" style="font-size: small">泵实际流量(m³/h)</th>
                        <th class="text-center" style="font-size: small">泵运行效率(%)</th>
                        <th class="text-center" style="font-size: small">传送效率(%)</th>
                        <th class="text-center" style="font-size: small">吸水高度(m)</th>
                        <th class="text-center" style="font-size: small">排水高度(m)</th>
                        <th class="text-center" style="font-size: small">工艺所需压力(MPa)</th>
                        <th class="text-center" style="font-size: small">系统回水末端压力(MPa)</th>
                        <th class="text-center" style="font-size: small">表位差(m)</th>
                        <th class="text-center" style="font-size: small">操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${list}" var="repumps">
                        <tr>
                            <td><input name="ids" type="checkbox"></td>
                            <td style="font-size: 90%">${repumps.id }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.monitorsTime}</td>
                            <td class="text-center" style="font-size: 90%">${repumps.modelCode }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.inletPressure }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.outletPressure }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.temperature}</td>
                            <td class="text-center" style="font-size: 90%">${repumps.headDelivery}</td>
                            <td class="text-center" style="font-size: 90%">${repumps.rateFlow }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.operateEfficiency }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.transferEfficiency }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.suctionHeight }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.drainageHeight }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.craftPressure }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.backwaterPressure }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.potentialDifference }</td>
                            <td class="text-center">
                                <button class="btn bg-olive btn-xs" onclick="edit(${repumps.id})">修改</button>
                                <a href="${pageContext.request.contextPath}/reports/delete.do?id=${repumps.id}" class="btn bg-olive btn-xs">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:forEach items="${codeList}" var="repumps">
                        <tr>
                            <td><input name="ids" type="checkbox"></td>
                            <td style="font-size: 90%">${repumps.id }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.monitorsTime}</td>
                            <td class="text-center" style="font-size: 90%">${repumps.modelCode }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.inletPressure }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.outletPressure }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.temperature}</td>
                            <td class="text-center" style="font-size: 90%">${repumps.headDelivery}</td>
                            <td class="text-center" style="font-size: 90%">${repumps.rateFlow }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.operateEfficiency }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.transferEfficiency }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.suctionHeight }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.drainageHeight }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.craftPressure }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.backwaterPressure }</td>
                            <td class="text-center" style="font-size: 90%">${repumps.potentialDifference }</td>
                            <td class="text-center">
                                <button class="btn bg-olive btn-xs" onclick="edit(${repumps.id})">修改</button>
                                <a href="${pageContext.request.contextPath}/reports/delete.do?id=${repumps.id}" class="btn bg-olive btn-xs">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!--数据列表/-->
                </div>
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
                    <li><a href="${pageContext.request.contextPath}/reports/formsA.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a></li>
                    <li><a href="${pageContext.request.contextPath}/reports/formsA.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                    <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                        <li><a href="${pageContext.request.contextPath}/reports/formsA.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                    </c:forEach>
                    <li><a href="${pageContext.request.contextPath}/reports/formsA.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                    <li><a href="${pageContext.request.contextPath}/reports/formsA.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a></li>
                </ul>
            </div>
        </div>
            <!-- 编辑模态框（Modal） -->
            <div class="modal fade" role="dialog" id="editModal" tabindex="-1" aria-hidden="true" style="margin-top:auto">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">
                                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                            </button>
                            <h4 class="modal-title">泵类报表编辑</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" name="editForm" id="editForm" method="post">
                                <div class="form-group">
                                    <label for="id" class="col-sm-3 control-label">表ID:</label>
                                    <div class="col-sm-9">
                                        <input name="id" type="text" class="form-control" id="id" placeholder="表ID" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="date1" class="col-sm-3 control-label">初次检定时间:</label>
                                    <div class="col-sm-9">
                                        <input name="monitorfirstDate" type="text" class="form-control" id="date1" placeholder="监测时间" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="date2" class="col-sm-3 control-label">二次检定时间:</label>
                                    <div class="col-sm-9">
                                        <input name="monitorsecondDate" type="text" class="form-control" id="date2" placeholder="监测时间" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="modelCode" class="col-sm-3 control-label">系统编号:</label>
                                    <div class="col-sm-9">
                                        <input name="modelCode" type="text" class="form-control" id="modelCode" placeholder="系统编号" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inletPressure" class="col-sm-3 control-label">泵入口压力(MPa):</label>
                                    <div class="col-sm-9">
                                        <input name="inletPressure" type="text" class="form-control" id="inletPressure" placeholder="泵入口压力(MPa)" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="outletPressure" class="col-sm-3 control-label">泵出口压力(MPa):</label>
                                    <div class="col-sm-9">
                                        <input name="outletPressure" type="text" class="form-control" id="outletPressure" placeholder="泵出口压力(MPa)" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="temperature" class="col-sm-3 control-label">泵进、出口温差(℃):</label>
                                    <div class="col-sm-9">
                                        <input name="temperature" type="text" class="form-control" id="temperature" placeholder="泵进、出口温差(℃)" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inletPressure" class="col-sm-3 control-label">泵实际扬程(m)</label>
                                    <div class="col-sm-9">
                                        <input name="headDelivery" type="text" class="form-control" id="headDelivery" placeholder="泵实际扬程(m)" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="rateFlow" class="col-sm-3 control-label">泵实际流量(m³/h):</label>
                                    <div class="col-sm-9">
                                        <input name="rateFlow" type="text" class="form-control" id="rateFlow" placeholder="泵实际流量(m³/h)" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="operateEfficiency" class="col-sm-3 control-label">泵运行效率(%):</label>
                                    <div class="col-sm-9">
                                        <input name="operateEfficiency" type="text" class="form-control" id="operateEfficiency" placeholder="泵运行效率(%)" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="transferEfficiency" class="col-sm-3 control-label">传送效率(%):</label>
                                    <div class="col-sm-9">
                                        <input name="transferEfficiency" type="text" class="form-control" id="transferEfficiency" placeholder="传送效率(%)" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="suctionHeight" class="col-sm-3 control-label">吸水高度(m):</label>
                                    <div class="col-sm-9">
                                        <input name="suctionHeight" type="text" class="form-control" id="suctionHeight" placeholder="吸水高度(m)" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="drainageHeight" class="col-sm-3 control-label">排水高度(m):</label>
                                    <div class="col-sm-9">
                                        <input name="drainageHeight" type="text" class="form-control" id="drainageHeight" placeholder="排水高度(m)" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="craftPressure" class="col-sm-3 control-label">工艺所需压力(MPa):</label>
                                    <div class="col-sm-9">
                                        <input name="craftPressure" type="text" class="form-control" id="craftPressure" placeholder="工艺所需压力" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="backwaterPressure" class="col-sm-3 control-label">系统回水末端压力(MPa):</label>
                                    <div class="col-sm-9">
                                        <input name="backwaterPressure" type="text" class="form-control" id="backwaterPressure" placeholder="系统回水末端压力(MPa)" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="potentialDifference" class="col-sm-3 control-label">表位差(m):</label>
                                    <div class="col-sm-9">
                                        <input name="potentialDifference" type="text" class="form-control" id="potentialDifference"  placeholder="表位差(m)"  value=""/>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                    <button type="button" id="edit" class="btn btn-primary" onclick="update()">确认保存</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--编辑弹框-->

            <!--新增预警和告警-->
            <!--添加数据框-->
            <div class="modal fade" role="dialog" id="addWarning" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">
                                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                            </button>
                            <h4 class="modal-title">新建预警和告警信息</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" id="addAlarm" method="post" action="${pageContext.request.contextPath}/reports/addCaution.do">
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
                                        <select class="form-control select2" style="width: 100%" name="alarmLevel" id="alarmLevel">
                                            <option value="">全部级别</option>
                                            <c:forEach items="${alarmTypes}" var="alarmType">
                                                <option value="${alarmType.alarmId}">${alarmType.alarmStr}</option>
                                            </c:forEach>
                                        </select>
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
                                        <select class="form-control select2" style="width: 100%" name="status" id="status">
                                            <option value="1">未恢复</option>
                                            <option value="2">已恢复</option>
                                        </select>
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

        </div>
    </section>
    <!-- 底部导航 -->
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
<script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
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
<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
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
    $(document).ready(function() {
        $('#date1').datetimepicker({
            format : "yyyy-mm-dd hh:ii",
            autoclose : true,
            todayBtn : true,
            language : "zh-CN"
        });
        $('#date2').datetimepicker({
            format : "yyyy-mm-dd hh:ii",
            autoclose : true,
            todayBtn : true,
            language : "zh-CN"
        });
        $('#date3').datetimepicker({
            format : "yyyy-mm-dd hh:ii",
            autoclose : true,
            todayBtn : true,
            language : "zh-CN"
        });
        $('#datepicker-a1').datetimepicker({
            format : "yyyy-mm-dd hh:ii",
            autoclose : true,
            todayBtn : true,
            language : "zh-CN"
        });
        $('#datepicker-a2').datetimepicker({
            format : "yyyy-mm-dd hh:ii",
            autoclose : true,
            todayBtn : true,
            language : "zh-CN"
        });
    });
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
             location.href = "${pageContext.request.contextPath}/reports/formsA.do?page=1&size="
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
    function edit(id) {
        var idStr = id;

        $.ajax({
            data:{"id":idStr},
            dataType:"json",
            type:"post",
            url:"${pageContext.request.contextPath}/reports/findById.do",
            success:function (result) {
                var data = result.entity;
                $("#id").val(data.id);
                $("#date1").val(data.date1Str);
                $("#date2").val(data.date2Str);
                $("#modelCode").val(data.modelCode);
                $("#inletPressure").val(data.inletPressure);
                $("#outletPressure").val(data.outletPressure);
                $("#temperature").val(data.temperature);
                $("#headDelivery").val(data.headDelivery);
                $("#rateFlow").val(data.rateFlow);
                $("#operateEfficiency").val(data.operateEfficiency);
                $("#transferEfficiency").val(data.transferEfficiency);
                $("#suctionHeight").val(data.suctionHeight);
                $("#drainageHeight").val(data.drainageHeight);
                $("#craftPressure").val(data.craftPressure);
                $("#backwaterPressure").val(data.backwaterPressure);
                $("#potentialDifference").val(data.potentialDifference);
                $("#editModal").modal('show');

            }
        })
    }
    function update() {
        var data = $("#editForm").serialize();
        $.ajax({
            type:"post",
            data:data,
            dataType:"json",
            url:"${pageContext.request.contextPath}/reports/update.do",
            success:function (data) {
                if(data.type=="success"){
                    spop({template:'修改成功',style:'success',autoclose:2000,position:'top-center'});
                    $("#editModal").modal('hide');
                }else if(data.type=="error"){
                    spop({template:'后台出差',style:'error',autoclose:2000,position:'top-center'});
                }
            },
            error:function () {
                spop({template:'前台出差',style:'warning',autoclose:2000,position:'top-center'});
            }
        })
    }
</script>
<script type="text/javascript">
    $("#btn-reload").click(function () {
        window.location.href="${pageContext.request.contextPath}/reports/formsA.do";
    });
    $("#btn-warning").click(function () {
        $("#addWarning").modal('show');
    })
</script>
</body>
</html>
