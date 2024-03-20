/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controll;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import jakarta.servlet.jsp.*;
import java.io.IOException;

/**
 *
 * @author Admin
 */
public class ConvertToVnDate extends SimpleTagSupport{
    private String value ;

    public void setValue(String value) {
        this.value = value;
    }
    
    @Override
    public void doTag() throws JspException, IOException {
        JspWriter out = getJspContext().getOut();
        String[] split = value.split("-");
        if(split.length>3)
        {
            out.print("ERROR");
        }
        else
        {
            out.print("Ngay "+split[1]+", thang "+split[0]+", nam"+split[2]);
        }
        
    }
    
}
