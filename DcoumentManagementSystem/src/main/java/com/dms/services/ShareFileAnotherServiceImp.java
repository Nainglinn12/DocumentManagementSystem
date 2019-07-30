package com.dms.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.dao.ShareFileAnotherDao;
import com.dms.entity.Share_files;
@Service
public class ShareFileAnotherServiceImp implements ShareFileAnotherService {

	@Autowired
	private ShareFileAnotherDao sharefile;
	@Override
	public List<Share_files> shareFile(String userName) {
		// TODO Auto-generated method stub
		
		return sharefile.shareFile(userName);
	}
	@Override
	public List<Share_files> shareFileAnother(String userName) {
		// TODO Auto-generated method stub
		return sharefile.shareFileAnother(userName);
		}

}