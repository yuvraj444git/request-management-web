<%-- 
    Document   : EditEmployee
    Created on : Dec 15, 2019, 4:15:24 PM
    Author     : ADMIN
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Employee</title>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script>
            $(document).ready(function () {
                $("#btnInsertID").click(function (e) {
                    e.preventDefault();
                    $(this).hide();
                    var name = $('.empNameCls').val();
                    var contactno = $('.empContactCls').val();
                    var username = $('.empUsernameCls').val();
                    var pass = $('.empPassCls').val();
                    var type = $('.empTypeCls').val();

                    var isValue = true;

                    $('.errEmpNameCls').hide();
                    if (name == null || name == '') {
                        isValue = false;
                        $('.errEmpNameCls').show();
                    }

                    $('.errEmpContactCls').hide();
                    if (contactno == null || contactno == '') {
                        isValue = false;
                        $('.errEmpContactCls').show();
                    }

                    $('.errEmpUsernameCls').hide();
                    if (username == null || username == '') {
                        isValue = false;
                        $('.errEmpUsernameCls').show();
                    }

                    $('.errEmpPassCls').hide();
                    if (pass == null || pass == '') {
                        isValue = false;
                        $('.errEmpPassCls').show();
                    }

                    $('.errEmpTypeCls').hide();
                    if (type == null || type == '') {
                        isValue = false;
                        $('.errEmpTypeCls').show();
                    }

                    if (isValue) {
                        $('#insertCustomer').submit();
                    } else {
                        $(this).show();
                    }

                });
            });
        </script>
    </head>
    <body>
        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Edit Employee</h2>

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
                        <form id="insertCustomer" action="updateEmployee" class="form-horizontal form-bordered" method="post">
                            <div class="panel-body">

                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Name
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control empNameCls" name="name" value="${userdetailsdt.name}" >
                                        <label class="error errEmpNameCls" style="display: none">Required.</label>
                                        <input type="text" class="form-control hidden" name="id" value="${userdetailsdt.id}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Contact No.
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" maxlength="10" class="form-control empContactCls" name="contact_no" value="${userdetailsdt.contact_no}"  onkeypress="javascript:return isNumberKey(event);" >
                                        <label class="error errEmpContactCls" style="display: none">Required.</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Username
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control empUsernameCls" name="username" value="${userdetailsdt.username}" >
                                        <label class="error errEmpUsernameCls" style="display: none">Required.</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Password
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control empPassCls" name="password" value="${userdetailsdt.password}" >
                                        <label class="error errEmpPassCls" style="display: none">Required.</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Type
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <select type="text" class="form-control empTypeCls" name="type">
                                            <option value="">--Select--</option>
                                            <option value="Admin" <c:if test="${userdetailsdt.type=='Admin'}">selected</c:if>>Admin</option>
                                            <option value="Engineer" <c:if test="${userdetailsdt.type=='Engineer'}">selected</c:if>>Engineer</option>
                                        </select>
                                        <label class="error errEmpTypeCls" style="display: none">Required.</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Active
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <select type="text" class="form-control " name="isactive">
                                            <option value="Y" <c:if test="${userdetailsdt.isactive=='Y'}">selected</c:if>>Activate</option>
                                            <option value="N" <c:if test="${userdetailsdt.isactive=='N'}">selected</c:if>>Deactivate</option>
                                        </select>
                                        <label class="error " style="display: none">Required.</label>
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