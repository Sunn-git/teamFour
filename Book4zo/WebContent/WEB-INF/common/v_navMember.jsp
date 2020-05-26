<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<nav class="navbar navbar-default navbar-expand-lg" role="navigation-demo">
            <div class="container">
              <!-- Brand and toggle get grouped for better mobile display -->
              <div class="navbar-translate">
                <a class="navbar-brand" href="Main.book">R4B</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="navbar-toggler-icon"></span>
                  <span class="navbar-toggler-icon"></span>
                  <span class="navbar-toggler-icon"></span>
                </button>
              </div>
              
              <!-- Collect the nav links, forms, and other content for toggling -->
              <div class="collapse navbar-collapse">
                <form class="form-inline ml-auto">
                  <div class="form-group has-rose">
                    <input type="text" class="form-control" placeholder="도서 검색하기 :)" style="width:480px;">
                  </div>
                  <button type="submit" class="btn btn-rose btn-raised btn-fab btn-round" style="margin-left:8px;">
                    <i class="material-icons">search</i>
                  </button>
                </form>
                <ul class="navbar-nav ml-auto">
                  <li class="dropdown nav-item">
                    <a href="javascript:;" class="profile-photo dropdown-toggle nav-link" data-toggle="dropdown">
                      <div class="profile-photo-small">
                        <img src="./assets/img/faces/avatar.jpg" alt="Circle Image" class="rounded-circle img-fluid">
                      </div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                      <h6 class="dropdown-header">누구누구님 반갑습니다 :)</h6>
                      <a href="Mypage.user" class="dropdown-item">내 도서함</a>
                      <a href="InfoEdit.user" class="dropdown-item">내 정보 수정</a>
                      <a href="javascript:;" class="dropdown-item">로그아웃</a>
                    </div>
                  </li>
                </ul>
              </div><!-- /.navbar-collapse -->
            </div><!-- /.container-->
          </nav>
</body>
</html>