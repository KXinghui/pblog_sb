package site.xinghui.pblog_sb.pojo;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

//@Alias("userFollow")
public class UserFollow {
	private Integer id;
	private Integer uid;
	private Integer gid;

	/* 非数据字段 */
	private User user;
	private Group group;

	// private User Fans;

	public Integer getId() {
		return id;
	}

	public UserFollow() {
	}

	public UserFollow(Integer uid, Integer gid) {
		super();
		this.uid = uid;
		this.gid = gid;
	}

	public UserFollow(Integer id, Integer uid, Integer gid) {
		this.id = id;
		this.uid = uid;
		this.gid = gid;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	@Override
	public String toString() {
		return "UserFollow [id=" + id + ", uid=" + uid + ", gid=" + gid + ", user=" + user + ", group=" + group + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this.getClass() == obj.getClass() && obj != null) {
			UserFollow userFollow = (UserFollow) obj;
			if (userFollow.getId() != null && id != null) {
				return userFollow.getId().equals(id);
			}
		}
		return false;
	}

	@Override
	public int hashCode() {
		return id.hashCode() * 13;
	}

	public static void main(String[] args) {
		List<UserFollow> ufs = new ArrayList<>();
		UserFollow uf1 = new UserFollow(1, 1, 2);
		UserFollow uf2 = new UserFollow(1, 2, 2);
		UserFollow uf3 = new UserFollow(1, 3, 2);
		ufs.add(uf1);
		ufs.add(uf2);
		ufs.add(uf3);
		System.out.println(ufs);

		Iterator<UserFollow> iterator = ufs.iterator();
		while (iterator.hasNext()) {
			UserFollow uf = iterator.next();
			if (uf.getUid().equals(1)) {
				iterator.remove();
			}
		}
		System.out.println(ufs);
	}
}
