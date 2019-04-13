package site.xinghui.pblog_sb.enums;

//@Alias("gender")
public enum Gender implements BaseEnum {
	MALE(1, "男"), FEMALE(0, "女");
	private int id;
	private String value;

	private Gender(int id, String value) {
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
