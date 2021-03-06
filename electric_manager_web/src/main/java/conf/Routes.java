
package conf;


import controllers.LoginLogoutController;
import ninja.AssetsController;
import ninja.Router;
import ninja.application.ApplicationRoutes;
import controllers.ApplicationController;
import service.*;

public class Routes implements ApplicationRoutes {

    @Override
    public void init(Router router) {  
        
        router.GET().route("/").with(ApplicationController::index);
        router.GET().route("/login").with(LoginLogoutController::login);
        router.GET().route("/logout").with(LoginLogoutController::logout);

        router.GET().route("/getKhuVuc").with(ApplicationController::getKhuVuc);
        router.GET().route("/getThanhPho").with(ApplicationController::getThanhPho);
        router.GET().route("/getAllKhachHang").with(KhachHangService::getAllKhachHang);
        router.GET().route("/getListKhachHang").with(KhachHangService::getKhachHangStatistic);
        router.POST().route("/addKhachHang").with(KhachHangService::addKhachHang);
        router.POST().route("/deleteKhachHang").with(KhachHangService::deleteKhachHang);


        router.GET().route("/getAllUsers").with(UserService::getAllUsers);
        router.GET().route("/getUser").with(UserService::getUser);
        router.GET().route("/addUser").with(UserService::addUser);
        router.POST().route("/deleteUser").with(UserService::deleteUser);

        router.POST().route("/newPasswordUser").with(UserService::newPassword);
        router.POST().route("/newPasswordKhachHang").with(KhachHangService::newPassword);

        router.GET().route("/getDienKe").with(DienKeService::getDienKe);
        router.POST().route("/updateChiSoDienKe").with(DienKeService::updateDienKe);
        router.POST().route("/addDienKe").with(DienKeService::addDienKe);

        router.GET().route("/getHoaDon").with(HoaDonService::getHoaDon);
        router.GET().route("/getNam").with(ThangNamService::getNam);
        router.GET().route("/getThang").with(ThangNamService::getThang);

        ///////////////////////////////////////////////////////////////////////
        // Assets (pictures / javascript)
        ///////////////////////////////////////////////////////////////////////    
        router.GET().route("/assets/webjars/{fileName: .*}").with(AssetsController::serveWebJars);
        router.GET().route("/assets/{fileName: .*}").with(AssetsController::serveStatic);
        
        ///////////////////////////////////////////////////////////////////////
        // Index / Catchall shows index page
        ///////////////////////////////////////////////////////////////////////
        router.GET().route("/.*").with(ApplicationController::index);
    }

}
