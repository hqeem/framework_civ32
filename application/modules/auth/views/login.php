<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="<?php echo site_url('assets/login/images/favicon.ico');?>">
    <title>Login - <?php echo $site_title; ?></title>
    <!-- Bootstrap Core CSS -->
    <link href="<?php echo site_url('assets/login/plugins/bootstrap/css/bootstrap.min.css');?>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<?php echo site_url('assets/login/css/style.css');?>" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="<?php echo site_url('assets/login/css/colors/blue.css');?>" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<!-- ============================================================== -->
<!-- Preloader - style you can find in spinners.css -->
<!-- ============================================================== -->
<div class="preloader">
    <svg class="circular" viewBox="25 25 50 50">
        <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
</div>
<!-- ============================================================== -->
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<section id="wrapper">
    <div class="login-register" style="background-image:url(<?php echo site_url('assets/images/blue_squares-wide.jpg');?>);">
        <div class="login-box card">
            <div class="card-body">
                <form class="form-horizontal form-material" method="POST" id="loginform" action="<?php echo site_url('auth/login');?>">
                    <h3 class="box-title m-b-20">Sign In</h3>
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" id="identity" name="identity" type="text" required="" placeholder="Username"> </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <input class="form-control" type="password" id="password" name="password" required="" placeholder="Password"> </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <div class="checkbox checkbox-primary pull-left p-t-0">
                                <input id="remember" name="remember" type="checkbox" value="1" >
                                <label for="checkbox-signup"> Remember me </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <input type="submit" name="submit" value="Log In"   class="btn btn-info btn-lg btn-block"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 m-t-10 text-center">
                            <div class="social"></div>
                        </div>
                    </div>
                    <div class="form-group m-b-0">
                        <div class="col-sm-12 text-center">


                                    <?php
                                        if(!empty($this->session->flashdata("message"))){
                                            ?>
                                             <div class="btn btn-danger  btn-md">
                                                <?php echo $this->session->flashdata("message"); ?>
                                             </div>
                                    <?php
                                        }
                                    ?>


                        </div>
                    </div>
                </form>


            </div>

            <div align="center">
                <p><?php echo $copyright; ?></p>
            </div>
        </div>


    </div>

</section>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="<?php echo site_url('assets/login/plugins/jquery/jquery.min.js');?>"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="<?php echo site_url('assets/login/plugins/bootstrap/js/popper.min.js');?>"></script>
<script src="<?php echo site_url('assets/login/plugins/bootstrap/js/bootstrap.min.js');?>"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="<?php echo site_url('assets/login/js/jquery.slimscroll.js');?>"></script>
<!--Wave Effects -->
<script src="<?php echo site_url('assets/login/js/waves.js');?>"></script>
<!--Menu sidebar -->
<script src="<?php echo site_url('assets/login/js/sidebarmenu.js');?>"></script>
<!--stickey kit -->
<script src="<?php echo site_url('assets/login/plugins/sticky-kit-master/dist/sticky-kit.min.js');?>"></script>
<!--Custom JavaScript -->
<script src="<?php echo site_url('assets/login/js/custom.min.js');?>"></script>
<!-- ============================================================== -->
<!-- Style switcher -->
<!-- ============================================================== -->
<script src="<?php echo site_url('assets/login/plugins/styleswitcher/jQuery.style.switcher.js');?>"></script>
</body>
</html>
