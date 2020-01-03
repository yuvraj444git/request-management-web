<%-- 
    Document   : AddCustomer
    Created on : Dec 14, 2019, 7:57:59 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Customer</title>
        <script>
            function deleteRow(obj) {
                $(obj).parents("tr").remove();
            }

            $(document).ready(function () {
                $("#btnInsertID").click(function (e) {
                    e.preventDefault();
                    $(this).hide();
                    var name = $('.custNameCls').val();

                    var contactno = $('.custContactCls').val();
                    var address = $('.custAddrCls').val();
                    var isValue = true;
                    $('.errCustNameCls').hide();
                    if (name == null || name == '') {
                        isValue = false;
                        $('.errCustNameCls').show();
                    }

                    $('.errCustContactCls').hide();
                    if (contactno == null || contactno == '') {
                        isValue = false;
                        $('.errCustContactCls').show();
                    }

                    $('.errCustAddrCls').hide();
                    if (address == null || address == '') {
                        isValue = false;
                        $('.errCustAddrCls').show();
                    }

                    $('.rowPrdSerialCls').each(function () {
                        var currobj = $(this);
                        var prdname = $(this).parents('tr').find('.rowPrdNameCls').val();
                        var modelname = $(this).parents('tr').find('.rowPrdModelCls').val();
                        var serialno = $(this).parents('tr').find('.rowPrdSerialCls').val();

                        $(currobj).parents('tr').find('.errRowPrdNameCls').hide();
                        if (prdname == null || prdname == '') {
                            isValue = false;
                            $(currobj).parents('tr').find('.errRowPrdNameCls').show();
                        }
                        $(currobj).parents('tr').find('.errRowPrdModelCls').hide();
                        if (modelname == null || modelname == '') {
                            isValue = false;
                            $(currobj).parents('tr').find('.errRowPrdModelCls').show();
                        }
                        $(currobj).parents('tr').find('.errRowPrdSerialCls').hide();
                        if (serialno == null || serialno == '') {
                            isValue = false;
                            $(currobj).parents('tr').find('.errRowPrdSerialCls').show();
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


            function appendSerialNo(obj) {
                $(obj).parents(".serialnotb > tbody").append(`
                        <tr>
                            <td>
                                 <input type="text" class="form-control rowPrdNameCls" name="product_name">
                                 <label class="error errRowPrdNameCls "  style="display: none">This field is required.</label>
                             </td>
                             <td>
                                 <input type="text" class="form-control rowPrdModelCls" name="model_name">
                                 <label class="error errRowPrdModelCls" style="display: none">This field is required.</label>
                             </td>
                             <td>
                                 <input type="text" class="form-control rowPrdSerialCls" name="serialno">
                                 <label class="error errRowPrdSerialCls" style="display: none">This field is required.</label>
                             </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="mb-xs mt-xs mr-xs btn btn-danger" onclick="deleteRow(this)">Delete</button></td>
                        </tr>`);
            }
        </script>

    </head>
    <body>
        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Add Customer</h2>

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


                            <h2 class="panel-title">Add Form</h2>
                        </header>
                        <form id="insertCustomer" action="insertCustomer" class="form-horizontal form-bordered" method="post">
                            <div class="panel-body">

                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Name
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" maxlength="100" class="form-control custNameCls" name="name" >
                                        <label class="error errCustNameCls" style="display: none">This field is required.</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Contact No.
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" maxlength="10" class="form-control custContactCls" name="contact_no"  onkeypress="javascript:return isNumberKey(event);">
                                        <label class="error errCustContactCls" style="display: none">This field is required.</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Alt Contact No.
                                        <span class="required"></span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" maxlength="10" class="form-control" name="alt_contact_no"  onkeypress="javascript:return isNumberKey(event);">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Address
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control custAddrCls" name="address">
                                        <label class="error errCustAddrCls" style="display: none">This field is required.</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Serial No.
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10 form-inline">
                                        <table class="serialnotb table-striped">
                                            <thead>
                                                <tr>
                                                    <td>Product</td>
                                                    <td>Model</td>
                                                    <td>Serial</td>
                                                    <td></td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <input type="text" class="form-control rowPrdNameCls" name="product_name">
                                                        <label class="error errRowPrdNameCls "  style="display: none">This field is required.</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control rowPrdModelCls" name="model_name">
                                                        <label class="error errRowPrdModelCls" style="display: none">This field is required.</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control rowPrdSerialCls" name="serialno">
                                                        <label class="error errRowPrdSerialCls" style="display: none">This field is required.</label>
                                                    </td>
                                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="mb-xs mt-xs mr-xs btn btn-info" onclick="appendSerialNo(this)">Add</button></td>
                                                </tr>
                                            </tbody>
                                        </table>



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
    </body>
</html>
