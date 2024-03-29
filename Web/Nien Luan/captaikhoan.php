             

<?php
    session_start();
   
    if (!isset($_SESSION['tenkh'])) {
    echo '<script>alert("Bạn cần phải đăng nhập để tiếp tục!")</script>';   
	   header('Location: dangnhap_qtv.php');      
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Trang quản trị/Cấp tài khoản khách hàng</title>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link style="text/css" href="css/font.css" rel="stylesheet">  
    
</head>

<body>
    
    
	<!-- Tao mot duong ngang -->
    <div class="container">
     <div class="row panel panel-info">
            
         		<div class="panel-heading">

         			<div class="col-sm-9">
                        <a href="trangchu.php"><h3>HỆ THỐNG QUẢN LÍ BÁN HÀNG ONLINE</h3></a>
                	</div>
                  
                    <div class="collapse navbar-collapse" id="app-navbar-collapse">
                <!-- Left Side Of Navbar -->
                <ul class="nav navbar-nav">
                    &nbsp;
                </ul>

                <!-- Right Side Of Navbar -->
                <ul class="nav navbar-nav navbar-right">
                    <!-- Authentication Links -->
                    <?php if (!isset($_SESSION['tenkh'])): ?>
                        <li>
                            
                        <div class="dropdown">  
                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Đăng Ký
                                <span class="caret"></span></button>
                            <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li><a href="dangky.php"><input class="btn btn-info" type="submit" name="dangky" value="Đăng Ký"></a></li
                            </ul> </div>      
                        </li>
                        <li>
                        <div class="dropdown"> 
                            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Đăng Nhập
                                <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li><a href="dangnhap_qtv.php"><input class="btn btn-info" type="submit" name="qtv" value="Quản trị"></a></li>
                                <li><a href="dangnhap_nv.php"><input class="btn btn-info" type="submit" name="nv" value="Nhân Viên"></a></li>
                                <li><a href="dangnhap.php"><input class="btn btn-info" type="submit" name="kh" value="Khách Hàng"></a></li>
 
                    </ul>
                </div>
                       </li> 
                    <?php else: ?>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle glyphicon glyphicon-user" data-toggle="dropdown" role="button" aria-expanded="false">
                                <?php  echo "".$_SESSION['tenkh']; ?> <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="dangxuat.php"
                                        onclick="event.preventDefault();
                                                 document.getElementById('logout-form').submit();">
                                        Đăng Xuất
                                    </a>

                                    <form id="logout-form" action="dangxuat.php" method="POST" style="display: none;">
                                    </form>
                                </li>
                            </ul>
                        </li>
                    <?php endif ?>
                </ul>
            </div>
				</div>
            
        <div class="panel-body" >
            <div class="col-sm-4">
                <br><br><br>
                <form class="searchform cf" action="timkiem.php" method="get">
                        <input type="text" name="search" placeholder="Nhập những gì bạn muốn tìm">
                        <button type="submit" name="ok" value="search">Search</button>
                </form>
            </div>
            <div class="col-sm-8">
                
                <div class="col-sm-2">
                   <form class="form-inline" role="form">
                        <div class="input-group has-success">
                            <ul>
                                 <li><a href="trangchu.php"><center><img src="icon/home.png" height="30" ></center>TRANG CHỦ</a> </li>
                            </ul>
                    </div>
                  </form>
                </div>
                <div class="col-sm-2">
                    
                   <form class="form-inline" role="form">
                        <div class="input-group has-success">
                            <ul >
                                <?php if (!isset($_SESSION['tenkh'])): ?>
                                     <li><a href="giohang.php"><center><img src="icon/shopping_cart.png" height="30" ></center>GIỎ HÀNG</a> </li>
                                <?php elseif ($_SESSION['QUYENSD'] == "Administrator"): ?>
                                    <li><a href="captaikhoan_nv.php"><center><img src="icon/operator.png" height="30" ></center>CẤP TKNV</a> </li>
                                <?php elseif ($_SESSION['QUYENSD'] == "Nhan Vien"): ?>
                                    <li><a href="hoadon.php"><center><img src="icon/bills.png" height="30" ></center>HÓA ĐƠN</a> </li>
                                <?php else:   ?>
                                    <li><a href="giohang.php"><center><img src="icon/shopping_cart.png" height="30" ></center>GIỎ HÀNG</a> </li>
                                <?php endif ?>
                            </ul>
                    </div>
                  </form>
                </div>             
                <div class="col-sm-2">
                   <form class="form-inline" role="form">
                        <div class="input-group has-success">
                            <ul >
                                <?php if (!isset($_SESSION['tenkh'])): ?>
                                     <li><a href="dangsanpham.php"><center><img src="icon/writing.jpg" height="30" ></center>ĐĂNG BÀI</a> </li>
                                <?php elseif ($_SESSION['QUYENSD'] == "Administrator"): ?>
                                     <li><a href="captaikhoan.php"><center><img src="icon/edit_user-512.png" height="30" ></center>CẤP TKKH</a> </li>
                                <?php elseif ($_SESSION['QUYENSD'] == "Nhan Vien"): ?>
                                     <li><a href="xuathoadon.php"><center><img src="icon/Korawan_M_business2_10-512.png" height="30" ></center>IN HÓA ĐƠN</a> </li>
                                <?php else:   ?>
                                     <li><a href="dangsanpham.php"><center><img src="icon/writing.jpg" height="30" ></center>ĐĂNG BÀI</a> </li>
                                <?php endif ?>
                            </ul>
                        
                    </div>
                  </form>
                </div>
                <div class="col-sm-2">
                   <form class="form-inline" role="form">
                        <div class="input-group has-success">
                            <ul>
                                 <li><a href="khuyenmai.php"><center><img src="icon/sale.png" height="30" ></center>KHUYẾN MÃI</a> </li>
                            </ul>
                    </div>
                  </form>
                </div>
                <div class="col-sm-2">
                  <form class="form-inline" role="form">
                    <div class="input-group has-success">
                        <ul>
                                <?php if (!isset($_SESSION['tenkh'])): ?>
                                        <li><a href="sanpham.php"><center><img src="icon/icon_55-512.png" height="30" ></center>SẢN PHẨM</a> </li>
                                <?php elseif ($_SESSION['QUYENSD'] == "Administrator"): ?>
                                        <li><a href="capnhap_sanpham.php"><center><img src="icon/icon_55-512.png" height="30" ></center>SẢN PHẨM</a></li>
                                <?php else:   ?>
                                        <li><a href="sanpham.php"><center><img src="icon/icon_55-512.png" height="30" ></center>SẢN PHẨM</a> </li>
                                <?php endif ?>
                            </ul>
                    </div>
                      </form>
                </div>
                <div >
                   <form class="form-inline" role="form">
                        <div class="input-group has-success">
                            <ul>               
                                <?php if (!isset($_SESSION['tenkh'])): ?>
                                    <li><a href="doimatkhau.php"><center><img src="icon/changepass.png" height="30" ></center>ĐỔI MẬT KHẨU</a> </li>
                                <?php elseif ($_SESSION['QUYENSD'] == "Administrator"): ?>
                                    <li><a href="doimatkhau_qtv.php"><center><img src="icon/changepass.png" height="30" ></center>ĐỔI MẬT KHẨU</a> </li>
                                 <?php elseif ($_SESSION['QUYENSD'] == "Nhan Vien"): ?>
                                    <li><a href="doimatkhau_nv.php"><center><img src="icon/changepass.png" height="30" ></center>ĐỔI MẬT KHẨU</a> </li>
                                <?php else:   ?>
                                         <li><a href="doimatkhau.php"><center><img src="icon/changepass.png" height="30" ></center>ĐỔI MẬT KHẨU</a> </li>
                                <?php endif ?>
                            </ul>
                    </div>
                  </form>
                </div>
 
   
                </div>
                
        </div>
                </div>
        
       <div class="row">
                <div class="panel panel-info" >
                    <div class="panel-heading"><center><h4>CẤP TÀI KHOẢN KHÁCH HÀNG</h4></center></div>
                        <form  method="get">
                        <div class="panel-body">
                        <div class="from-group col-sm-4">
                             <label for="sel1">Chọn loại tài khoản:</label>
                                    <select class="form-control " name="select" id='sel1'>
                                        <option value="">--Chọn--</option>
                                        <option value="chuacap">Chưa Cấp</option>
                                        <option value="dacap">Đã Cấp</option>
                                        <option value="tatca">Tất cả</option>
      </select> 
                            <br>

                            <input class="btn btn-info" type="submit" name="tim" value="Tìm" />
            </div>
                            <br>
        </form>
    <br><br><br><br><br>
        <table class="table col-sm-9" 
               align="center" border="1">
                    <tr>
                        <th><center>TÊN KHÁCH HÀNG</center></th>
                        <th><center>EMAIL</center></th>
                        <th><center>SỐ TÀI KHOẢN</center></th>
                        <th><center>CẤP TÀI KHOẢN</center></th>
        
                    </tr>
     <?php       
                require_once "connection.php";

               if(isset($_GET['select']) && ($_GET['select']=='')){    
                  echo '<script>alert("Vui lòng chọn loại tài khoản!!!!");</script>';        
            }else{
                //neu nhấn nút tìm kiếm thì xử lí
                if(isset($_GET["select"]) && isset($_GET["tim"]) && $_GET['select']=='dacap' ){
                     //lay makh trong bang dang ký
                            $sql = "SELECT TENKH FROM dangky WHERE TINHTRANG = 'da cap' ";
                            $result = $conn->query($sql);
                        
                    if ($result->num_rows > 0){
                        while ($row = mysqli_fetch_assoc($result))
                             {
                            
                                $TENKH = $row['TENKH'];   
                        $sql1 = "SELECT * FROM khachhang where TENKH = '$TENKH'";
                        $result1= $conn->query($sql1);
                    if ($result1 ->num_rows > 0){
                        while ($row = mysqli_fetch_array($result1))
                            
                             {
                                    echo "<tr>";
                                    echo "<td><strong><center>$row[TENKH]</center></strong></td>";
                                    echo "<td><strong><center>$row[EMAIL]</center></strong></td>";
                                    echo "<td><strong><center>$row[SOTAIKHOAN]</center></strong></td>";
                                    echo "<td>";
                                        echo "<a class='btn btn-info col-sm-4 col-sm-offset-1' href='caplai_tk.php?TENKH=$row[TENKH]'>Cấp lại</a>";
                                        echo "<a class='btn btn-danger col-sm-4 col-sm-offset-2' href='xoa_tk.php?TENKH=$row[TENKH]'>Xóa</a>";
                                    echo"</td>";
                                    echo "</tr>";
                            
                                        }
                                }
                            }
                        }
                    }
            //lay tai khoan khach hang chua cap
                if(isset($_GET["select"]) && isset($_GET["tim"]) && $_GET['select']=='chuacap' ){
                    
                    require_once "connection.php";
                      //lay makh trong bang dang ký
                            $sql = "SELECT TENKH FROM dangky WHERE TINHTRANG IS NULL";
                            $result = $conn->query($sql);

                    if ($result->num_rows > 0){
                        while ($row = mysqli_fetch_assoc($result))
                             {
                            
                            $TENKH = $row['TENKH'];
                        
                        $sql1 = "SELECT * FROM khachhang where TENKH = '$TENKH'";
                        $result1= $conn->query($sql1);
                            if ($result1 ->num_rows > 0){
                                while ($row = mysqli_fetch_array($result1))
                                    {
                                    echo "<tr>";
                                    echo "<td><strong><center>$row[TENKH]</center></strong></td>";
                                    echo "<td><strong><center>$row[EMAIL]</center></strong></td>";
                                    echo "<td><strong><center>$row[SOTAIKHOAN]</center></strong></td>";
                                    echo "<td>";
                                        echo "<a class='btn btn-info col-sm-4 col-sm-offset-1' href='cap_tk.php?TENKH=$row[TENKH]'>Cấp</a>";
                                        echo "<a class='btn btn-danger col-sm-4 col-sm-offset-2' href='xoa_tk.php?TENKH=$row[TENKH]'>Xóa</a>";
                                    echo"</td>";
                                    echo "</tr>";
                                        }
                                    }
                                }
                            }
                        }
                   
            //lay tat ca cac tài khoản khách hàng
                   if(isset($_GET["select"]) && isset($_GET["tim"]) && $_GET['select']=='tatca' ){
                    
                     //lay makh trong bang dang ký
                            $sql = "SELECT TENKH FROM dangky";
                            $result = $conn->query($sql);
                        
                    if ($result->num_rows > 0){
                        while ($row = mysqli_fetch_assoc($result))
                             {
                               $TENKH = $row['TENKH'];
                        $sql1 = "SELECT * FROM khachhang WHERE TENKH = '$TENKH'";
                        $result1= $conn->query($sql1);
                    if ($result1 ->num_rows > 0){
                        while ($row = mysqli_fetch_array($result1))
                            
                             {
                                    echo "<tr>";
                                    echo "<td><strong><center>$row[TENKH]</center></strong></td>";
                                    echo "<td><strong><center>$row[EMAIL]</center></strong></td>";
                                    echo "<td><strong><center>$row[SOTAIKHOAN]</center></strong></td>";
                                    echo "<td>";
                                        echo "<a class='btn btn-info col-sm-4 col-sm-offset-1' href='caplai_tk.php?TENKH=$row[TENKH]'>Cấp lại</a>";
                                        echo "<a class='btn btn-danger col-sm-4 col-sm-offset-2' href='xoa_tk.php?TENKH=$row[TENKH]'>Xóa</a>";
                                    echo"</td>";
                                    echo "</tr>";
                                        }
                                }
                            }
                        }
                    }
                    }
                ?>
                  
        
                </div><br>
                
                </table>
                 <div>
                    <a class="btn btn-danger" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Xóa Tất Cả</a>
                            <span>Cảnh báo: <span style="color:red">KHÔNG</span> thể khôi phục khi xóa tất cả!</span>
                </div>
    <!--MODAL XÓA TẤT CẢ TÀI KHOẢN KHÁCH HÀNG-->                
    <form action="captaikhoan.php" method="post">                
        <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

                <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><center>CẢNH BÁO</center></h4>
            </div>
        <div class="modal-body">
                <H5>BẠN CÓ CHẮC CHẮN MUỐN <STRONG>XÓA HẾT</STRONG> TẤT CẢ TÀI KHOẢN KHÁCH HÀNG KHỎI CSDL?</H5>
            </div>
        <div class="modal-footer">
            <ul class="nav nav-pills col-sm-offset-4">
                 <li><input type="submit" class="btn btn-default" name="all" value="Xóa tất cả"> </li>
            <li><button type="button" class="btn btn-default col-sm-offset-2" data-dismiss="modal">Hủy</button></li>
             </ul>           
      </div>
    </div>
  </div>
</div>                      
</form> 

<?php
    require_once('connection.php');

//KHI ADMIN NHAN NUT XAC NHAN XOA TẤT CẢ
if(isset($_POST['all'])){
    //XÓA TẤT CẢ TÀI KHOẢN KHÁCH HÀNG
    $sql ="DELETE FROM dangky";
    if($conn->query($sql) == TRUE){
            $sql1 = "DELETE FROM khachhang";      
    if($conn->query($sql1) == TRUE){
                echo '<script>alert("Đã xóa tất cả tài khoản KHÁCH HÀNG ra khỏi CSDL!!!!");</script>';
        }  
    }
}
?>                    
           </div>         
                   
                </div>
           </div>
    </div>       
</body>

</html>
