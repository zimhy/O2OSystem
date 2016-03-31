<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta charset="UTF-8">
    <title>艺宝首页</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/index.css">
  </head>
  <body>
    <header class="container-fluid">
      <div class="row">
        <div class="col-md-6"><a href="index.html"><img class="logo" src="" alt="website logo"></a>
          <p class="slogan">艺宝,您身边的艺术教师!</p>
        </div>
        <div class="col-md-6">
          <div class="login">
            <a href="signup/signup.html">教师入驻</a>
            <a href="#" class="ssin">教师登录</a>
            <a href="#" class="ssin">机构登录</a>
          </div>
          <div class="signin">
            <form action="" method="post">
              <table class="formtable">
                <tr><td>邮箱：</td><td><input type="text" name="username" required></td></tr>
                <tr><td>密码：</td><td><input type="password" name="password" required></td></tr>
                <tr><td>验证码：</td><td><input type="text" name="" required></td></tr>
                <tr><td></td><td><a href=""><img src="" alt="验证码图片"></a></td></tr>
              </table>
              <div class="submit">
                <input class="btn btn-default" type="submit" value="登录">
                <button type="button" class="btn btn-default" id="dismiss">关闭</button>
              </div>
            </form>
          </div>
          <div class="buttons">
            <a href="#main" class="btn" data-toggle="tab">首页</a>
            <a href="#activities" class="btn" data-toggle="tab">活动</a>
            <a href="#help" class="btn" data-toggle="tab">帮助</a>
            <a href="#contactus" class="btn" data-toggle="tab">联系我们</a>
          </div>
        </div>
      </div>
    </header>
    <article class="container-fluid tab-content">
        <div id="main" class="row tab-pane active main">
          <div class="qrcode">
            <div><img src="img/qrcode.png" alt="安卓二维码">
              <span>安卓</span>
            </div>
            <div><img src="img/qrcode.png" alt="苹果二维码">
              <span>苹果</span></div>
          </div>
        </div>
        <div id="activities" class="row tab-pane">
          <div class="col-md-9">
            <div class="row">
              <div class="col-md-8 col-md-offset-2 activity">
                <div id="activity-slide" class="" data-ride="carousel">
                <!--Indicators -->
                <ol class="carousel-indicators">
                  <li data-target="#activity-slide" data-slide-to="0" class="active"></li>
                  <li data-target="#activity-slide" data-slide-to="1"></li>
                  <li data-target="#activity-slide" data-slide-to="2"></li>
                </ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                  <div class="item active">
                    <img src="img/160301111147.jpg" alt="活动1">
                    <div class="carousel-caption">
                      活动1
                    </div>
                  </div>
                  <div class="item">
                    <img src="img/160301111147.jpg" alt="活动2">
                    <div class="carousel-caption">
                      活动2
                    </div>
                  </div>
                  <div class="item">
                    <img src="img/160301111147.jpg" alt="活动3">
                    <div class="carousel-caption">
                      活动3
                    </div>
                  </div>
                </div>
                <!-- Controls -->
                <a class="left carousel-control" href="#activity-slide" role="button" data-slide="prev">
                  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#activity-slide" role="button" data-slide="next">
                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="list-group activity-list">
              <a href="#" class="list-group-item">活动1</a>
              <a href="#" class="list-group-item">活动1</a>
              <a href="#" class="list-group-item">活动1</a>
              <a href="#" class="list-group-item">活动1</a>
            </div>
          </div>
        </div>
        <div id="help" class="row tab-pane">
          <div class="col-md-3">
            <div class="ph">
              帮助列表
            </div>
          </div>
          <div class="col-md-3">
            <div class="ph">
              帮助详情
            </div>
          </div>
        </div>
        <div id="contactus" class="row tab-pane">
          <div class="ph">
            联系方式
          </div>
        </div>
    </article>
    <footer class="container-fluid" style="height: 100px;background-color: #4d99f5;text-align: center;">
      <div class="row" style="color:#fff;">
        &copy底部信息
      </div>
    </footer>
    <script src="http://lib.sinaapp.com/js/jquery/2.0.3/jquery-2.0.3.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/index.js"></script>
  </body>
</html>