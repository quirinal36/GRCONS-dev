package kr.co.grcons.control;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.imgscalr.Scalr;
import org.json.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.grcons.util.FileUtil;
import kr.co.grcons.vo.PhotoInfo;

/**
 * Servlet implementation class UploadImage
 */
@WebServlet("/upload/image")
public class UploadImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadImage() {
        super();
        // TODO Auto-generated constructor stub
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	System.out.println("doget");
    }
    
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/json; charset=UTF-8");

    	String dir = getServletContext().getRealPath("/upload");
    	File dirs = new File(dir);
    	if(!dirs.exists()) {
    		dirs.mkdirs();
    	}
    	response.setCharacterEncoding("UTF-8");
    	
    	MultipartRequest request = new MultipartRequest(
    			req,
    			dir,
    			5*1024*1024,
    			"UTF-8",
    			new DefaultFileRenamePolicy());
    	
		JSONObject result = new JSONObject();
		Enumeration<?> files = request.getFileNames();
		while(files.hasMoreElements()) {
			String name = (String)files.nextElement();
			String originalName = request.getOriginalFileName(name);
			String type = request.getContentType(name);
			
			File file = request.getFile(name);
			System.out.println(file.getAbsolutePath());
			
			String newFilenameBase = UUID.randomUUID().toString();
            String originalFileExtension = originalName.substring(originalName.lastIndexOf("."));
            String newFilename = newFilenameBase + originalFileExtension;
            String srcPath = new FileUtil().makeUserPath();
            
            File newFile = new File(srcPath + "/" + newFilename);
            System.out.println(newFile.getAbsolutePath());
            
            fileCopy(file, newFile);
            
            File thumbnailFile = makeThumbnail(newFile, newFilenameBase);
            
            PhotoInfo photo = new PhotoInfo();
            photo.setName(originalName);
            photo.setThumbnailFilename(thumbnailFile.getName());
            photo.setNewFilename(newFilename);
            photo.setSize((int)newFile.length());
            photo.setThumbnailSize((int)thumbnailFile.length());
            photo.setContentType(type);
            
            // DB 에 입력하기 ID auto generation
            /*
             * 
             * */
            
            photo.setUrl("/upload/get/"+photo.getId());
            photo.setThumbnailUrl(req.getContextPath() + "/thumbnail/"+photo.getId());
            
            file.delete();
            result.put("file", new JSONObject(photo.toString()));
		}
		
		PrintWriter out = response.getWriter();
		out.append(result.toString());
	}
    
    public void fileCopy(File orgFile, File newFile) {
        if(orgFile.exists()) {
            orgFile.renameTo(newFile);
        }
    }

    private File makeThumbnail(File originFile, String newFilenameBase)throws IOException{
		// 저장된 원본파일로부터 BufferedImage 객체를 생성합니다.
		// File originFile = new File(filePath);
		BufferedImage srcImg = ImageIO.read(originFile); 
		// 썸네일의 너비와 높이 입니다. 
		int dw = 150, dh = 120; 
		// 원본 이미지의 너비와 높이 입니다. 
		int ow = srcImg.getWidth(); 
		int oh = srcImg.getHeight(); 
		// 원본 너비를 기준으로 하여 썸네일의 비율로 높이를 계산합니다. 
		int nw = ow; 
		int nh = (ow * dh) / dw; 
		// 계산된 높이가 원본보다 높다면 crop이 안되므로 
		// 원본 높이를 기준으로 썸네일의 비율로 너비를 계산합니다. 
		if(nh > oh) { 
			nw = (oh * dw) / dh; 
			nh = oh; 
		}
		// 계산된 크기로 원본이미지를 가운데에서 crop 합니다. 
		BufferedImage cropImg = Scalr.crop(srcImg, (ow-nw)/2, (oh-nh)/2, nw, nh);
		
		BufferedImage thumbnail = Scalr.resize(cropImg, dw, dh);
		
        String thumbnailFilename = newFilenameBase + "-thumbnail.png";
        File thumbnailFile = new File(originFile.getParent() + "/" + thumbnailFilename);
        ImageIO.write(thumbnail, "png", thumbnailFile);
        
        return thumbnailFile;
        
	}
}
