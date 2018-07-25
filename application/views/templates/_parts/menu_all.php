<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<!-- sidebar menu -->
<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
    <div class="menu_section">

        <?php echo  $menu_user_data; ?>


    </div>

</div>
<!-- /sidebar menu -->

<!-- /menu footer buttons -->
<div class="sidebar-footer hidden-small">
    <a data-toggle="tooltip" data-placement="top" title="Settings">
        <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
    </a>
    <a data-toggle="tooltip" data-placement="top" title="FullScreen">
        <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
    </a>
    <a data-toggle="tooltip" data-placement="top" title="Lock">
        <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
    </a>
    <a data-toggle="tooltip" data-placement="top" title="Logout" href="<?php echo site_url('auth/logout');?>">
        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
    </a>
</div>
<!-- /menu footer buttons -->
</div>
</div>

<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <li class="">
                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <img src="<?php echo site_url('assets/images/img.jpg');?>" alt=""><?php echo $firstname_auth." ".$lastname_auth; ?>
                        <span class=" fa fa-angle-down"></span>
                    </a>

                    <?php
                    if($this->ion_auth->in_group('admin'))
                    {
                        ?>

                        <ul class="dropdown-menu dropdown-usermenu pull-right">
                            <li><a href="<?php echo site_url('user/profile');?>"> Profile</a></li>
                            <li><a href="<?php echo site_url('user/user_group');?>">Users/Group</a></li>
                            <li><a href="<?php echo site_url('menu/menu_manager');?>">Menu Manager</a></li>
                            <li><a href="<?php echo site_url('auth/logout');?>"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                        </ul>

                    <?php
                    }else{
                        ?>

                        <ul class="dropdown-menu dropdown-usermenu pull-right">
                            <li><a href="<?php echo site_url('user/profile');?>"> Profile</a></li>
                            <li><a href="<?php echo site_url('auth/logout');?>"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                        </ul>

                        <?php
                    }
                    ?>




                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- /top navigation -->