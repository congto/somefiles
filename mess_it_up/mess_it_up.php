<?php
    if (isset($_POST['a1']))
    {
         exec('/idan/if_down_compute_0.sh');
    }
    if (isset($_POST['a2']))
    {
         exec('/idan/BBB.sh');
    }
    if (isset($_POST['a3']))
    {
         exec('/idan/if_up_compute_0.sh');
    }
    if (isset($_POST['b1']))
    {
         exec('/idan/if_down_compute_1.sh');
    }
    if (isset($_POST['b2']))
    {
         exec('/idan/GGG.sh');
    }
    if (isset($_POST['b3']))
    {
         exec('/idan/if_up_compute_1.sh');
    }
?>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Mess It Up!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
                <link href="https://fonts.googleapis.com/css?family=Corben:bold" rel="stylesheet" type="text/css">
                <link href="https://fonts.googleapis.com/css?family=Nobile" rel="stylesheet" type="text/css">
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/font-awesome.css" rel="stylesheet">
    <link href="./css/custom.css" rel="stylesheet">
                <!--[if gte IE 9]>
                  <style type="text/css">
                    .gradient {
                       filter: none;
                    }
                  </style>
                <![endif]-->

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="https://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

  </head>

  <body>

    <div align="center" class="container-narrow">
      <div align="left" class="masthead">
        <ul class="nav nav-pills pull-right">
          <li class="active"><a href="https://10.5.154.100/dashboard/project/vitrageentities/" target="a">Vitrage</a></li>
          <li class="active"><a href="https://10.5.154.100/zabbix" target="b">Zabbix</a></li>
        </ul>
        <h3 class="muted">Vitrage Demo</h3>
      </div>

        <div>
</div>
<hr>
<br>
      <img src="https://wiki.openstack.org/w/images/thumb/3/3f/OpenStack_Project_Vitrage_horizontal.png/450px-OpenStack_Project_Vitrage_horizontal.png" alt="Mountain View" style="width:450px;height:158px;">

      <div class="jumbotron">
        <h1>Mess Things Up!</h1>
      </div>


      <div class="row-fluid marketing">
        <div class="span6">
          <h3>Compute - 0:</h3>
          <h4>Mess up interfaces</h4>
          <form method="post">
<br>
            <p><button name="a1" class="btn btn-danger">IFDOWN eno3</button></p>
            <p><button name="a3" class="btn btn-success">Interfaces Up</button></p>
          </form>
        </div>

        <div class="span6">
          <h3>Compute - 1:</h3>
          <h4>Mess up interfaces</h4>
<br>
          <form method="post">
            <p><button name="b1" class="btn btn-danger">IFDOWN eno3</button></p>
            <p><button name="b3" class="btn btn-success">Interfaces Up</button></p>
          </form>
        </div>
      </div>
<br>
      <div class="footer">
        <p>&copy; Nokia 2017</p>
      </div>

    </div> <!-- /container -->

                <script src="./js/jquery-1.7.2.min.js"></script>
                <script src="./js/jquery.backstretch.min.js"></script>
                <script src="./js/custom.js"></script>

  </body>
</html>
