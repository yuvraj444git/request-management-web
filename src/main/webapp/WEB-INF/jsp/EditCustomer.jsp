<%-- 
    Document   : EditCustomer
    Created on : Dec 15, 2019, 12:40:26 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <title>Edit Customer</title>
        <script>

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
                $(".serialnotb>tbody").append(`
                        <tr>
                            <td>
                                <input type="text" class="form-control rowPrdNameCls" name="product_name">
                                 <label class="error errRowPrdNameCls "  style="display: none">This field is required.</label>
                            </td>
                            <td>
                                <input type="text" class="form-control rowPrdModelCls" name="model_name">
                                 <label class="error errRowPrdModelCls" style="display: none">This field is required.</label>
                            </td>
                            <td><input type="text" class="form-control rowPrdSerialCls" name="serialno">
                                 <label class="error errRowPrdSerialCls" style="display: none">This field is required.</label>
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="mb-xs mt-xs mr-xs btn btn-danger" onclick="deleteRow(this)">Delete</button></td>
                        </tr>`);
            }
            function deleteRow(obj) {
                $(obj).parents("tr").remove();
            }
        </script>
    </head>
    <body>
        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Edit Customer</h2>

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


                            <h2 class="panel-title">Edit Form</h2>
                        </header>
                        <form id="insertCustomer" action="updateCustomer" class="form-horizontal form-bordered" method="post">
                            <div class="panel-body">

                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Name
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control custNameCls" name="name" value="${customerdt.name}" >
                                        <label class="error errCustNameCls" style="display: none">This field is required.</label>
                                        <input type="text" class="form-control hidden" name="id"  value="${customerdt.id}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Contact No.
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" maxlength="10" class="form-control custContactCls" name="contact_no"  value="${customerdt.contact_no}"  onkeypress="javascript:return isNumberKey(event);">
                                        <label class="error errCustContactCls" style="display: none">This field is required.</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Alt Contact No.
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" maxlength="10" class="form-control " name="alt_contact_no"  value="${customerdt.alt_contact_no}"  onkeypress="javascript:return isNumberKey(event);">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Address
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control custAddrCls" name="address"  value="${customerdt.address}">
                                        <label class="error errCustAddrCls" style="display: none">This field is required.</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Serial No.
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10 form-inline">
                                        <div class="form-inline">

                                            <table class="serialnotb table-striped table-condensed">
                                                <thead>
                                                    <tr>
                                                        <td>Product</td>
                                                        <td>Model</td>
                                                        <td>Serial</td>
                                                        <td></td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${customerserialdt}" var="ob">
                                                        <tr>
                                                            <td>
                                                                <input type="text" class="form-control rowPrdNameCls" name="oldproduct_name" value="${ob.product_name}">
                                                                <label class="error errRowPrdNameCls "  style="display: none">This field is required.</label>
                                                            </td>
                                                            <td>
                                                                <input type="text" class="form-control rowPrdModelCls" name="oldmodel_name" value="${ob.model_name}">
                                                                <label class="error errRowPrdModelCls" style="display: none">This field is required.</label>
                                                            </td>
                                                            <td>
                                                                <input type="text" class="form-control rowPrdSerialCls" name="oldserialno" value="${ob.serialno}">
                                                                <label class="error errRowPrdSerialCls" style="display: none">This field is required.</label>
                                                                <input type="text" class="form-control hidden" name="csn_id" value="${ob.id}">
                                                            </td>
                                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>

                                            &nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="mb-xs mt-xs mr-xs btn btn-info top" onclick="appendSerialNo(this)">Add</button>
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