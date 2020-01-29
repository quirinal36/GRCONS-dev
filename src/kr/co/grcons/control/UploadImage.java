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
    	response.setCharacterEncoding("UTF-8");
    	
    	String dir = getServletContext().getRealPath("/upload");	// 폴더를 지정
    	File dirs = new File(dir);									// 위 폴더가 없으면 새로 만들기
    	if(!dirs.exists()) {
    		dirs.mkdirs();
    	}
    	
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
			
			File file = request.getFile(name);			// 처음 업로드된 파일
			System.out.println(file.getAbsolutePath());
			
			String newFilenameBase = UUID.randomUUID().toString();	// 이름이 겹치지 않게 RandomUUID 만든다.
            String originalFileExtension = originalName.substring(originalName.lastIndexOf("."));	// 파일 확장자명
            String newFilename = newFilenameBase + originalFileExtension;	// RandomUUID + 확장자명
            String srcPath = new FileUtil().makeUserPath();			// 저장할 장소
            
            File newFile = new File(srcPath + "/" + newFilename);		// 저장소에 새로 생성될 파일 (아직은 가짜)
            System.out.println(newFile.getAbsolutePath());
            
            fileCopy(file, newFile);		// 업로드된 파일을 새로운 저장소로 옮긴다.
            
            File thumbnailFile = makeThumbnail(newFile, newFilenameBase);	// 썸네일 파일을 새로 만든다.
            
            /**
             * 데이터베이스에 저장할 파일정보
             */
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
            
            // ID 값이 생성된 후 정보를 셋팅해야한다.
            photo.setUrl("/upload/get/"+photo.getId());
            photo.setThumbnailUrl(req.getContextPath() + "/thumbnail/"+photo.getId());
            
            result.put("file", new JSONObject(photo.toString()));
		}
		
		PrintWriter out = response.getWriter();
		out.append(result.toString());
	}
    
    public void fileCopy(File orgFile, File newFile) {
        if(orgFile.exists()) {
            orgFile.renameTo(newFile);
            orgFile.delete();
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
