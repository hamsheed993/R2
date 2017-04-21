<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Candos HMS | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<%@page import="java.util.*,mu.candos.model.*" %>


<jsp:useBean id="lm" class="mu.candos.authentication.LoginManager" scope="session"/>

<%
	Boolean submitted = Boolean.parseBoolean(request.getParameter("isSubmitted"));
	
	int error = 0;
	
	if(submitted) {
		
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		
		ArrayList<Login> lgs = lm.logUser(user, pass);
		
		Login lg = new Login();
		
		for(int i=0; i< lgs.size(); i++) {
			
			lg = lgs.get(i);
			
			if(user.equals(lg.getUsername()) && pass.equals(lg.getPassword())) {
				
				session.setAttribute("uname", lg.getUsername());
				session.setAttribute("name", lg.getFname() + " " + lg.getLname());
				
				response.sendRedirect("index.jsp");
				
				return;
			}
			
			else {
				
				error = 1;
			}
		}
		
		
	}
	

%>


<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>Candos</b> Hospital Management System</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>
	
	
		<!--  Validations -->
	
		<% if(error == 1 || submitted) { %>
			<div class="alert alert-danger" role="alert">
				<span class="glyphicon glyphicon-exclamation-sign"
					aria-hidden="true"></span> <span class="sr-only">Error:</span>
				Invalid Username or Password
			</div>
			
		<% } %>
	
	
    <form action="login.jsp" method="post">
      <div class="form-group has-feedback">
        <input type="text" name="user" class="form-control" placeholder="Username">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="pass" class="form-control" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> Remember Me
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
        <input type="hidden" name="isSubmitted" value="true">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    </form>


    <!-- /.social-auth-links -->

    <a href="#">I forgot my password</a><br>
	<br> <br>
	<p> <center> <b> Enterprise Application Development Team &copy; 2016 </b> </center> </p>
	

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>

</html>
