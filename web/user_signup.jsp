<%@page import="Logic.info"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Signup</title>

        <!-- Google Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <%
            String utype = "";
            if (session.getAttribute("utype") != null) {
                utype = session.getAttribute("utype").toString();

            }


        %>
        <%
            String msg = "", user = "";
            if (session.getAttribute("msg") != null) {
                msg = session.getAttribute("msg").toString();
            } else {
                msg = "";
            }

            if (request.getAttribute("user") != null) {
                user = request.getAttribute("user").toString();
            } else {
                user = "";
            }
        %>
        <script language="javascript">
            function validate(){
//                var fname=document.getElementById("fname").value;
//                var mname=document.getElementById("mname").value;
//                var lname=document.getElementById("lname").value;
//                var usn=document.getElementById("usn").value;
//                var email=document.getElementById("email").value;
                var pass=document.getElementById("password").value;
                var cpass=document.getElementById("cpassword").value;
       
//        
//                if(fname.length==0)
//                {
//                    alert("Enter First name");
//                    return false;
//                }
//            
//                if(lname.length==0)
//                {
//                    alert("Enter Last name");
//                    return false;
//                }
//                if(usn.length==0)
//                {
//                    alert("Enter USN");
//                    return false;
//                }
//                if(email.length==0)
//                {
//                    alert("Enter Last Email ID");
//                    return false;
//                }
                if(pass.length==0)
                {
                    alert("Enter password");
                    return false;
                } if(pass.length<10)
                {
                    alert("password must be greater than or equal to 10 ");
                    return false;
                }
             
                if(cpass.length==0)
                {
                    alert("Confirm password");
                    return false;
                }   
        
                if(pass!=cpass)
                {
                     
                    alert("Passwords are not matching!!");
                    document.getElementById("password").value="";
                    document.getElementById("cpassword").focus;
                    return false;     
                }
    
            }
        </script>

        <div class="site-branding-area">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="logo">
                            <h1><a href="index.jsp"><span><%=info.pname%></span></a></h1>
                            
                        </div>
                    </div>


                </div>
            </div>
        </div> <!-- End site branding area -->

        <div class="mainmenu-area">
            <div class="container">
                <div class="row">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div> 
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                           <li ><a href="index.jsp">Home</a></li>
                            <li class="active"><a href="user_signup.jsp">User Signup</a></li>
                           
                            <li><a href="Login.jsp">Login</a></li>
                        </ul>
                    </div>  
                </div>
            </div>
        </div> <!-- End mainmenu area -->

        <div class="product-big-title-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-bit-title text-center">
                            <h2>User Signup</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="single-product-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">


                    <div class="col-md-8">
                        <div class="product-content-right">
                            <div class="woocommerce">

                                <center><h4><%=msg%></h4><% session.removeAttribute("msg");%></center>
                                <table align="center" width="1015">
                                    <tr>
                                        <td width="364" valign="top">

                                        </td>
                                        <td width="639" valign="top">
                                            <table align="center" width="600">


                                                <tr>
                                                    <td class="paragraping1" align="justify">
                                                        <%
                                                            int i = 0;
                                                        %>

                                                        <form action="./add_user"  method="post"  onsubmit="return validate();" >
                                                            <table >

                                                                
                                                               
                                                                <tr>
                                                                    <td>
                                                                        Name:
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="name" id="name" style="width: 200px" pattern="^[A-Za-z -]+$" required/>
                                                                    </td>
                                                                </tr>
                                                                 
                                                                 <tr>
                                                                    <td>
                                                                        Email:
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="email" id="email" style="width: 200px" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required/>
                                                                    </td>
                                                                </tr>
                                                                
                                                                 <tr>
                                                                    <td>
                                                                        Mobile:
                                                                    </td>
                                                                    <td>
                                                                        <input type="number" name="mobile" id="mobile" style="width: 200px" pattern="[6789][0-9]{9}" required/>
                                                                    </td>
                                                                </tr>
                                                                
                                                                
                                                               
                                                               
                                                                <tr>
                                                                    <td>Date of Birth:</td>
                                                                    <td>
                                                                <input type="date" name="dob" id="dob" style="width: 200px"/>
                                                                    </td>  
                                                                </tr> 
                                                               
                                                                <tr>
                                                                    <td>Gender</td>
                                                                    <td>
                                                                        
                                                                        <select name="gender">
                                                                            <option value="Select">Select</option>
                                                                            <option value="Male">Male</option>
                                                                            <option value="Female">Female</option>
                                                                        
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                                <!--<tr>-->
                                                                    <!--<td>Address</td>-->
                                                                    <!--<td>-->
                                                                        <!--<textarea name="address">-->
                                                                            
                                                                        <!--</textarea>-->
                                                                    <!--</td>-->
                                                                <!--</tr>-->
                                                               
                                                                <tr>
                                                                    <td>
                                                                        Password:
                                                                    </td>
                                                                    <td>
                                                                        <input type="password" name="password" id="password" style="width: 200px" required pattern="(?=^.{8,}$)(?=.*\d)(?=.*\W+)(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                       Confirm Password:
                                                                    </td>
                                                                    <td>
                                                                        <input type="password" name="cpassword" id="cpassword" style="width: 200px" required/>
                                                                    </td>
                                                                </tr>
                                                               
                                                              
                                                                

                                                                
                                                              
                                                               
                                                               
                                                              
                                                                <tr>
                                                                <td></td>
                                                                <td>
                                                                    <input type="submit" name="submit" value="Signup"/>
                                                                </td>
                                                                </tr>
                                                            </table>            
                                                        </form>




                                                    </td>
                                                </tr>

                                            </table>

                                            </div>                       
                                            </div>                    
                                            </div>
                                            </div>
                                            </div>
                                            </div>


                                           
                                             <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="copyright">
                             <p>&copy; <%=info.year%>. <%=info.pname%></p>
                        </div>
                    </div>

                    
                </div>
            </div>
        </div>

                                            <!-- Latest jQuery form server -->
                                            <script src="https://code.jquery.com/jquery.min.js"></script>

                                            <!-- Bootstrap JS form CDN -->
                                            <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

                                            <!-- jQuery sticky menu -->
                                            <script src="js/owl.carousel.min.js"></script>
                                            <script src="js/jquery.sticky.js"></script>

                                            <!-- jQuery easing -->
                                            <script src="js/jquery.easing.1.3.min.js"></script>

                                            <!-- Main Script -->
                                            <script src="js/main.js"></script>
                                            </body>
                                            </html>