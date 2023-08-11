<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Quản trị</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
  <link href="../static/admin1/assets/css/styles.css" rel="stylesheet" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <script src="../static/admin1/assets/js/scripts.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
  <script src="../static/admin1/assets/js/datatables-simple-demo.js"></script>
  <script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
  <script>
    $(document).ready(function() {
      $('#datatablesSimple').DataTable();
    });
  </script>
</head>

<body class="sb-nav-fixed">
  <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <nav th:fragment="html_nav" class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
      <!-- Navbar Brand-->
      <a class="navbar-brand ps-3" href="/admin/">QUẢN TRỊ</a>
      <!-- Sidebar Toggle-->
      <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
      <!-- Navbar Search-->
      <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

      </form>
      <!-- Navbar-->
      <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
          <a th:if="${session.admin}" class="nav-link dropdown-toggle" href="/admin/logout" role="button"><i class="fas fa-user fa-fw"></i><span> Logout</span></a>
          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown1">
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Activity Log</a></li>
            <li>
              <hr class="dropdown-divider" />
            </li>
            <li><a class="dropdown-item" href="/logout">Logout</a></li>
          </ul>
        </li>
      </ul>
    </nav>
  </nav>

  <div id="layoutSidenav">
    <div id="layoutSidenav_nav">
      <div th:fragment="html_menu" id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
          <div class="sb-sidenav-menu">
            <div class="nav">
              <a class="nav-link" href="${pageContext.request.contextPath}/User/list">
                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                Quản lý người dùng
              </a>
              <a class="nav-link" href="${pageContext.request.contextPath}/Donation/list">
                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                Quản lý đợt quyên góp
              </a>
            </div>
          </div>
        </nav>
      </div>
    </div>

    <div id="layoutSidenav_content">
      <main>
        <div class="container-fluid px-4">
          <h1 class="mt-4">Chi tiết đợt quyên góp</h1>
          <div class="card mb-4">
            <div class="card-body">
              <!-- Detail -->
              <div class="row">
                <div class="col-6">
                  <label for="addname" class="col-form-label">Mã đợt quyên góp:</label>
                  <input type="text" class="form-control" id="addname" name="code" value="${donation.code}" readonly="readonly">
                </div>
                <div class="col-6">
                  <label for="addcost" class="col-form-label">Tên đợt quyên góp:</label>
                  <input type="text" class="form-control" id="addcost" name="name" value="${donation.name}" readonly="readonly">
                </div>
              </div>
              <div class="row">
                <div class="col-6">
                  <label for="addname" class="col-form-label">Ngày bắt đầu:</label>
                  <input type="date" class="form-control" id="addname" name="start" value="${donation.startDate}" readonly="readonly">
                </div>
                <div class="col-6">
                  <label for="addcost" class="col-form-label">Ngày kết thúc:</label>
                  <input type="date" class="form-control" id="addcost" name="end" value="${donation.endDate}" readonly="readonly">
                </div>
              </div>
              <div class="row">
                <div class="col-6">
                  <label for="addname" class="col-form-label">Tổng tiền quyên góp:</label>
                  <input type="text" class="form-control" id="addname" name="start" value="${donation.money}" readonly="readonly">
                </div>
                <div class="col-6">
                  <label for="addcost" class="col-form-label">Trạng thái:</label>
                  <input type="text" class="form-control" id="addcost" name="end" value="<c:choose><c:when test="${donation.status == 0}">Mới tạo</c:when><c:when test="${donation.status == 1}">Đang quyên góp</c:when><c:when test="${donation.status == 2}">Kết thúc quyên góp</c:when><c:when test="${donation.status == 3}">Đóng quyên góp</c:when></c:choose>" readonly="readonly">
                </div>
              </div>
              <div class="row">
                <div class="col-6">
                  <label for="addname" class="col-form-label">Tổ chức:</label>
                  <input type="text" class="form-control" id="addname" name="tochuc" value="${donation.organizationName}" readonly="readonly">
                </div>
                <div class="col-6">
                  <label for="addcost" class="col-form-label">Số điện thoại:</label>
                  <input type="number" class="form-control" id="addcost" name="sdt" value="${donation.phoneNumber}" readonly="readonly">
                </div>
                <div class="col-12">
                  <label for="ct_id" class="col-form-label">Nội dung:</label>
                  <textarea name="noidung" class="form-control" cols="50" readonly="readonly">${donation.description}</textarea>
                </div>
              </div>
              <!-- Detail -->

              <h3 class="mt-4">Danh sách những người quyên góp</h3>
              <table id="datatablesSimple" class="table table-bordered">
                <thead>
                  <tr>
                    <th>Họ Tên</th>
                    <th>Tiền quyên góp</th>
                    <th>Ngày quyên góp</th>
                    <th>Nội dung</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${donation.userDonations}" var="userDonation">
                    <tr>
                      <td>${userDonation.name}</td>
                      <td>${userDonation.money} VND</td>
                      <td>${userDonation.created}</td>
                      <td>${userDonation.test}</td>
                      <td>
                        <c:choose>
                          <c:when test="${userDonation.status == 0}">Chờ xác nhận</c:when>
                          <c:when test="${userDonation.status == 1}">Đã xác nhận</c:when>
                          <c:when test="${userDonation.status == 2}">Đã Hủy</c:when>
                        </c:choose>
                      </td>
                      <td>

                        <c:choose>
                          <c:when test="${userDonation.status == 0}">
                          <form action="acceptedADonation"  method="post">
                             <input type="hidden" name="inputString" value="${donation.id}-${userDonation.status}-${userDonation.id}-${userDonation.money}">
                              <button type="submit" style="width: 105px; display: ${userDonation.status == 0 ? 'inline-block' : 'none'};" class="btn btn-success">Xác nhận</button>
                          </form>
                          <form action="canceledADonation"  method="post">
                              <input type="hidden" name="inputStringCanceled" value="${donation.id}-${userDonation.status}-${userDonation.id}-${userDonation.money}">
                              <button type="submit" style="width: 150px; display: ${userDonation.status == 0 ? 'inline-block' : 'none'};" class="btn btn-danger">Hủy xác nhận</button>
                          </form>
                          </c:when>
                          <c:otherwise>
                             <button type="submit" style="width: 105px; display: none;" class="btn btn-success">Xác nhận</button>
                             <button type="submit" style="width: 150px; display: none;" class="btn btn-danger">Hủy xác nhận</button>
                          </c:otherwise>
                        </c:choose>

                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </main>

      <script src="js/JQuery3.3.1.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
      <script src="js/scripts.js"></script>
    </div>
  </div>

</body>

</html>
