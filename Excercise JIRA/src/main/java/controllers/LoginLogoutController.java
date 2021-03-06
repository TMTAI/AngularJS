package controllers;

import ninja.Result;
import ninja.Results;
import ninja.params.Param;
import ninja.session.Session;
import org.apache.log4j.Logger;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import service.HTTPClientUtil;
import util.Constant;
import util.JSONUtil;

import java.io.IOException;
import java.net.Proxy;
import java.util.Map;

import static service.UserService.getUserInformation;
import static util.Constant.*;

/**
 * Created by tmtai on 7/14/2017.
 */
public class LoginLogoutController {
    public static final Logger logger = Logger.getLogger(LoginLogoutController.class);

    public Result login(Session session) {
        if (session != null) {
            if (session.get("cookies") != null) {
                return Results.redirect("/");
            }
        }

        return Results.html();
    }

    public Result logout(Session session) {
        if (!session.isEmpty()){
            session.clear();
        }
        return Results.redirect("/");
    }

    public static boolean doLogin(String username, String password, Session session) throws Exception {

        Proxy proxy = HTTPClientUtil.getInstance().getProxy();
        Connection.Response respond;

        if (proxy == null) {
            respond = Jsoup.connect(LOGIN_LINK).data(USERNAME_LOGIN_KEY, username).data(PASSWORD_LOGIN_KEY, password)
                    .data(REMEMBER_LOGIN_KEY, "true").method(Connection.Method.POST).timeout(CONNECTION_TIMEOUT).execute();
        } else {
            respond = Jsoup.connect(LOGIN_LINK).data(USERNAME_LOGIN_KEY, username).data(PASSWORD_LOGIN_KEY, password)
                    .data(REMEMBER_LOGIN_KEY, "true").method(Connection.Method.POST).proxy(HTTPClientUtil.getInstance().getProxy()).timeout(CONNECTION_TIMEOUT).execute();
        }

        if (respond.header("X-AUSERNAME").equals(username)) {
            session.put("cookies", respond.cookies().toString());
            session.put(Constant.USERNAME, username);

            //login to crucible
            if (!loginCrucible(username, password, session)) {
                return false;
            }

        } else {
            if (respond.header("X-AUSERNAME").equals(LOGININFO_INVALID)) {
                logger.error("Can not login to jira");
                return false;
            }
        }
        return true;
    }

    public Result loginPost(@Param("username") String username,
                            @Param("password") String password,
                            @Param("rememberMe") Boolean rememberMe, Session session) {
        try {
            if (doLogin(username, password, session)) {
                getUserInformation(session);
                if (rememberMe != null && rememberMe) {
                    session.setExpiryTime(EXPIRE_TIME_30DAYS);
                }
                return Results.redirect("/");
            } else {
                return Results.redirect("/login#incorrectinfo");
            }
        } catch (Exception e) {
            session.clear();
            logger.error(e);
            return Results.redirect("/login#connectionfailed");
        }
    }

    static boolean loginCrucible(String username, String password, Session session) {
        try {
            Proxy proxy = HTTPClientUtil.getInstance().getProxy();
            Connection.Response cruRespond;

            if (proxy == null) {
                cruRespond = Jsoup.connect(LINK_CRUCIBLE + "/login").data(Constant.USERNAME, username).data(Constant.PASSWORD, password)
                        .data("rememberme", "yes").method(Connection.Method.POST).timeout(CONNECTION_TIMEOUT).execute();

            } else {
                cruRespond = Jsoup.connect(LINK_CRUCIBLE + "/login").data(Constant.USERNAME, username).data(Constant.PASSWORD, password)
                        .data("rememberme", "yes").method(Connection.Method.POST).proxy(proxy).timeout(CONNECTION_TIMEOUT).execute();

            }

            session.put("crucookies", cruRespond.cookies().toString());


            if (cruRespond.header("X-AUSERNAME").equals(LOGININFO_INVALID)) {
                return false;
            } else {
                if (cruRespond.header("X-AUSERNAME").equals(username)) {
                    return true;
                } else {
                    return false;
                }
            }
        } catch (Exception e) {
            logger.error("loginCrucible", e);
            return false;
        }
    }

    public Result loginCru(@Param("username") String username,
                           @Param("password") String password, Session session) {
        try {
            if (loginCrucible(username, password, session)) {
                return Results.ok();
            } else {
                return Results.unauthorized();
            }
        } catch (Exception e) {
            return Results.internalServerError();
        }
    }

    public Result clearSession(Session session) {
        if (!session.isEmpty()){
            session.clear();
        }
        return Results.ok();
    }
}
