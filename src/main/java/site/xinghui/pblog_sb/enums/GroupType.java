package site.xinghui.pblog_sb.enums;

//@Alias("groupType")
public enum GroupType implements BaseEnum {
	USER_FOLLOW(0, "用户关注"), ARTICLE_FAVORITY(1, "文章收藏");
	private int id;
	private String value;

	private GroupType(int id, String value) {
		this.id = id;
		this.value = value;
	}

	@Override
	public int getId() {
		return id;
	}

	@Override
	public String getValue() {
		return value;
	}
}
