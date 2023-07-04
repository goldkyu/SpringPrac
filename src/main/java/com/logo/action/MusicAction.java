package com.logo.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.logo.model.Album;
import com.logo.model.ChartMusic;
import com.logo.model.Music;
import com.logo.model.User;
import com.logo.model.UserListen;

@Repository
public class MusicAction {
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	DataSource dataSource;

	public List<Album> selectNewAlbums() {
		// TODO Auto-generated method stub
		List<Album> albums = null;
		albums = sqlSession.selectList("com.logo.mybatis.mapper.selectNewAlbums");

		return albums;
	}

	public List<Music> selectTopChart() {
		// TODO Auto-generated method stub
		List<Music> musics = null;
		musics = sqlSession.selectList("com.logo.mybatis.mapper.selectTopChart");
		return musics;
	}

	public List<UserListen> selectUserListen(User user) {
		// TODO Auto-generated method stub
		List<UserListen> userListens = null;
		userListens = sqlSession.selectList("com.logo.mybatis.mapper.selectUserListen", user);
		return userListens;
	}

	public List<Music> selectUserMusic(User user) {
		// TODO Auto-generated method stub
		List<Music> userMusics = null;
		userMusics = sqlSession.selectList("com.logo.mybatis.mapper.selectUserMusic", user);
		return userMusics;
	}

	public void insertListen(String m_name, String u_id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
	}

}
