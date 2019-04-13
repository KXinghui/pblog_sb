package site.xinghui.pblog_sb.pojo;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import site.xinghui.pblog_sb.enums.GroupType;
import site.xinghui.pblog_sb.enums.Visibility;
import site.xinghui.pblog_sb.validator.Insert;
import site.xinghui.pblog_sb.validator.Update;

//@Alias("group")
public class Group {
	@NotNull(groups = { Update.class })
	private Integer id;
	@NotBlank(groups = { Insert.class, Update.class })
	private String name;
	private Visibility visibility;
	private GroupType groupType;
	private Integer uid;

	/* 非数据字段 */
	private List<User> users;
	private List<Article> articles;

	private List<UserFollow> userFollows;
	private List<ArticleFavority> articleFavorities;

	public Group() {

	}

	public Group(@NotBlank(groups = { Insert.class, Update.class }) String name, Visibility visibility,
			GroupType groupType, Integer uid) {
		super();
		this.name = name;
		this.visibility = visibility;
		this.groupType = groupType;
		this.uid = uid;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Visibility getVisibility() {
		return visibility;
	}

	public void setVisibility(Visibility visibility) {
		this.visibility = visibility;
	}

	public GroupType getGroupType() {
		return groupType;
	}

	public void setGroupType(GroupType groupType) {
		this.groupType = groupType;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}

	public List<UserFollow> getUserFollows() {
		return userFollows;
	}

	public void setUserFollows(List<UserFollow> userFollows) {
		this.userFollows = userFollows;
	}

	public List<ArticleFavority> getArticleFavorities() {
		return articleFavorities;
	}

	public void setArticleFavorities(List<ArticleFavority> articleFavorities) {
		this.articleFavorities = articleFavorities;
	}

	@Override
	public String toString() {
		return "Group [id=" + id + ", name=" + name + ", visibility=" + visibility + ", groupType=" + groupType
				+ ", uid=" + uid + ", users=" + users + ", articles=" + articles + "]";
	}

}
