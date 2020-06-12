package com.liudisi.controller;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.ShearCaptcha;
import cn.hutool.http.HttpResponse;
import com.liudisi.domain.User;
import com.liudisi.constast.SystemConstast;
import com.liudisi.service.LogInfoService;
import com.liudisi.service.UserService;
import com.liudisi.utils.WebUtils;
import com.liudisi.vo.LogInfoVo;
import com.liudisi.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * @author liudisi
 * 用户登录Controller
 */
@Controller
@RequestMapping("userLogin")
public class LoginController {
    @Autowired
    private UserService userService;

    @Autowired
    private LogInfoService logInfoService;

    /**
     * 跳转到登录页面
     */
    @RequestMapping("toLogin")
    public String toLogin() {
        return "system/main/login";
    }

    /**
     * 用户登录
     *
     * @param userVo
     * @param model
     * @return
     */
    @RequestMapping("login")
    public String login(UserVo userVo, Model model) {
        String verifyCode = WebUtils.getHttpSession().getAttribute("verifyCode").toString();
        if (userVo.getVerifyCode().equals(verifyCode)){
            User user = userService.login(userVo);
            if (user != null) {
                //方法session
                WebUtils.getHttpSession().setAttribute("user", user);
                //记录登录日志，向sys_log_login表插入数据
                LogInfoVo logInfoVo = new LogInfoVo();
                logInfoVo.setLoginTime(new Date());
                logInfoVo.setLoginName(user.getRealName() + "-" + user.getLoginName());
                logInfoVo.setLoginIp(WebUtils.getHttpServletRequest().getRemoteAddr());
                logInfoService.addLogInfo(logInfoVo);
                return "system/main/index";
            } else {
                model.addAttribute("error", SystemConstast.USER_LOGIN_ERROR_MSG);
                return toLogin();
            }
        }else {
            model.addAttribute("error", SystemConstast.USER_LOGIN_VERIFY_CODE_ERROR_MSG);
            return toLogin();
        }
    }

    /**
     * 登录验证码
     *
     * @param response
     */
    @RequestMapping("getVerifyCode")
    public void getVerifyCode(HttpServletResponse response) {
        try {
            //定义图形验证码的长、宽、验证码字符数、干扰线宽度
            ShearCaptcha captcha = CaptchaUtil.createShearCaptcha(116, 36, 4, 2);
            WebUtils.getHttpSession().setAttribute("verifyCode", captcha.getCode());
            ServletOutputStream outputStream = response.getOutputStream();
            ImageIO.write(captcha.getImage(), "jpeg", outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
