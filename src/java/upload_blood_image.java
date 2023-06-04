/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DataBase.DBQuery;

import Logic.info;
import com.oreilly.servlet.MultipartRequest;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sumit
 */
public class upload_blood_image extends HttpServlet {
private final String UPLOAD_DIRECTORY = info.path;
RequestDispatcher view=null;
		
int a=0,s=0,p=0;
String email="",abPath="";
BufferedInputStream  bis = null; 
BufferedOutputStream bos = null;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            System.out.println("***************************");
            String dirName =UPLOAD_DIRECTORY;
            System.out.println("????????????????????????????????"+dirName);
	    String paramname=null;
            HttpSession session=request.getSession();
            email=session.getAttribute("email").toString();
              System.out.println("....................."+email); 
           // byte[] b=null, b1=null,b2=null,b3=null;
                
   		  
			
		
            MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); 

            Enumeration files = multi.getFileNames();	
            while (files.hasMoreElements()) 
            {
                paramname = (String) files.nextElement();


                if(paramname != null && paramname.equals("file"))
                {
                    a=1;
                    abPath = multi.getFilesystemName(paramname);
                    System.out.println("file>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+abPath);
                    String fPath = dirName+abPath;
                    System.out.println("<><><><><><><><><><><><>"+fPath);

                }
            }
                        
		
            
                
               
            
                File fs=new File(info.path+abPath);
               
                File fd=new File(info.path+email+".jpg");
                File fd1=new File(info.py_path+"input.jpg");
                copyFileUsingStream(fs,fd);
                copyFileUsingStream(fs,fd1);
                fs.delete();
                File f=new File(info.py_path+"task.txt");
                FileOutputStream fout=new FileOutputStream(f);
                fout.write("predict".getBytes());
                fout.close();
                try {
                    Thread.sleep(7000);
                } catch (InterruptedException ex) {
                    Logger.getLogger(upload_blood_image.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            File file1 = new File(info.py_path+"output.txt"); 
            FileReader fr1=new FileReader(file1);
            BufferedReader br1 = new BufferedReader(fr1); 
            String st1="",b1=""; 
            while ((st1 = br1.readLine()) != null) 
            {
            System.out.println(st1);
            b1=st1;
            }
            FileOutputStream fout1=new FileOutputStream(file1);
            fout1.write("".getBytes());
            fout1.close();
            br1.close();
            fr1.close();
                
                
                
              
            RequestDispatcher rd = null;
            session.setAttribute("msg", b1);
            rd = request.getRequestDispatcher("view_result.jsp");
            rd.forward(request, response);
                
        }
    }
private static void copyFileUsingStream(File source, File dest) throws IOException {
    InputStream is = null;
    OutputStream os = null;
    try {
        is = new FileInputStream(source);
        os = new FileOutputStream(dest);
        byte[] buffer = new byte[1024];
        int length;
        while ((length = is.read(buffer)) > 0) {
            os.write(buffer, 0, length);
        }
    } finally {
        is.close();
        os.close();
    }
}
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
