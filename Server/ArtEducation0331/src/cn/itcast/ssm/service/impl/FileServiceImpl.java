package cn.itcast.ssm.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import cn.itcast.ssm.mapper.FileMapper;
import cn.itcast.ssm.po.File;
import cn.itcast.ssm.service.FileService;

public class FileServiceImpl implements FileService{

	@Autowired
	private FileMapper fileMapper;
	
	@Override
	public Integer insertFile(String fileName, java.io.File file) {
		// TODO Auto-generated method stub
		Integer fileId = 0;
		File newFile = new File();
		newFile.setFileName(fileName);
		newFile.setFileSize((int)file.length());
		newFile.setFileType(fileName.substring(fileName.lastIndexOf(".")));
		newFile.setDate(new Date());
		newFile.setFilePath("");
		try {
			fileId = fileMapper.insertFile(newFile);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fileId;
	}

}
