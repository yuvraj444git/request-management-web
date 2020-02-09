<%-- 
    Document   : ViewServiceRequestGrid
    Created on : Dec 15, 2019, 8:26:59 PM
    Author     : ADMIN
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="assets/stylesheets/jquery-ui-y.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <link rel="stylesheet" type="text/css" href="assets/manual_css/cdn_1_10_20_datatables.min.css">  
        <!--<link rel="stylesheet" type="text/css" href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css">-->  
        <script type="text/javascript" charset="utf8" src="assets/manual_js/cdn_1_10_20_datatables.min.js"></script>

        <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service Request</title>
        <style>
            .fa {
                font-size: 18px !important;
            }
            .text-wrap{
                white-space:normal;
            }
            .width-200{
                width:50px;
            }
        </style>
        <script>
            $(document).ready(function () {
                $(".tbServiceCls").DataTable(
                        {
                            order: [[0, "desc"]],
                            'columnDefs': [
                                {
                                    'targets': [0],
                                    'visible': false,
                                    'searchable': false
                                }
                            ]
                        });
            });
        </script>
        <script>
            function checkStatus(obj, id) {
                var status = $(obj).text();

                if (status == 'Inprogress') {
//                    alert(status);
                    var txt;
                    var r = confirm("Confirm Outward Request?");
                    if (r == true) {
                        txt = "You pressed OK!";
                        $.ajax({
                            url: "getAjaxUpdateOutward",
                            type: 'POST',
                            dataType: 'JSON',
                            data: {
                                servicerequest: id
                            },
                            success: function (data) {
                                $("#custSerialSelectID").empty();
                                if (data != "") {
                                    $(obj).text('Outward');
                                }
                            },
                            error: function (error) {
                                alert('error; ' + eval(error));
                            }
                        });
                    } else {
                        txt = "You pressed Cancel!";
                    }
                }
            }
        </script>
        <script>
            $(document).ready(function () {
                $(".modelDateCls").datepicker(
                        {
                            dateFormat: 'dd/mm/yy'
                        }
                );
                var currentDate = new Date();
                $(".modelDateCls").datepicker("setDate", currentDate);

                $(".btnModelTaskInsert").click(function () {
                    var isvalues = true;
                    var desc = $(".modelDescCls").val();
                    var date = $(".modelDateCls").val();
                    $(".errModelDescCls").hide();
                    if (desc == null || desc == '') {
                        isvalues = false;
                        $(".errModelDescCls").show();
                    }
                    $(".errModelDateCls").hide();
//                    if (date == null || date == '') {
//                        isvalues = false;
//                        $(".errModelDateCls").show();
//                    }
                    if (isvalues) {
                        $.ajax({
                            url: "ajaxInsertServiceTask",
                            type: 'POST',
                            dataType: 'JSON',
                            data:
                                    $("#modelFormInsert").serialize()
                            ,
                            success: function (data) {
                                $(".modelDescCls").val('');
                                var currentDate = new Date();
                                $(".modelDateCls").datepicker("setDate", currentDate);
                                if (data != "") {
                                    $(".modelTaskHistory tbody").append(`<tr>
                                           <td width="20%" style="text-align:left;">` + date + `</td>
                                           <td width="50%" style="text-align:left;">` + desc + `</td>
                                           <td width="30%" style="text-align:left;">` + '${sessionScope.EMPLOYEENAME}' + `</td>
                                    </tr>`);
                                }
                            },
                            error: function (error) {
                                alert('error; ' + eval(error));
                            }
                        });
                    }
                });

            });
            function getPrevTaskInfo(serviceid) {
                $(".modelServiceIdCls").val('');
                $.ajax({
                    url: "getAjaxServicePrvTask",
                    type: 'POST',
                    dataType: 'JSON',
                    data: {
                        serviceid: serviceid
                    },
                    success: function (data) {
                        $(".modelServiceIdCls").val(serviceid);
                        $(".modelTaskHistory tbody").empty();
                        if (data != "") {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    $(".modelTaskHistory tbody").append(`<tr>
                                           <td width="20%" style="text-align:left;">` + data[i].savedate + `</td>
                                           <td width="50%" style="text-align:left;">` + data[i].task_desc + `</td>
                                           <td width="30%" style="text-align:left;">` + data[i].addedbyname + `</td>
                                    </tr>`);
                                }
                            } else {


                                $(".modelTaskHistory tbody").append('<tr><td colspan="3"  style="text-align:center;">No Records found.</td></tr>');
                            }
                        } else {
                            $(".modelTaskHistory tbody").append('<tr><td colspan="3" style="text-align:center;">No Records found.</td></tr>');
                        }
                    },
                    error: function (error) {
                        alert('error; ' + eval(error));
                    }
                });
            }
        </script>

        <script>
            function setDelete(id) {
                $(".modelDeleteServiceIdCls").val(id);
            }

            $(document).ready(function () {
                $(document).on("click", ".btnModelDelete", function (event) {
                    event.preventDefault();
                    var serviceid = $(".modelDeleteServiceIdCls").val();
                    $.ajax({
                        url: "updateAjaxDeleteServiceRequest",
                        type: 'POST',
                        dataType: 'JSON',
                        data: {
                            servicerequest: serviceid
                        },
                        success: function (data) {
                            $(".modelDeleteServiceIdCls").val('');
                            if (data != "") {
                                if (data == 'deleted') {
                                    $(".row" + serviceid + "Cls").remove();
                                    $("#deleteModal").modal("hide");
                                }
                            }
                        },
                        error: function (error) {
                            alert('error; ' + eval(error));
                        }
                    });
                });
            });
        </script>
    </head>
    <body>
        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Service Request</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <!--                        <li>
                                                    <a href="index.html">
                                                        <i class="fa fa-home"></i>
                                                    </a>
                                                </li>-->
                        <!--<li><span>Customers</span></li>-->
                    </ol>

                    <!--<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>-->
                </div>
            </header>

            <section class="panel">
                <header class="panel-heading">
                    <div class="panel-actions">
                        <button onclick="window.location.href = 'addNewServiceRequest'" type="button" class="mb-xs mt-xs mr-xs btn btn-primary">Add New</button>
                    </div>

                    <h2 class="panel-title">Service Request</h2>
                </header>
                <div class="panel-body">
                    <table class="tbServiceCls table table-bordered table-striped mb-none table-responsive" ><!--id="datatable-details"-->
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Ref-Id</th>
                                <th>Date</th>
                                <th>Customer</th>
                                <th>Contact No.</th>
                                <th>Serial No.</th>
                                <th>Replaced Serial No.</th>
                                <th>Status</th>
                                <!--<th>Amount</th>-->
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${empty servicerequestlist}">
                                <tr>
                                    <td colspan="9">
                                        No Records found.
                                    </td>
                                </tr>
                            </c:if>
                            <c:forEach var="obj" items="${servicerequestlist}">
                                <tr class="row${obj.id}Cls ">
                                    <td>${obj.id}</td>
                                    <td>${obj.ref_id}</td>
                                    <td>${obj.request_date}</td>
                                    <td>${obj.custname}</td>
                                    <td>${obj.contact_no}</td>
                                    <td>${obj.currserialno}</td>
                                    <td>${obj.serialreplaced}</td>
                                    <td>
                                        <a onclick="checkStatus(this, '${obj.id}')" >${obj.service_status}</a>

                                    </td>
                                    <!--<td>${obj.amount}</td>-->
                                    <td class="actions">
                                        <a href="editServiceRequest?id=${obj.id}" title="Edit"><i class="fa fa-pencil"></i></a>
                                        <a href="viewInwardSlip?id=${obj.id}" target="_blank" title="Inward"><i class="fa fa-download"></i></a>
                                        <a href="viewOutwardSlip?id=${obj.id}" target="_blank" title="Outward"><i class="fa fa-upload"></i></a>
                                        <a data-toggle="modal" href="#myModal" onclick="getPrevTaskInfo('${obj.id}')">Task</a>
                                        <a data-toggle="modal" href="#deleteModal" onclick="setDelete('${obj.id}')" class="delete-row deleteObjCls"><i class="fa fa-trash-o"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </section>
        </section>

        <!--start model-->
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">


                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Service Task</h4>
                    </div>
                    <form action="insertServiceTask" id="modelFormInsert">
                        <div class="modal-body">
                            <!--<p>Some text in the modal.</p>-->
                            <table>
                                <tr style="display: none;">
                                    <td style="padding: 10px;">Date</td>
                                    <td style="padding: 10px;">:</td>
                                    <td style="padding: 10px;">
                                        <input type="text" name="dateadded" class="form-control modelDateCls">
                                        <label class="error errModelDateCls" style="display: none">Required.</label>
                                        <input type="text" name="serviceid" class="form-control hidden modelServiceIdCls">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 10px;">Description</td>
                                    <td style="padding: 10px;">:</td>
                                    <td style="padding: 10px;">
                                        <textarea type="text" name="task_desc" class="form-control modelDescCls"></textarea>
                                        <label class="error errModelDescCls" style="display: none">Required.</label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer" style=" text-align: center;">
                            <button type="button" class="btn btn-primary btnModelTaskInsert" >Submit</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                    <div class="modal-footer">
                        <table class="" style="width: 100%;">
                            <thead>
                                <tr style="text-align: center;">
                                    <th width="20%">Date</th>
                                    <th width="50%">Description</th>
                                    <th width="30%">Added By</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td colspan="3">
                                        <div class="" style=" overflow:scroll;height:100px;">
                                            <table class="modelTaskHistory" style="width: 100%;">
                                                <tbody>

                                                </tbody>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>


            </div>
        </div> 
        <!--end model-->


        <!-- Modal -->
        <div class="modal fade" id="deleteModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content" style="width: 400px !important">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Delete Service Request</h4>
                    </div>
                    <form action="#" id="modelFormDelete">
                        <div class="modal-body">
                            <p>Confirm ?</p>
                            <input type="text" name="serviceid" class="form-control hidden modelDeleteServiceIdCls">
                        </div>
                        <div class="modal-footer" style=" text-align: center;">
                            <button type="button" class="btn btn-primary btnModelDelete" >Yes</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                        </div>
                    </form>
                </div>


            </div>
        </div> 
        <!--end model-->
        <!--<script src="assets/javascripts/tables/examples.datatables.row.with.details.js"></script>-->
    </body>
</html>
