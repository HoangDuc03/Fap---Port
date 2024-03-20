/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Event;
import DAO.DAOView;
import jakarta.servlet.ServletRequestAttributeListener;
import jakarta.servlet.ServletRequestAttributeEvent;
import jakarta.servlet.ServletRequestEvent;
import jakarta.servlet.ServletRequestListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class Event implements ServletRequestAttributeListener,ServletRequestListener{

    @Override
    public void attributeReplaced(ServletRequestAttributeEvent srae) {
        ServletRequestAttributeListener.super.attributeReplaced(srae); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public void attributeRemoved(ServletRequestAttributeEvent srae) {
        ServletRequestAttributeListener.super.attributeRemoved(srae); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public void attributeAdded(ServletRequestAttributeEvent srae) {
        ServletRequestAttributeListener.super.attributeAdded(srae); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public void requestInitialized(ServletRequestEvent sre) {
        DAOView ob = new DAOView();
        ob.IncreateView();
        System.out.println("start");
    }

    @Override
    public void requestDestroyed(ServletRequestEvent sre) {
        System.out.println("end");
    }
    
    
    
}
