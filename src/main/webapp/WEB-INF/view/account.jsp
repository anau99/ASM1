<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html  lang="en" >
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
                        <a th:if="${session.admin}" class="nav-link dropdown-toggle" href="/admin/logout" role="button"><i
                                class="fas fa-user fa-fw"></i><span> Logout</span></a>
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
                                <a href="${pageContext.request.contextPath}/User/list" class="nav-link">
                                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                    Quản lý người dùng
                                </a>
                                <a href="${pageContext.request.contextPath}/Donation/list" class="nav-link">
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
                        <h1 class="mt-4">Danh sách người dùng</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                        data-bs-target="#exampleModalAdd">
                                    Thêm mới
                                </button>

                                <!-- Modal Add-->
                                <div class="modal fade" id="exampleModalAdd" tabindex="-1"
                                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabelll">Thêm mới</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="saveUser" method="get" enctype="multipart/form-data">
                                                    <div class="row">
                                                        <div class="col-6">
                                                            <label for="addname" class="col-form-label">Name:</label>
                                                            <input type="text" class="form-control" id="addcost"
                                                                   name="fullName" required>

                                                        </div>
                                                        <div class="col-6">
                                                            <label for="addcost" class="col-form-label">Email:</label>
                                                            <input type="email" class="form-control" id="addcost"
                                                                   name="email" required>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-6">
                                                            <label for="addname" class="col-form-label">Số điện
                                                                thoại:</label>
                                                            <input type="number" class="form-control" id="addname"
                                                                   name="phoneNumber" required>
                                                        </div>
                                                        <div class="col-6">
                                                            <label for="addcost" class="col-form-label">Địa chỉ:</label>
                                                            <input type="text" class="form-control" id="addcost"
                                                                   name="address" required>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-6">
                                                            <label for="addname" class="col-form-label">Tài khoản:</label>
                                                            <input type="text" class="form-control" id="addname"
                                                                   name="userName" required>
                                                        </div>
                                                        <div class="col-6">
                                                            <label for="addcost" class="col-form-label">Mật khẩu:</label>
                                                            <input type="password" class="form-control" id="addcost"
                                                                   name="password" required>
                                                        </div>
                                                        <div class="col-6">
                                                            <label for="ct_id" class="col-form-label">Vai trò:</label>
                                                            <select class="form-control" id="ct_id" name="idRole" required>
                                                                <option value="" selected>Chọn loại vai trò</option>
                                                                <c:forEach var="role" items="${roles}">
                                                                    <option value="${role.id}">${role.roleName}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">Đóng</button>
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
                                        <form action="searchUser" method="get" enctype="multipart/form-data">
                                            <input type="search" class="form-control rounded" placeholder="Search"
                                                   aria-label="Search" name="searchQuery" aria-describedby="search-addon" />
                                        </form>
                                    </div>
                                </div>


                                <table id="datatablesSimple" class="table table-bordered table-striped">
                                    <thead>
                                        <tr style="background-color: gray !important;">
                                            <th>Họ tên</th>
                                            <th>Email</th>
                                            <th>Số điện thoại</th>
                                            <th>Tài khoản</th>
                                            <th>Vai trò</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="user" items="${users}">
                                            <tr>
                                                <td>${user.fullName}</td>
                                                <td>${user.email}</td>
                                                <td>${user.phoneNumber}</td>
                                                <td>${user.userName}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${user.role.id == 2}">
                                                            Admin
                                                        </c:when>
                                                        <c:otherwise>
                                                            User
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${user.status == 1}">
                                                            <span style="color: #1c7430; font-weight: bold">Hoạt động</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span style="color: red; font-weight: bold">Đã khóa</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                               <!--     <button type="button" style="width: 80px" class="btn btn-success"
                                                            data-bs-toggle="modal" data-bs-target="#idModelMail">
                                                        Gửi
                                                    </button>-->

                                                    <button type="button" style="width: 80px" class="btn btn-primary"
                                                            data-bs-toggle="modal" data-bs-target="#exampleModalUpdate-${user.id}">
                                                        Sửa
                                                    </button>



                                                <!--  <button type="button" style="width: 80px" class="btn btn-warning"
                                                            data-bs-toggle="modal" data-bs-target="#idModelDetail">
                                                        Chi tiết
                                                    </button> -->
                                                    <!-- Button trigger modal -->

                                                    <button type="button" style="width: 80px" class="btn btn-danger mt-1" data-bs-toggle="modal" data-bs-target="#exampleModalDelete-${user.id}">
                                                        Xóa
                                                    </button>
                                                    <!-- Modal delete -->
                                                    <div class="modal fade" id="exampleModalDelete-${user.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                                                <button type="button" class="bnt-close" data-bs-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p>Người dùng:${user.fullName}</p>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <form action="deleteUser" method="post">
                                                                    <input type="hidden" name="userId" value="${user.id}">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                    <button type="submit" class="btn btn-primary">Xóa</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                            </div>
                            <!-- Modal delete -->



                            <form action="accessPermissions" method="GET" enctype="multipart/form-data"  style="display: inline-block;">
                                <input type="hidden" class="form-control" name="idUser" value="${user.id}">
                                <c:choose>
                                    <c:when test="${user.status==1}">
                                        <button type="submit" style="width: 80px; display:inline-block"
                                                class="btn btn-danger" name="action" value="lock" >Khóa
                                    </c:when>
                                    <c:otherwise>
                                        <button type="submit" style="width: 80px; display:inline-block"
                                                class="btn btn-success" name="action" value="unlock">Mở
                                    </c:otherwise>
                                </c:choose>
                            </form>
                            </td>
                            <!-- Modal Update -->
                            <div class="modal fade" id="exampleModalUpdate-${user.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Cập nhật thông tin</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                    <div class="modal-body">
                                         <form action="updateUser" method="post">
                                            <div class="row">
                                                <div class="col-6">
                                                    <label for="updateFullName" class="col-form-label">Họ và tên:</label>
                                                    <input type="text" class="form-control" id="updateFullName" name="fullName" value="${user.fullName}" required>
                                                </div>
                                                <div class="col-6">
                                                    <label for="updatePhoneNumber" class="col-form-label">Số điện thoại:</label>
                                                    <input type="text" class="form-control" id="updatePhoneNumber" name="phoneNumber"value="${user.phoneNumber}" required>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <label for="updateAddress" class="col-form-label">Địa chỉ:</label>
                                                    <input type="text" class="form-control" id="updateAddress" name="address" value="${user.address}" required>
                                                </div>
                                                <div class="col-6">
                                                    <label for="updateRole" class="col-form-label">Vai trò:</label>
                                                    <select class="form-control" id="updateRole" name="idRole" required>
                                                        <option value="${role.roleName}"  selected>${role.roleName}</option>
                                                       <c:forEach var="role" items="${roles}">
                                                            <option value="${role.id}">${role.roleName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <label for="updateUsername" class="col-form-label">Tài khoản:</label>
                                                    <input type="text" class="form-control" id="updateUsername" name="userName" value="${user.userName}" readonly>
                                                </div>
                                                <div class="col-6">
                                                    <label for="updateEmail" class="col-form-label">Email:</label>
                                                    <input type="email" class="form-control" id="updateEmail" name="email" value="${user.email}" readonly>
                                                </div>
                                            </div>

                                                                                                                                   <div class="modal-footer">
                                            <input type="hidden" name="userId" value="${user.id}">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                            <button type="submit" class="btn btn-primary">Lưu</button>
                                         </form>
                                    </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal Update -->

                            </tr>
                            </c:forEach>
                            </tbody>
                            </table>

                        </div>
                    </div>
            </div>
            </main>

            <footer th:replace="admin/fragments :: footer" class="py-4 bg-light mt-auto">

            </footer>
        </div>
        </div>








    </body>


</html>