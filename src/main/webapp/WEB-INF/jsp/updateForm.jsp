<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="icon" href="sitecon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="sitecon.ico" type="image/x-icon" />
        <link href="css/style.css" rel="stylesheet" type="text/css"/>        
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <title>Update form</title>
        <style>
            .error{
                color: red;
            }

            body {
                background-image: url('../img/bg2.png');
            }
        </style>
    </head>
    <body>

        <div class="container mt-5 ">

            <div class="row">


                <div class ="col-3"></div>

                <div class="col-6 mt-5">



                    <h1 class="text-center">Update User</h1>


                    <form:form method="POST" action="/updateUser/${user.id}" modelAttribute="user" name="registration">
                        <div class="form-group">
                            <form:label path="firstname">First Name</form:label>  
                            <form:input path="firstname"  class="form-control" placeholder = "${user.firstname}" />
                            <form:errors class="error" path="firstname"/>
                        </div>
                        <div class="form-group">
                            <form:label path="lastname">Last Name</form:label>
                            <form:input path="lastname"  class="form-control"  placeholder = "${user.lastname}" />
                            <form:errors class="error" path="lastname"/>
                        </div>
                        <div class="form-group">
                            <form:label path="username">Username</form:label>
                            <form:input path="username"  class="form-control" id="userName"  placeholder = "${user.username}" />
                            <form:errors class="error" path="username"/>
                        </div>
                        <div class="form-group">
                            <form:label path="email">Email</form:label>
                            <form:input path="email"  class="form-control" placeholder = "${user.email}" />
                            <form:errors class="error" path="email"/>
                        </div>
                        <div class="form-group">
                            <form:label path="balance">Balance</form:label>
                            <form:input path="balance"  class="form-control" placeholder = "${user.balance}" />
                            <form:errors class="error" path="balance"/>
                        </div>
                        <div class="form-group">
                            <form:label path="dateofbirth">Date of birth</form:label>
                            <form:input type="text" id="Date" class="form-control" path="dateofbirth" />
                            <form:errors class="error" path="dateofbirth"/>


                            <form:input type="hidden" path="password" value = "${user.password}" /><br>
                        </div>



                        <div class="form-group">
                            <form:select path="roleID" id="rolesList" class="form-control" >  
                                <form:options items="${allRoles}"  itemLabel="roleName" path="roleID"/>
                            </form:select>
                        </div>

                        <div class="text-center">
                            <input type="submit" class="btn btn-danger btn-lg "value="Submit" />
                        </div>
                    </form:form>
                </div>
                <div class="col-3"></div>
            </div>
        </div>



        <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
        <script>

            var userNameField = document.getElementById("userName");

            $(document).ready(function () {

                $(function () {
                    $("#Date").datepicker({
                        maxDate: "-18y",
                        minDate: new Date(1930, 6, 31)
                    });
                });
                $(function () {

                    jQuery.validator.addMethod("lettersonly", function (value, element) {
                        return this.optional(element) || /^[a-z]+$/i.test(value);
                    });


                    $("form[name='registration']").validate({

                        rules: {
                            firstname: {
                                required: true,
                                lettersonly: true
                            },
                            lastname: {
                                required: true,
                                lettersonly: true
                            },
                            username: "required",
                            email: {
                                required: true,
                                email: true
                            },
                            dateofbirth: "required",
                            balance: {
                                required: true,
                                digits: true
                            }
                        },
                        messages: {
                            firstname: {
                                required: "Please enter a firstname",
                                lettersonly: "Letters only please"
                            },
                            lastname: {
                                required: "Please enter a lastname",
                                lettersonly: "Letters only please"
                            },
                            username: "Please enter a username",
                            email: "Please enter a valid email address",
                            dateofbirth: "Please enter a valid date of birth",
                            balance: {
                                required: "Please enter an amount",
                                digits: "Digits only"
                            }
                        },

                        submitHandler: function (form) {
                            form.submit();
                        }
                    });
                });



                if (userNameField.value.toLowerCase() === "admin") {


                    userNameField.readOnly = true;
                    userNameField.style.cursor = "no-drop";
                    var roles = document.getElementById("rolesList").getElementsByTagName("option");
                    for (var i = 1; i < roles.length; i++) {

                        roles[i].disabled = true;
                    }
                }
            });
        </script>
    </body>
</html>
