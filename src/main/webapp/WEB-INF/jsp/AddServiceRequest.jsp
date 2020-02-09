<%-- 
    Document   : AddServiceRequest
    Created on : Dec 15, 2019, 8:36:20 PM
    Author     : ADMIN
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service Request</title>
        <!--        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">-->
        <link rel="stylesheet" href="assets/stylesheets/jquery-ui-y.css">

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <style>
            .ui-widget.ui-widget-content {
                background-color: #c6e8f5;
            }
        </style>
        <script>
            $(document).ready(function () {

                $("#btnAddSerialID").hide();
                $("#btnInsertID").click(function (e) {
                    e.preventDefault();
                    $(this).hide();
                    var date = $('.serviceDateCls').val();
                    var cust = $('.serviceCustNameCls').val();
                    var serial = $('.serviceCustSerialCls').val();
                    var isValue = true;
                    $('.errServiceDateCls').hide();
                    if (date == null || date == '') {
                        isValue = false;
                        $('.errServiceDateCls').show();
                    }

                    $('.errServiceCustNameCls').hide();
                    if (cust == null || cust == '') {
                        isValue = false;
                        $('.errServiceCustNameCls').show();
                    }

                    $('.errServiceCustSerialCls').hide();
                    if (serial == null || serial == '') {
                        isValue = false;
                        $('.errServiceCustSerialCls').show();
                    }

                    $('.rowInComponentCls').each(function () {
                        var currobj = $(this);
                        var prdname = $(currobj).parents('tr').find('.rowInComponentCls').val();
                        $(currobj).parents('tr').find('.errRowInComponentCls').hide();
                        if (prdname == null || prdname == '') {
                            isValue = false;
                            $(currobj).parents('tr').find('.errRowInComponentCls').show();
                        }
                    });
//                    alert(isValue)
                    if (isValue) {
                        $('#insertCustomer').submit();
                    } else {
                        $(this).show();
                    }

                });
            });
            function appendInward(ob) {
                $(".inwardtbCls > tbody").append(`
                    <tr>
                        <td>
                            <input type="text" name="component" class="form-control rowInComponentCls ">  
                            <label class="error errRowInComponentCls" style="display: none">Required.</label>
                        </td>
                        <td>
                          <input type="text" name="description" class="form-control  ">  
                        </td>
                        <td>
                          <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-danger" onclick="deleteRow(this)">-</button>  
                        </td>
                    </tr>        
                `);
            }

            function deleteRow(obj) {
                $(obj).parents("tr").remove();
            }

            var customers = [
            <c:forEach var="ob" items="${customersdt}">
                {id: "${ob.id}", address: `${ob.address}`, name: "${ob.name}", serialno: "${ob.allserials}", contact_no: "${ob.contact_no}"},
            </c:forEach>
            ];
            var availableTags = [];
            var mapping = {};
            $(function () {
                for (var i = 0; i < customers.length; i++) {
                    availableTags.push(customers[i].name + ' (' + customers[i].contact_no + ')');
                    mapping[customers[i].name + ' (' + customers[i].contact_no + ')' ] = customers[i];
                }
                $("input:text[id^='customerID']").on("focus.autocomplete", function () {

                    var a = $(this);
                    $(this).autocomplete({
                        source: availableTags,
                        select: function (event, ui) {
                            var data = mapping[ui.item.value];
                            var custid = data.id;
                            $(".custIdCls").val(custid);
                            $(".custAddressCls").val(data.address);
                            $(".custContactNoCls").val(data.contact_no);
                            getCustomerSerialData(custid);
                            $("#btnAddcustomer").hide();
                            $("#btnAddSerialID").show();
                        },
                        response: function (event, ui) {
                            if (!ui.content.length) {
                                var noResult = {value: "", label: "No results found"};
                                ui.content.push(noResult);
                                //$("#message").text("No results found");
                            }
                        },
                        change: function () {
                            var val = $(this).val();
                            var exists = $.inArray(val, availableTags);
                            if (exists < 0) {
                                //                                $(this).val("");
                                $("#btnAddcustomer").show();
                                $("#btnAddSerialID").hide();
                                $(".custIdCls").val('');
                                $(".custAddressCls").val('');
                                $(".custContactNoCls").val('');
                                $("#custSerialSelectID").empty();
                                $("#custSerialSelectID").append(`<option value=''>--Select Serial--</option>`);
                                return false;
                            }
                        }
                    });
                });
            });
            var serialmapping = {};
            function getCustomerSerialData(custid) {
                $.ajax({
                    url: "getAjaxCustSerials",
                    type: 'POST',
                    dataType: 'JSON',
                    data: {
                        custid: custid
                    },
                    success: function (data) {
                        $("#custSerialSelectID").empty();
                        if (data != "") {
                            serialmapping = {};
                            $('.custSerialPrdNameCls').val("");
                            $('.custSerialModelNameCls').val("");
//                            if (data.length > 1) {
                            $("#custSerialSelectID").append(`<option value=''>--Select Serial--</option>`);
//                            }
                            for (var i = 0; i < data.length; i++) {
                                $("#custSerialSelectID").append(`<option value='` + data[i].id + `'>` + data[i].serialno + `</option>`);
                                serialmapping[data[i].id] = data[i];
                            }
                        }
                    },
                    error: function (error) {
                        alert('error; ' + eval(error));
                    }
                });
            }

            function setPrdName(obj) {
                var serialid = $(obj).val();
                if (serialid != '') {
                    var data = serialmapping[serialid];
                    $('.custSerialPrdNameCls').val(data.product_name);
                    $('.custSerialModelNameCls').val(data.model_name);
                } else {
                    $('.custSerialPrdNameCls').val("");
                    $('.custSerialModelNameCls').val("");
                }
            }


            $(document).ready(function () {
                $(".serviceDateCls").datepicker(
                        {
                            dateFormat: 'dd/mm/yy'
                        }
                );
                var currentDate = new Date();
                $(".serviceDateCls").datepicker("setDate", currentDate);
            });
        </script>

        <script>
            function handler() {
                if (this.readyState == this.DONE) {
                    if (this.status == 200 && this.responseText != null) {
                        $("#somediv").text(this.responseText);
                        return;
                    }
                    console.log('Something went wrong! Status = ' + this.status);
                }
            }

            var client = new XMLHttpRequest();
            client.onreadystatechange = handler;
        </script>

        <script>
            function checkCustForModal(obj) {
                var custid = $(".custIdCls").val();
                if (custid != null && custid != "") {
                    $(".modalCustNameCls").val($("#customerID").val());
                    $("#mySerialModal").modal("show");
                } else {
                    alert('select customer');
                }
            }

            $(document).ready(function () {
                $(".btnModalSerialInsert").on('click', function (event) {
                    event.preventDefault();
                    var currBtnObj = $(this);
                    $(currBtnObj).hide();
                    var model = $(".modalModelCls").val();
                    var prdname = $(".modalPrdNameCls").val();
                    var serial = $(".modalSerialCls").val();
                    var custid = $(".custIdCls").val();
                    var isValue = true;
                    $(".errMdlSerialCls").hide();
                    if (serial == null || serial == "") {
                        isValue = false;
                        $(".errMdlSerialCls").show();
                    }
                    $(".errMdlPrdNameCls").hide();
                    if (prdname == null || prdname == "") {
                        isValue = false;
                        $(".errMdlPrdNameCls").show();
                    }
                    $(".errMdlModelCls").hide();
                    if (model == null || model == "") {
                        isValue = false;
                        $(".errMdlModelCls").show();
                    }

                    if (isValue) {

                        $.ajax({
                            url: "insertAjaxCustSerials",
                            type: 'POST',
                            dataType: 'JSON',
                            data: {
                                custid: custid,
                                model: model,
                                prdname: prdname,
                                serial: serial
                            },
                            success: function (data) {
                                if (data.result == 'inserted') {
                                    $(".serviceCustSerialCls").append(`<option value="` + data.serialid + `">` + data.serial + `</option>`);
                                }
                                $(currBtnObj).show();
                                $(".modalModelCls").val('');
                                $(".modalPrdNameCls").val('');
                                $(".modalSerialCls").val('');
                                $("#mySerialModal").modal("hide");
                            },
                            error: function (error) {
                                showNotification();
                            }
                        });
                    } else {
                        $(currBtnObj).show();
                    }

                });
            });
            function showNotification() {
                var x = document.getElementById("snackbar");
                x.className = "show";
                setTimeout(function () {
                    x.className = x.className.replace("show", "");
                }, 3000);
            }
        </script>
        <style>
            #snackbar {
                visibility: hidden;
                min-width: 250px;
                margin-left: -125px;
                background-color: #333;
                color: #fff;
                text-align: center;
                border-radius: 2px;
                padding: 16px;
                position: fixed;
                z-index: 1;
                left: 50%;
                bottom: 30px;
                font-size: 17px;
            }

            #snackbar.show {
                visibility: visible;
                -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
                animation: fadein 0.5s, fadeout 0.5s 2.5s;
            }

            @-webkit-keyframes fadein {
                from {bottom: 0; opacity: 0;} 
                to {bottom: 30px; opacity: 1;}
            }

            @keyframes fadein {
                from {bottom: 0; opacity: 0;}
                to {bottom: 30px; opacity: 1;}
            }

            @-webkit-keyframes fadeout {
                from {bottom: 30px; opacity: 1;} 
                to {bottom: 0; opacity: 0;}
            }

            @keyframes fadeout {
                from {bottom: 30px; opacity: 1;}
                to {bottom: 0; opacity: 0;}
            }
        </style>
        <script>
            var allparts = [
            <c:forEach var="obj" items="${allparts}">
                {prdtype: "${obj.prdtype}", partname: `${obj.partname}`},
            </c:forEach>
            ];
            function getPrdParts(obj) {
                var selectedval = $(obj).val();
                $(".partsTbodyCls").empty();
                for (var i = 0; i < allparts.length; i++) {
                    if (allparts[i].prdtype == selectedval) {
                        $(".partsTbodyCls").append(`
                                <tr>
                                    <td><input type="checkbox" onchange="setDisable(this)"></td>
                                    <td>
                                        <input type="text" name="component" readonly="" value="` + allparts[i].partname + `" class="form-control rowInComponentCls " disabled="">  
                                        <label class="error errRowInComponentCls" style="display: none">Required.</label>
                                    </td>
                                    <td>
                                      <input type="text" name="description" class="form-control  " disabled="">  
                                    </td>
                                    <td>
                                      
                                    </td>
                                </tr>`);
                        //<button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-danger" onclick="deleteRow(this)">-</button>  
                    }
                }
            }
            function setDisable(obj) {
                if ($(obj).prop("checked")) {
                    $(obj).parents("tr").find("input[type='text']").prop("disabled", false);
                } else {
                    $(obj).parents("tr").find("input[type='text']").prop("disabled", true);
                }
            }
        </script>
    </head>
    <body>
        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Add Service Request</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <!--                        <li>
                                                    <a href="index.html">
                                                        <i class="fa fa-home"></i>
                                                    </a>
                                                </li>
                                                <li><span>Dashboard</span></li>-->
                    </ol>

                    <!--<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>-->
                </div>
            </header>
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">


                            <h2 class="panel-title">Add Service Request</h2>
                        </header>
                        <form id="insertCustomer" action="insertServiceRequest" class="form-horizontal form-bordered" method="post">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group col-md-12">
                                            <label class="control-label">Date</label>
                                            <input type="text"  name="request_date" placeholder="Select Date" id="" class="form-control serviceDateCls ">
                                            <label class="error errServiceDateCls" style="display: none">Required.</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group col-md-12">
                                            <header class="panel-heading">
                                                <h2 class="panel-title">Customer Details</h2>
                                            </header>
                                            <label class="control-label">Customer Name</label>
                                            <input type="text" name="" placeholder="Select Name" id="customerID" class="form-control serviceCustNameCls " value="${custselected[0].name}">
                                            <label class="error errServiceCustNameCls" style="display: none">Required.</label>
                                            <a class="mb-xs mt-xs mr-xs modal-sizes btn btn-warning" id="btnAddcustomer" href="addCustomer?from=servicerequest">add</a>
                                            <div></div>
                                            <input type="text" name="cust_id" class="form-control hidden custIdCls" value="${custselected[0].id}">
                                            <!--                                        </div>
                                                                                    <div class="form-group">-->
                                            <label class="control-label">Contact No.</label>
                                            <input type="text" name="" class="form-control custContactNoCls" readonly="" value="${custselected[0].contact_no}">
                                            <label class="control-label">Address</label>
                                            <input type="text" name="" class="form-control custAddressCls" readonly="" value="${custselected[0].address}">
                                            <c:if test="${not empty custselected[0].id}"><script>getCustomerSerialData('${custselected[0].id}');</script></c:if>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group col-md-12">
                                            <header class="panel-heading">
                                                <h2 class="panel-title">Product Details</h2>
                                            </header>
                                            <label class="control-label">Serial No.</label>
                                            <select class="form-control serviceCustSerialCls" name="cust_prd_serial_id" id="custSerialSelectID" onchange="setPrdName(this)">

                                            </select>
                                            <a class="mb-xs mt-xs mr-xs modal-sizes btn btn-warning" id="btnAddSerialID" onclick="checkCustForModal(this)" href="#mySerialModal" >add serial</a>
                                            <label class="error errServiceCustSerialCls" style="display: none">Required.</label>
                                            <!--<input type="text" name="" class="form-control">-->
                                            <!--<input type="text" name="cust_prd_serial_id" placeholder="serialid" class="form-control">-->
                                            <div></div>
                                            <label class="control-label">Product Name</label>
                                            <input type="text" readonly="" name="" class="custSerialPrdNameCls form-control  ">
                                            <label class="control-label">Model Name</label>
                                            <input type="text" readonly="" name="" class="custSerialModelNameCls form-control">

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group col-md-12">
                                            <header class="panel-heading">
                                                <h2 class="panel-title">Issues Reported By Customer</h2>
                                            </header>

                                            <textarea name="issue_by_cust" rows="5" class="form-control" placeholder="Issues Reported By Customer" required=""></textarea>
                                        </div>



                                        <!--                                    </div>
                                                                            <div class="col-md-6">-->
                                        <div class="form-group col-md-12">
                                            <header class="panel-heading">
                                                <h2 class="panel-title">Condition Of Product</h2>
                                            </header>

                                            <textarea name="condtion_product" rows="5" class="form-control" placeholder="Condition Of Product" required=""></textarea>
                                        </div>

                                        <!--                                    </div>
                                        
                                                                            <div class="col-md-6">-->
                                        <div class="form-group col-md-12">
                                            <header class="panel-heading">
                                                <h2 class="panel-title">Accessories Received</h2>
                                            </header>

                                            <textarea name="accessories_recd" rows="5" class="form-control" placeholder="Accessories Received" required=""></textarea>
                                        </div>

                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group col-md-12">
                                            <header class="panel-heading">
                                                <h2 class="panel-title">Inward Check</h2>
                                            </header>

                                            <label class="control-label">Select Product Type</label>

                                            <select class="form-control " name="prdtype"  onchange="getPrdParts(this)">
                                                <option value="">--Select--</option>
                                                <option value="ios">iOS Device</option>
                                                <option value="mac">Mac Device</option>
                                                <option value="other">Other</option>
                                            </select>
                                            <br>
                                            <table class="inwardtbCls table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <td style="">&nbsp;</td>
                                                        <td style="">Component</td>
                                                        <td style="">Description</td>
                                                        <td style="">#</td>
                                                    </tr>
                                                </thead>
                                                <tbody class="partsTbodyCls">

                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td colspan="4">
                                                            <!--<button type="button" class="mb-xs mt-xs mr-xs btn btn-info" onclick="appendInward(this)">Add</button>-->
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>

                                    </div>

                                </div>



                            </div>
                            <footer class="panel-footer">
                                <div class="row">
                                    <div class="col-sm-offset-3">
                                        <button type="button" id="btnInsertID" class="btn btn-primary">Submit</button>
                                        <button action="action" onclick="window.history.go(-1);
                                                return false;" type="submit" value="Cancel" class="btn btn-default">Cancel</button>
                                    </div>
                                </div>
                            </footer>
                        </form>
                    </section>
                </div>
            </div>
        </section>

        <div id="somediv" class="" style="display: none;">
            <iframe id="thedialog" width="350" height="350"></iframe>
        </div>


        <!--start model-->
        <!-- Modal -->
        <div class="modal fade" id="mySerialModal" role="dialog">
            <div class="modal-dialog">


                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Add Serial For Customer</h4>
                    </div>
                    <form action="insertServiceTask" id="modelFormInsert">
                        <div class="modal-body">
                            <!--<p>Some text in the modal.</p>-->
                            <table>
                                <tr>
                                    <td style="padding: 10px;">Customer Name</td>
                                    <td style="padding: 10px;">:</td>
                                    <td style="padding: 10px;">
                                        <input type="text" name="" class="form-control modalCustNameCls" readonly="">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 10px;">Serial No.</td>
                                    <td style="padding: 10px;">:</td>
                                    <td style="padding: 10px;">
                                        <input type="text" name="modalserial" class="form-control modalSerialCls">
                                        <label class="error errMdlSerialCls" style="display: none">Required.</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 10px;">Product Name</td>
                                    <td style="padding: 10px;">:</td>
                                    <td style="padding: 10px;">
                                        <input type="text" name="modalPrdName" class="form-control modalPrdNameCls">
                                        <label class="error errMdlPrdNameCls" style="display: none">Required.</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 10px;">Model</td>
                                    <td style="padding: 10px;">:</td>
                                    <td style="padding: 10px;">
                                        <INPUT type="text" name="modalModel" class="form-control modalModelCls">
                                        <label class="error errMdlModelCls" style="display: none">Required.</label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer" style=" text-align: center;">
                            <button type="button" class="btn btn-primary btnModalSerialInsert" >Submit</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </form>

                </div>


            </div>
        </div> 
        <!--end model-->
        <div id="snackbar">Something went wrong..</div>
    </body>
</html>
