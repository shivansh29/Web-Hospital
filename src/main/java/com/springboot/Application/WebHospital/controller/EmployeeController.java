package com.springboot.Application.WebHospital.controller;


import java.io.*;
import java.util.*;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.springboot.Application.WebHospital.Services.CustomerService;
import com.springboot.Application.WebHospital.modal.customer;


@Controller
public class EmployeeController {
	
	@Autowired
	private CustomerService custServ;

	@RequestMapping("/QRCode")
	public String QrCode(@RequestParam("medi") String[] medicines,@RequestParam("dose") String[] Doses,Model model) {
		try {
		String details="";
        for(int i=0;i<medicines.length;i++){
            details+=medicines[i]+"-"+Doses[i];
            details+="---";
        }/*
        ByteArrayOutputStream out= QRCode.from(details).to(ImageType.JPG).stream();
        File f= new File("C:\\Users\\Narci\\Desktop\\frontend\\Myqr3.jpg");
        System.out.println(f.getAbsolutePath());
        FileOutputStream fs= new FileOutputStream(f);
        fs.write(out.toByteArray());
        fs.flush();
        fs.close();*/
        
        String charset = "UTF-8";
        String filePath = "C:\\Users\\Narci\\Desktop\\frontend\\Myqr3.jpg";
        Map < EncodeHintType, ErrorCorrectionLevel > hintMap = new HashMap < EncodeHintType, ErrorCorrectionLevel > ();
        hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
        BitMatrix matrix = new MultiFormatWriter().encode(
            new String(details.getBytes(charset), charset),
            BarcodeFormat.QR_CODE, 200, 200, hintMap);
        MatrixToImageWriter.writeToFile(matrix, filePath.substring(filePath
            .lastIndexOf('.') + 1), new File(filePath));
        System.out.println("QR Code image created successfully!");

        model.addAttribute("file", "file");
		return "Doctor";
		}
		catch(Exception e) {
			System.out.println("qr code problem");
			e.printStackTrace();
			return "Error";
		}
	}
	
	@RequestMapping("/DownloadFile")
	public String Download(HttpServletResponse response) {
		try{
			
			PrintWriter out = response.getWriter();  
			String filename = "Myqr3.jpg";   
			String filepath = "C:\\Users\\Narci\\Desktop\\frontend\\";   
			response.setContentType("APPLICATION/OCTET-STREAM");   
			response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
			  
			FileInputStream fileInputStream = new FileInputStream(filepath + filename);  
			            
			int i;   
			while ((i=fileInputStream.read()) != -1) {  
			out.write(i);   
			}   
			fileInputStream.close();   
			out.close();   
			
            return "Doctor";
        }catch(Exception e){
            System.out.println("Downloading file problem");
            e.printStackTrace();
            return "Error";
        }
	}
	
	@RequestMapping("/SendMail")
	public String mail(@RequestParam("prescription") MultipartFile prescription,@RequestParam("email") String email,HttpSession session) {
		try {
			customer ct=custServ.customerExists(email);
			InputStream in = prescription.getInputStream();
			String filename=prescription.getName();
			if(ct!=null){
                final String SEmail="your email";
                final String SPass="your passowrd";
                final String REmail=email;
                final String Sub="Your prescription is here!";
                //mail send Code
            Properties props=new Properties();
            props.put("mail.smtp.host","smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port","465");
            props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth","true");
            props.put("mail.smtp.port","465");
            Session ses=Session.getInstance(props,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication(){
                    return new PasswordAuthentication(SEmail,SPass);
                }
            }
            );
            Message message=new MimeMessage(ses);
            message.setFrom(new InternetAddress(SEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(REmail));
            message.setSubject(Sub);
            
            BodyPart messageBodyPart = new MimeBodyPart();
             messageBodyPart.setText("This is your prescription here");
             Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart);
            messageBodyPart = new MimeBodyPart(); 
            
           // File filep=new File(prescription);
            DataSource source = new FileDataSource("C:\\Users\\Narci\\Desktop\\frontend\\Myqr3.jpg");
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName(filename);
            multipart.addBodyPart(messageBodyPart);
             message.setContent(multipart);
            
            Transport.send(message);
            session.setAttribute("msg","Mail Sent successfully.");
            }
			else{
                session.setAttribute("msg", "Wrong Emial ID");
            }
			return "Doctor";
		}
		catch(Exception e) {
		e.printStackTrace();
		return "Error";
		}
	}

	

}
