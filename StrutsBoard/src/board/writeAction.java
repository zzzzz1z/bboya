package board;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class writeAction extends ActionSupport {
	
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체.
	
	private boardVO paramClass;	//파라미터를 저장할 객체
	private boardVO resultClass;	//쿼리 결과 값을 저장할 객체
	
	private int currentPage;	//현재 페이지
	
	private int no;
	private String subject;
	private String name;
	private String password;
	private String content;
	private String filr_orgName;	//업로드 파일의 원래 이름
	private String file_savName;	//서버에 저장할 업로드 파일의 이름. 고유번호로 구분한다.
	Calendar today=Calendar.getInstance();	//오늘 날짜 구하기
	
	private File upload;	//파일 객체
	private String uploadContentType;	//컨텐츠 타입
	private String uploadFileName;	// 파일 이름
	private String fileUploadPath="C:\\java\\upload\\";	//업로드 경로
	
	//생성자
	public writeAction() throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");	//sqlMapConfig.xml 파일의 설정 내용을 가져온다.
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);	//sqlMapConfig/xml의 내요을 적용한 sqlMapper 객체 생성
		reader.close();
	}
	
	public String form() throws Exception{
		//등록 폼
		return SUCCESS;
	}
	
	public String execute() throws Exception{
		
		//파라미터와 리절트 객체 생성
		paramClass=new boardVO();
		resultClass=new boardVO();
		
		//등록할 항목 설정
		paramClass.setSubject(getSubject());
		paramClass.setName(getName());
		paramClass.setPassword(getPassword());
		paramClass.setContent(getContent());
		paramClass.setRegdate(today.getTime());
		
		//등록 쿼리 수행
		sqlMapper.insert("insertBoard", paramClass);
		
		//첨부파일을 선택했다면 파일을 업로드한다.
		if(getUpload()!=null) {
			
			//등록한 글 번호 가져오기
			resultClass=(boardVO) sqlMapper.queryForObject("selectLastNo");
			
			//실제 서버에 저장될 파일 이름과 확장자 설정
			String file_name="file_" +resultClass.getNo();
			String file_ext=getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
			
			//서버에 파일 저장
			//File destFile
		}
	}

	public boardVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(boardVO paramClass) {
		this.paramClass = paramClass;
	}

	public boardVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(boardVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFilr_orgName() {
		return filr_orgName;
	}

	public void setFilr_orgName(String filr_orgName) {
		this.filr_orgName = filr_orgName;
	}

	public String getFile_savName() {
		return file_savName;
	}

	public void setFile_savName(String file_savName) {
		this.file_savName = file_savName;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

}










































