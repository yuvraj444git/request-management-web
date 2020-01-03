<%-- 
    Document   : AddEmployee
    Created on : Dec 15, 2019, 4:15:10 PM
    Author     : ADMIN
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Employee</title>
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
                    var active = $('.empActiveCls').val();

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

                    $('.errEmpActiveCls').hide();
                    if (active == null || active == '') {
                        isValue = false;
                        $('.errEmpActiveCls').show();
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
                <h2>Add Employee</h2>

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
                        <form id="insertCustomer" action="insertEmployee" class="form-horizontal form-bordered" method="post">
                            <div class="panel-body">

                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Name
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control empNameCls" name="name" >
                                        <label class="error errEmpNameCls" style="display: none">Required.</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Contact No.
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" maxlength="10" class="form-control empContactCls" name="contact_no"  onkeypress="javascript:return isNumberKey(event);">
                                        <label class="error errEmpContactCls" style="display: none">Required.</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Username
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control empUsernameCls" name="username">
                                        <label class="error errEmpUsernameCls" style="display: none">Required.</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label" >
                                        Password
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control empPassCls" name="password">
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
                                            <option value="Admin">Admin</option>
                                            <option value="Engineer">Engineer</option>
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
                                        <select type="text" class="form-control empActiveCls" name="isactive">
                                            <option value="">--Select--</option>
                                            <option value="Y">Activate</option>
                                            <option value="N">Deactivate</option>
                                        </select>
                                        <label class="error errEmpActiveCls" style="display: none">Required.</label>
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