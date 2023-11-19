<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html  lang="en">

<head>

            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>Quản trị</title>
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
            <link href="../static/admin1/assets/css/styles.css" rel="stylesheet" />
            <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
                    crossorigin="anonymous"></script>
            <script src="../static/admin1/assets/js/scripts.js"></script>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
            <script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
</head>

<body class="sb-nav-fixed">
  <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <nav th:fragment="html_nav" class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
      <!-- Navbar Brand-->
      <a class="navbar-brand ps-3" href="/admin/">QUẢN TRỊ</a>
      <!-- Sidebar Toggle-->
      <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
              class="fas fa-bars"></i></button>
      <!-- Navbar Search-->
      <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

      </form>
      <!-- Navbar-->
          <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
              <li class="nav-item dropdown">
                  <a  class="nav-link dropdown-toggle" href="/admin/logout" role="button" ><i class="fas fa-user fa-fw"></i><span> Logout</span></a>
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
    <div  id="layoutSidenav_nav">
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
        <h1 class="mt-4">Danh sách đợt quyên góp</h1>
        <div class="card mb-4">
          <div class="card-header">
            <button type="button" class="btn btn-success" data-bs-toggle="modal"
                    data-bs-target="#exampleModalAdd">
              Thêm mới
            </button>
            <!-- Modal Add-->
            <div class="modal fade" id="exampleModalAdd" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabelll">Thêm mới</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <form action="saveDonation" method="post" >
                      <div class="row">
                        <div class="col-6">
                          <label for="addname"
                                 class="col-form-label">Mã đợt quyên góp:</label>
                          <input type="text" class="form-control"
                                 id="addname" name="code" required>
                        </div>
                        <div class="col-6">
                          <label for="addcost"
                                 class="col-form-label">Tên đợt quyên góp:</label>
                          <input type="text" class="form-control"
                                 id="addcost" name="name" required>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6">
                          <label for="addname"
                                 class="col-form-label">Ngày bắt đầu:</label>
                          <input type="date" class="form-control"
                                 id="addname" name="startDate" required>
                        </div>
                        <div class="col-6">
                          <label for="addcost"
                                 class="col-form-label">Ngày kết thúc:</label>
                          <input type="date" class="form-control"
                                 id="addcost" name="endDate" required>

                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6">
                          <label for="addname"
                                 class="col-form-label">Tổ chức:</label>
                          <input type="text" class="form-control"
                                 id="addname" name="organizationName" required>
                        </div>
                        <div class="col-6">
                          <label for="addcost"
                                 class="col-form-label">Số điện thoại:</label>
                          <input type="number" class="form-control"
                                 id="addcost" name="phoneNumber" required>
                        </div>
                        <div class="col-12">
                          <label for="ct_id" class="col-form-label">Nội dung:</label>
                          <textarea name="description" class="form-control" cols="50" rows="5">Nhập nội dung</textarea>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Thêm </button>
                      </div>
                    </form>
                  </div>

                </div>
              </div>
            </div>
            <!-- Modal Add-->
          </div>
          <div class="card-body">
            <div id="message">
                <c:if test="${not empty sessionScope.message}">
                     ${sessionScope.message}
                </c:if>
            </div>
            <div class="d-flex justify-content-end" style="margin-top: -10px;">
                 <div class="input-group rounded" style="width: 200px;">
                     <form action="searchDonation" method="get" enctype="multipart/form-data">
                          <input type="search" class="form-control rounded" placeholder="Search"
                               aria-label="Search" name="searchQuery" aria-describedby="search-addon" />
                     </form>
                 </div>
            </div>
            <table id="datatablesSimple2" class="table table-bordered table-striped">
              <thead>
              <tr style="background-color: gray !important;">
                <th>Mã</th>
                <th>Tên</th>
                <th>Ngày bắt đầu</th>
                <th>Ngày kết thúc</th>
                <th>Tổ chức</th>
                <th>Số điện thoại</th>
                <th>Tổng tiền</th>
                <th >Trạng thái</th>
                <th style="width: 220px ">Hành động</th>
              </tr>
              </thead>
              <tfoot>
              <tr>

              </tr>
              </tfoot>
              <tbody>

               <c:forEach var="donation" items="${donations}">
                <tr>
                  <td>${donation.code}</td>
                  <td>${donation.name}</td>
                  <td>${donation.startDate}</td>
                  <td>${donation.endDate}</td>
                  <td>${donation.organizationName}</td>
                  <td>${donation.phoneNumber}</td>
                  <td>${donation.money}</td>
                  <td>
                    <c:choose>
                      <c:when test="${donation.status == 0}">
                        Mới tạo
                      </c:when>
                      <c:when test="${donation.status == 1}">
                        Đang quyên góp
                      </c:when>
                      <c:when test="${donation.status == 2}">
                        Kết thúc quyên góp
                      </c:when>
                      <c:when test="${donation.status == 3}">
                        Đóng quyên góp
                      </c:when>
                    </c:choose>
                  </td>
                  <td style="">
                    <button type="button" style="width: 105px; display: ${donation.status == 3 ? 'none' : 'block'}" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#idModelUpdate-${donation.id}">

                      Cập nhật
                    </button>
                     <!-- Modal Update-->
                                  <div class="modal fade" id="idModelUpdate-${donation.id}" tabindex="-1" aria-labelledby="exampleModalLabel"
                                       aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabelll">Thêm mới</h5>
                                          <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                  aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                          <form action="updateDonation" method="post" >
                                            <div class="row">
                                              <div class="col-6">
                                                <label for="addname"
                                                       class="col-form-label">Mã đợt quyên góp:</label>
                                                <input type="text" class="form-control"
                                                       id="addname" name="code" value="${donation.code}" required>
                                              </div>
                                              <div class="col-6">
                                                <label for="addcost"
                                                       class="col-form-label">Tên đợt quyên góp:</label>
                                                <input type="text" class="form-control"
                                                       id="addcost" name="name" value="${donation.name}" required>
                                              </div>
                                            </div>
                                            <div class="row">
                                              <div class="col-6">
                                                <label for="addname"
                                                       class="col-form-label">Ngày bắt đầu:</label>
                                                <input type="date" class="form-control"
                                                       id="addname" name="startDate" value="${donation.startDate}" required>
                                              </div>
                                              <div class="col-6">
                                                <label for="addcost"
                                                       class="col-form-label">Ngày kết thúc:</label>
                                                <input type="date" class="form-control"
                                                       id="addcost" name="endDate" value="${donation.endDate}" required>
                                              </div>
                                            </div>
                                            <div class="row">
                                              <div class="col-6">
                                                <label for="addname"
                                                       class="col-form-label">Tổ chức:</label>
                                                <input type="text" class="form-control"
                                                       id="addname" name="organizationName" value="${donation.organizationName}" required>
                                              </div>
                                              <div class="col-6">
                                                <label for="addcost"
                                                       class="col-form-label">Số điện thoại:</label>
                                                <input type="number" class="form-control"
                                                       id="addcost" name="phoneNumber" value="${donation.phoneNumber}" required>
                                              </div>
                                              <div class="col-12">
                                                <label for="ct_id" class="col-form-label">Nội dung:</label>
                                                <textarea name="description" class="form-control" cols="50" rows="5">${donation.description}</textarea>
                                              </div>
                                            </div>
                                            <div class="modal-footer">
                                                <input type="hidden" name="donationId" value="${donation.id}">
                                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                              <button type="submit" class="btn btn-primary">Update</button>
                                            </div>
                                          </form>
                                        </div>

                                      </div>
                                    </div>
                                  </div>
                                  <!-- Modal Add-->
                            <c:url var="detailLink" value="/Donation/detailDonation">
                                 <c:param name="donationId" value="${donation.id}"/>
                            </c:url>
                            <a href="${detailLink}" style="width: 105px" class="btn btn-warning">
                                Chi tiết
                            </a>
                         <form action="statusUpdateDonation" method="post" style="margin-left: 110px;margin-top: -38px" >
                           <input type="hidden" class="form-control" id="donationId" name="donationId_status" value="${donation.id}-${donation.status}" >
                           <c:choose>
                             <c:when test="${donation.status == 0}">
                               <button type="submit" style="width: 105px" class="btn btn-success">Quyên góp</button>
                               <button  type="button" style="width: 105px" class="btn btn-danger mt-1" data-bs-toggle="modal"
                               data-bs-target="#idModelDel-${donation.id}">Xóa</button>
                               <button type="submit" style="width: 105px; display: none" class="btn btn-success">Kết thúc</button>
                               <button type="submit" style="width: 105px; display: none" class="btn btn-success">Đóng</button>
                             </c:when>
                             <c:when test="${donation.status == 1}">
                               <button type="submit" style="width: 105px; display: none" class="btn btn-success">Quyên góp</button>
                               <button  type="button" style="width: 105px; display: none" class="btn btn-danger mt-1" data-bs-toggle="modal"
                               data-bs-target="#idModelDel-${donation.id}">Xóa</button>
                               <button type="submit" style="width: 105px" class="btn btn-success">Kết thúc</button>
                               <button type="submit" style="width: 105px; display: none" class="btn btn-success">Đóng</button>
                             </c:when>
                             <c:when test="${donation.status == 2}">
                               <button type="submit" style="width: 105px; display: none" class="btn btn-success">Quyên góp</button>
                               <button  type="button" style="width: 105px; display: none" class="btn btn-danger mt-1" data-bs-toggle="modal"
                                                              data-bs-target="#idModelDel-${donation.id}">Xóa</button>
                               <button type="submit" style="width: 105px; display: none" class="btn btn-success">Kết thúc</button>
                               <button type="submit" style="width: 105px" class="btn btn-success">Đóng</button>
                             </c:when>
                             <c:otherwise>
                               <button type="submit" style="width: 105px; display: none" class="btn btn-success">Quyên góp</button>
                               <button type="button" style="width: 105px; display: none" class="btn btn-danger mt-1" data-bs-toggle="modal"
                                                              data-bs-target="#idModelDel-${donation.id}">Xóa</button>
                               <button type="submit" style="width: 105px; display: none" class="btn btn-success">Kết thúc</button>
                               <button type="submit" style="width: 105px; display: none" class="btn btn-success">Đóng</button>

                             </c:otherwise>
                           </c:choose>
                         </form>

                         <!-- Modal delete -->
                              <div class="modal fade" id="idModelDel-${donation.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                      <button type="button" class="bnt-close" data-bs-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                      </button>
                                    </div>
                                    <div class="modal-body">
                                      <p>Đợt quyên góp:${donation.name}</p>
                                    </div>
                                    <div class="modal-footer">
                                      <form action="deleteDonation"  method="post">
                                        <input type="hidden" name="donationId" value="${donation.id}">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Xóa</button>
                                      </form>
                                    </div>
                                  </div>
                                </div>
                             </div>
                              <!-- Modal delete -->

                    <div class="modal fade" id="'idModelDel' + ${user.id} tabindex="-1"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Bạn chắc chắn muốn xóa ?</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            Đợt quyên góp : <span text="${user.name}"></span>
                            <form method="post">
                              <div class="modal-footer" style="margin-top: 20px">
                                <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">
                                  Close
                                </button>
                                <button type="submit" class="btn btn-danger">Xóa</button>

                              </div>
                            </form>
                          </div>

                        </div>
                      </div>
                    </div>
                  </td>


                <div class="modal fade" tabindex="-1"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg ">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabell">Cập nhật</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <form enctype="multipart/form-data" method="post">
                          <input type="hidden" name="id">
                          <div class="row">
                            <div class="col-6">
                              <label for="addname"
                                     class="col-form-label">Mã đợt quyên góp:</label>
                              <input type="text" class="form-control"
                                     id="addname" name="code" required>
                            </div>
                            <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">Tên đợt quyên góp:</label>
                              <input type="text" class="form-control"
                                     id="addcost" name="name" required>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-6">
                              <label for="addname"
                                     class="col-form-label">Ngày bắt đầu:</label>
                              <input type="date" class="form-control"
                                     id="addname" name="start" required>
                            </div>
                            <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">Ngày kết thúc:</label>
                              <input type="date" class="form-control"
                                     id="addcost" name="end" required>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-6">
                              <label for="addname"
                                     class="col-form-label">Tổ chức:</label>
                              <input type="text" class="form-control"
                                     id="addname" name="tochuc" required>
                            </div>
                            <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">Số điện thoại:</label>
                              <input type="number" class="form-control"
                                     id="addcost" name="sdt" required>
                            </div>
                            <div class="col-12">
                              <label for="ct_id" class="col-form-label">Nội dung:</label>
                              <textarea name="noidung" class="form-control" cols="50" rows="5"></textarea>
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary">Lưu </button>
                          </div>
                        </form>
                      </div>

                    </div>
                  </div>
                </div>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>

    </main>

    <script>

      ClassicEditor.create(document.querySelector('#editor')).then(eidt => {
        console.log("da" + eidt);
      })
              .catch(error => {
                console.error(error);
              });

    </script>
    <script>

      var dodai = document.getElementById("dodai").value;
      var a = parseInt(dodai);
      for(var i = 1;i<=a+10;i++){
        var name = "#editor"  + i
        ClassicEditor.create(document.querySelector(name)).then(eidt => {
          console.log("da" + eidt);
        })
                .catch(error => {
                  console.error(error);
                });
      }


    </script>
    <footer th:replace="admin/fragments :: footer" class="py-4 bg-light mt-auto">

    </footer>
  </div>
</div>

</body>

</html>