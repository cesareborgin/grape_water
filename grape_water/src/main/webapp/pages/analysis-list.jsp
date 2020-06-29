<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/5/17
  Time: 17:08
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
    <title>耗能详情页</title>

    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.css">
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
                数据报表 <small>能耗分析</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="${pageContext.request.contextPath}/energy/findAll.do">数据报表</a></li>
                <li class="active">能耗分析</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <i class="fa fa-cube"></i>
                    <h3 class="box-title">列表</h3>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->
                            <div class="row">
                                <form id="queryForm" action="${pageContext.request.contextPath}/energy/getlist.do" method="post">
                                    <div class="col-xs-2">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-calendar-plus-o"></i></span>
                                            <input type="text" placeholder="开始时间" class="form-control input-sm" name="beginTime" id="beginTime">
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa  fa-calendar-plus-o"></i></span>
                                            <input type="text" placeholder="结束时间" class="form-control input-sm" name="endTime" id="endTime">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-sm" id="btn-query" >
                                        <i class="fa fa-search"></i> 查询
                                    </button>
                                    <button type="button" class="btn btn-primary btn-sm" title="新建" id="btn-add" data-toggle="modal" data-target="#addModal">
                                        <i class="fa fa-plus"></i> 新建
                                    </button>
                                    <button type="button" class="btn btn-primary btn-sm" title="删除" id="btn-del">
                                        <i class="fa fa-trash"></i> 删除
                                    </button>
                                    <button type="button" class="btn btn-primary btn-sm" title="刷新" id="refresh">
                                        <i class="fa fa-spinner"></i> 刷新
                                    </button>
                                    <button type="button" class="btn btn-primary btn-sm" title="导入" data-toggle="modal" data-target="#importExcel">
                                        <i class="fa fa-cloud-upload"></i> 导入
                                    </button>
                                    <button type="button" class="btn btn-primary btn-sm " title="导出" id="btn-export">
                                        <i class="fa fa-cloud-download"></i> 导出
                                    </button>
                                </form>
                            </div>
                        <!--工具栏/-->

                        <!--数据列表-->
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="" style="padding-right: 0px;"><input id="selall" type="checkbox" class="icheckbox_square-blue"></th>
                                <th class="sorting sm" style="font-size: 90%">表单id</th>
                                <th class="text-center sorting" style="font-size: 90%">监测时间</th>
                                <th class="text-center sorting" style="font-size: 90%">区域名称</th>
                                <th class="text-center sorting" style="font-size: 90%">责任部门编号</th>
                                <th class="text-center sorting" style="font-size: 90%">&nbsp;&nbsp;耗电量（kw.h）</th>
                                <th class="text-center sorting" style="font-size: 90%">&nbsp;&nbsp;费用（元）</th>
                                <th class="text-center sorting" style="font-size: 90%">&nbsp;&nbsp;折标准煤（kg）</th>
                                <th class="text-center sorting" style="font-size: 90%">&nbsp;&nbsp;折CO2（kg）</th>
                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>


                            <c:forEach items="${list}" var="energy">
                                <tr>
                                    <td><input name="mds" type="checkbox" value="${energy.id}"></td>
                                    <td class="sm" style="font-size: 90%">${energy.id}</td>
                                    <td class="text-center" style="font-size: 90%">${energy.energyTimeStr}</td>
                                    <td class="text-center" style="font-size: 90%">${energy.energyLocal}</td>
                                    <td class="text-center" style="font-size: 90%">${energy.energyCode}</td>
                                    <td class="text-center" style="font-size: 90%">${energy.energyElec}</td>
                                    <td class="text-center" style="font-size: 90%">${energy.energyPay}</td>
                                    <td class="text-center" style="font-size: 90%">${energy.energyCoal}</td>
                                    <td class="text-center" style="font-size: 90%">${energy.energyCO2}</td>
                                    <td class="text-center">
                                        <button onclick="editfo(${energy.id})" id="editck" class="btn bg-olive btn-xs">修改</button>
                                        <button onclick="dele(${energy.id})" class="btn bg-olive btn-xs">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:forEach items="${timelist}" var="energy">
                                <tr>
                                    <td><input name="mid" type="checkbox" value="${energy.id}"></td>
                                    <td class="sm" style="font-size: 90%">${energy.id}</td>
                                    <td class="text-center" style="font-size: 90%">${energy.energyTimeStr}</td>
                                    <td class="text-center" style="font-size: 90%">${energy.energyLocal}</td>
                                    <td class="text-center" style="font-size: 90%">${energy.energyCode}</td>
                                    <td class="text-center" style="font-size: 90%">${energy.energyElec}</td>
                                    <td class="text-center" style="font-size: 90%">${energy.energyPay}</td>
                                    <td class="text-center" style="font-size: 90%">${energy.energyCoal}</td>
                                    <td class="text-center" style="font-size: 90%">${energy.energyCO2}</td>
                                    <td class="text-center">
                                    <td class="text-center">
                                        <button onclick="editfo(${energy.id})" id="editck2" class="btn bg-olive btn-xs">修改</button>
                                        <button onclick="dele(${energy.id})" class="btn bg-olive btn-xs">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!--数据列表/-->

                        <!--工具栏-->
                        <!-- 导入文件框-->
                        <div id="importExcel" class="modal fade" role="dialog" name="importExcel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title"><b>文件导入</b></h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="box-body">
                                            <button type="button" class="btn btn-primary" id="btn-model" onclick="location.href='${pageContext.request.contextPath}/energy/downloadModal.do'">
                                                <i class="fa fa-cloud-download"></i>下载模板
                                            </button>
                                            <h2></h2>
                                            <form role="form"  enctype="multipart/form-data" method="post" id="import">
                                                <div class="form-group">
                                                    <label for="InputFile">文件写入：</label>
                                                    <h3></h3>
                                                    <input style="color: #00CD00" type="file" id="inputFile" name="inputFile">
                                                </div>
                                                <!-- /.box-body -->
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <div class="box-footer">
                                            <button type="button" class="btn btn-primary btn-lg" id="btn-in">提交</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                        </div>
                        <!--导入文件框-->
                        <!--导入窗口-->
                        <!--添加数据框-->
                        <div class="modal fade" role="dialog" id="addModal" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">
                                            <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                        </button>
                                        <h4 class="modal-title">新建能耗信息</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal" id="addEnergy" method="post">
                                            <div class="form-group">
                                                <label for="energyTime" class="col-sm-3 control-label">监测时间:</label>
                                                <div class="col-sm-9">
                                                    <input name="energyTime" type="text" class="form-control" id="energyTime" placeholder="监测时间"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="energyLocal" class="col-sm-3 control-label">区域名称:</label>
                                                <div class="col-sm-9">
                                                   <select class="form-control select2" style="width: 100%" name="energyLocal" id="energyLocal">
                                                       <option value="">全部区域</option>
                                                       <c:forEach items="${areaList}" var="areas">
                                                           <option value="${areas.enLocal}">${areas.enLocal}</option>
                                                       </c:forEach>
                                                   </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="energyCode" class="col-sm-3 control-label">责任部门:</label>
                                                <div class="col-sm-9">
                                                    <select class="form-control select2" style="width: 100%" name="energyCode" id="energyCode">
                                                        <option value="">全部部门</option>
                                                        <c:forEach items="${departList}" var="departments">
                                                            <option value="${departments.energyCode}">${departments.departName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="energyElec" class="col-sm-3 control-label">实时耗电量（kw.h）:</label>
                                                <div class="col-sm-9">
                                                    <input name="energyElec" type="text" class="form-control" id="energyElec" placeholder="实时耗电量"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="energyElec" class="col-sm-3 control-label">费用（元）:</label>
                                                <div class="col-sm-9">
                                                    <input name="energyPay" type="text" class="form-control" id="energyPay" placeholder="费用（元）"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="energyCoal" class="col-sm-3 control-label">折标准煤（kg）:</label>
                                                <div class="col-sm-9">
                                                    <input name="energyCoal" type="text" class="form-control" id="energyCoal" placeholder="折标准煤（kg）"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="energyCO2" class="col-sm-3 control-label">折CO2（kg）:</label>
                                                <div class="col-sm-9">
                                                    <input name="energyCO2" type="text" class="form-control" id="energyCO2" placeholder="折CO2（kg）"/>
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
                        <!--添加能耗信息框-->
                        <!--删除--弹框-->
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
                                        <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                        <button type="button" id="delyes_btn1" class="btn btn-primary"
                                                data-dismiss="modal">确认</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--删除弹框-->

                        <!--导出-弹框-->
                        <div class="modal inmodal fade" id="export" tabindex="-1"
                             role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">
                                            <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                        </button>
                                        <h4 class="modal-title">确认导出</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>
                                            <strong>注意！</strong> 是否确定导出数据？
                                        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                        <button type="button" id="export-btn" class="btn btn-primary"
                                                data-dismiss="modal">确认</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--导出弹框-->

                        <!-- 编辑模态框（Modal） -->
                        <div class="modal fade" role="dialog" id="editModal" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">
                                            <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                        </button>
                                        <h4 class="modal-title">编辑能耗信息</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal" name="editEnergy" id="editEnergy" method="post">
                                            <div class="form-group">
                                                <label for="enid" class="col-sm-3 control-label">能耗表ID:</label>
                                                <div class="col-sm-9">
                                                    <input name="id" type="text" class="form-control" id="enid" placeholder="能耗表ID" value=""/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="entime" class="col-sm-3 control-label">监测时间:</label>
                                                <div class="col-sm-9">
                                                    <input name="energyTime" type="text" class="form-control" id="entime" placeholder="监测时间" value=""/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="energyLocal" class="col-sm-3 control-label">区域名称:</label>
                                                <div class="col-sm-9">
                                                    <input name="energyLocal" type="text" class="form-control" id="enlocal" placeholder="监测区域" value=""/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="energyCode" class="col-sm-3 control-label">责任部门编码:</label>
                                                <div class="col-sm-9">
                                                    <input name="energyCode" type="text" class="form-control" id="encode" placeholder="责任部门编码" value=""/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="energyElec" class="col-sm-3 control-label">实时耗电量（kw.h）:</label>
                                                <div class="col-sm-9">
                                                    <input name="energyElec" type="text" class="form-control" id="enelec" placeholder="实时耗电量" value=""/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="enpay" class="col-sm-3 control-label">费用（元）:</label>
                                                <div class="col-sm-9">
                                                    <input name="energyPay" type="text" class="form-control" id="enpay" placeholder="费用（元）" value=""/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="energyCoal" class="col-sm-3 control-label">折标准煤（kg）:</label>
                                                <div class="col-sm-9">
                                                    <input name="energyCoal" type="text" class="form-control" id="encoal" placeholder="折标准煤（kg）" value=""/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="energyCO2" class="col-sm-3 control-label">折CO2（kg）:</label>
                                                <div class="col-sm-9">
                                                    <input name="energyCO2" type="text" class="form-control" id="enco2" placeholder="折CO2（kg）"value=""/>
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
                        <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="del-modal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">确认删除</h4>
                                    </div>
                                    <div class="modal-body">
                                        <h4 style="color: deepskyblue">是否确定删除数据？</h4>
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
                        <!--工具栏/-->


                    </div>
                    <!-- 数据表格 /-->


                </div>
                <!-- /.box-body -->

                <!-- .box-footer-->
                <div class="box-footer">
                    <div class="pull-left">
                        <div class="form-group form-inline">
                            总共<span>${pageInfo.pages }</span>  页，共<span>${pageInfo.total } </span>条数据。 每页
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
                                <option value="12">13</option>
                                <option value="12">14</option>
                                <option value="12">15</option>
                                <option value="12">16</option>
                            </select> 条
                        </div>
                    </div>

                    <div class="box-tools pull-right">
                        <ul class="pagination">
                            <li>
                                <a href="${pageContext.request.contextPath}/energy/findAll.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/energy/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                <li><a href="${pageContext.request.contextPath}/energy/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                            </c:forEach>
                            <li><a href="${pageContext.request.contextPath}/energy/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                            <li>
                                <a href="${pageContext.request.contextPath}/energy/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
                            </li>
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
    function changePageSize() {
        //获取下拉框的值
        var pageSize = $("#changePageSize").val();

        //向服务器发送请求，改变没页显示条数
        window.location.href = "${pageContext.request.contextPath}/energy/findAll.do?page=1&size="
            + pageSize;
    }
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
    $(document).ready(function() {
        $('#datepicker-a1').datetimepicker({
            format : "yyyy-mm-dd hh:ii",
            autoclose : true,
            todayBtn : true,
            language : "zh-CN"
        });
        $('#entime').datetimepicker({
            format : "yyyy-mm-dd hh:ii",
            autoclose : true,
            todayBtn : true,
            language : "zh-CN"
        });
        $('#beginTime').datetimepicker({
            format : "yyyy-mm-dd hh:ii",
            autoclose : true,
            todayBtn : true,
            language : "zh-CN"
        });
        $('#endTime').datetimepicker({
            format : "yyyy-mm-dd hh:ii",
            autoclose : true,
            todayBtn : true,
            language : "zh-CN"
        });
        $('#energyTime').datetimepicker({
            format : "yyyy-mm-dd hh:ii",
            autoclose : true,
            todayBtn : true,
            language : "zh-CN"
        });
    });
</script>
<script type="text/javascript">
    var areasList = ${areasJson};

    $(function () {
        $('#editEnergy').bootstrapValidator({
            live:'enabled',
            message: 'This value is not valid',
            //提供输入验证图标提示
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields:{
                id:{
                    massage:'表单ID验证失败!',
                    validators:{
                        notEmpty:{
                            message:'ID不能为空'
                        },
                        digits:{
                            message:'ID必须为整型'
                        }
                    }
                },
                energyTime:{
                    validators:{
                        notEmpty:{
                            message:'监测时间不能为空'
                        }
                    }
                },
                energyLocal:{
                    validators:{
                        notEmpty:{
                            message:'区域名称不能为空'
                        }
                    }
                },
                energyCode:{
                    validators:{
                        notEmpty:{
                            message:'区域代码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 20,
                            message: '区域长度必须在6到12位之间'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '区域码只能包含大写、小写、数字和下划线'
                        }
                    }
                },
                energyElec:{
                    validators:{
                        notEmpty:{
                            message:'输入不能为空'
                        },
                        numeric:{
                            message:'耗能值保留两位'
                        }
                    }
                },
                energyPay:{
                    validators:{
                        notEmpty:{
                            message:'输入不能为空'
                        },
                        numeric:{
                            message:'费用值保留两位'
                        }
                    }
                },
                energyCoal:{
                    validators:{
                        notEmpty:{
                            message:'输入不能为空'
                        },
                        numeric:{
                            message:'折碳值保留两位'
                        }
                    }
                },
                energyCO2:{
                    validators:{
                        notEmpty:{
                            message:'输入不能为空'
                        },
                        numeric:{
                            message:'折CO2值保留两位'
                        }
                    }
                }
            }

        });
    });
    $("body").on('click','#edit',function () {
        $('#editEnergy').bootstrapValidator('validate');
        var flag = $("#editEnergy").data('bootstrapValidator').isValid();
        if(!flag){
            toastr.error("填写有误，请重新填写！",{timeOut:1000});
            return;
        }else {
            var data = $("#editEnergy").serialize();
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/energy/edit.do",
                data:data,
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
    });
    $("#reset").click(function () {
        $("#addEnergy").data('bootstrapValidator').resetForm(true);
    })
</script>
<script type="text/javascript">
    function add() {

        $.ajax({
            type:"POST",
            dataType:"json",
            url:"${pageContext.request.contextPath}/energy/addEnergy.do",
            data:$('#addEnergy').serialize(),
            success:function (data) {
                if(data.type=="success"){
                    spop({template:data.msg,style:'success',autoclose:2000,position:'top-center'});
                    $("#addModal").modal('hide');
                }else if(data.type=="error"){
                    spop({template:data.msg,style:'error',autoclose:2000,position:'top-center'});
                    return false;
                }
            }
        });
    }
    function dele(id) {
        $("#del").modal('show');
        energyid = id;
    }
    $("#dataList tbody").on("click","#editck",function () {
        var row = $("table#dataList tr").index($(this).closest("tr"));
        var enId = $("table#dataList").find("tr").eq(row).find("td").eq(1).text();
        var enTime = $("table#dataList").find("tr").eq(row).find("td").eq(2).text();
        var enLocal = $("table#dataList").find("tr").eq(row).find("td").eq(3).text();
        var enCode = $("table#dataList").find("tr").eq(row).find("td").eq(4).text();
        var enElec = $("table#dataList").find("tr").eq(row).find("td").eq(5).text();
        var enPay = $("table#dataList").find("tr").eq(row).find("td").eq(6).text();
        var enCoal = $("table#dataList").find("tr").eq(row).find("td").eq(7).text();
        var enCO2 = $("table#dataList").find("tr").eq(row).find("td").eq(8).text();
        $("#enid").val(enId);
        $("#entime").val(enTime);
        $("#enlocal").val(enLocal);
        $("#encode").val(enCode);
        $("#enelec").val(enElec);
        $("#enpay").val(enPay);
        $("#encoal").val(enCoal);
        $("#enco2").val(enCO2);
        $("#editModal").modal('show');
    });
    $("#dataList tbody").on("click","#editck2",function () {
        var row = $("table#dataList tr").index($(this).closest("tr"));
        var enId = $("table#dataList").find("tr").eq(row).find("td").eq(1).text();
        var enTime = $("table#dataList").find("tr").eq(row).find("td").eq(2).text();
        var enLocal = $("table#dataList").find("tr").eq(row).find("td").eq(3).text();
        var enCode = $("table#dataList").find("tr").eq(row).find("td").eq(4).text();
        var enElec = $("table#dataList").find("tr").eq(row).find("td").eq(5).text();
        var enPay = $("table#dataList").find("tr").eq(row).find("td").eq(6).text();
        var enCoal = $("table#dataList").find("tr").eq(row).find("td").eq(7).text();
        var enCO2 = $("table#dataList").find("tr").eq(row).find("td").eq(8).text();
        $("#enid").val(enId);
        $("#entime").val(enTime);
        $("#enlocal").val(enLocal);
        $("#encode").val(enCode);
        $("#enelec").val(enElec);
        $("#enpay").val(enPay);
        $("#encoal").val(enCoal);
        $("#enco2").val(enCO2);
        $("#editModal").modal('show');
    });
    $("#delyes_btn1").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/energy/deleteById.do",
            dataType:"JSON",
            data:{"id":energyid},
            success:function (data) {
                if(data.type=="success"){
                    spop({template:'删除成功',style:'success',position:'top-center',autoclose:2000});
                    $("#del").modal('hide');
                    //这个是让提示信息加载完消失之后在执行的刷新
                }else {
                    $("#dataList").dataTable("uncheckAll");
                    spop({template:data.msg,style:'error',position:'top-center',autoclose:2000});
                }
            }

        })
    });
</script>
<script type="text/javascript">
    $("#btn-export").click(function () {
        $("#export").modal('show');
    });
    $("#export-btn").click(function () {
        window.location.href="${pageContext.request.contextPath}/energy/outExcel.do";
        spop({template:'导出成功',style:'success',position:'top-center',autoclose:2000});
        $("#export").modal('hide');
    });

    $("#btn-in").click(function () {
        var inputFile = $("#inputFile").val();
        var formData = new FormData($("#import")[0]);
        formData.append("inputFile",inputFile);
        $.ajax({
            url:"${pageContext.request.contextPath}/energy/importExcel.do",
            data:formData,
            type:"POST",
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success:function (data) {
                if(data.type=="success"){
                    spop({template:'导入成功',style:'success',position:'top-center',autoclose:2000});
                    $("#importExcel").modal('hide');
                }else if(data.type=="error"){
                    spop({template:data.msg,style:'warning',position:'top-center',autoclose:2000});
                }else {
                    spop({template:'上传失败！',style:'error',position:'top-center',autoclose:2000}) ;
                }
            }
        });
    });
    $("#refresh").click(function () {
        window.location.href="${pageContext.request.contextPath}/energy/findAll.do";
    });
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
                url:"${pageContext.request.contextPath}/energy/delete.do",
                success:function (response) {
                    if(response.type=="success"){
                        window.location.href="${pageContext.request.contextPath}/energy/findAll.do";
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
