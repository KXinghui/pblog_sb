package site.xinghui.pblog_sb.enums;

//@Alias("visibility")
public enum Visibility implements BaseEnum {
	VISIBLE(1, "显示"), HIDDEN(0, "隐藏");
	private int id;
	private String value;

	private Visibility(int id, String value) {
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
