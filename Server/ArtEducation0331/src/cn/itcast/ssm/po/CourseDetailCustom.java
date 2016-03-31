package cn.itcast.ssm.po;

import java.util.List;

import cn.itcast.ssm.view.CourseCommentView;

public class CourseDetailCustom extends Course{
	
	private TeacherCustom teacherCustom;

	private List<Comment> comments;
	
	public TeacherCustom getTeacherCustom() {
		return teacherCustom;
	}

	public void setTeacherCustom(TeacherCustom teacherCustom) {
		this.teacherCustom = teacherCustom;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}


	
}
