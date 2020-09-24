package com.oracle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@Controller
public class RandomCodeController
{
    @GetMapping("/randomcode")
    public void getRandomCode(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws IOException {
        int width = 63;
        int height = 37;
        Random random = new Random();

        //设置response头信息，禁止缓存
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        //生成缓冲区并绘制
        BufferedImage image = new BufferedImage(width, height, 1);
        Graphics graphics = image.getGraphics();
        //样式
        graphics.setColor(this.getRandomColor(200, 250));
        graphics.setFont(new Font("Fira Code", 0, 28));
        graphics.fillRect(0, 0, width, height);
        //干扰线
        for (int i=0; i<40; i++) {
            graphics.setColor(this.getRandomColor(130, 200));
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int x1 = random.nextInt(12);
            int y1 = random.nextInt(12);
            graphics.drawLine(x, y, x+x1, y+y1);
        }

        //绘制字符
        StringBuilder strCode = new StringBuilder();
        for (int i=0; i<4; i++) {
            String rand = String.valueOf(random.nextInt(10));
            strCode.append(rand);
            graphics.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
            graphics.drawString(rand, 13*i+6, 28);
        }
        //保存到session用于前端验证
        session.setAttribute("rdmCode", strCode.toString());
        graphics.dispose();

        ImageIO.write(image, "JPEG", response.getOutputStream());
        response.getOutputStream().flush();
    }

    private Color getRandomColor(int fc, int bc)
    {
        Random random = new Random();

        if (fc > 255) {
            fc = 255;
        }
        if (bc > 255) {
            bc = 255;
        }
        int r = fc + random.nextInt(bc-fc);
        int g = fc + random.nextInt(bc-fc);
        int b = fc + random.nextInt(bc-fc);
        return new Color(r, g, b);
    }
}