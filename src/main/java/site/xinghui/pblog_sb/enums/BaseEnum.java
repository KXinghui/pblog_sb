package site.xinghui.pblog_sb.enums;

import java.util.ArrayList;
import java.util.List;

public interface BaseEnum {
	int getId();

	String getValue();

	public static <E extends BaseEnum> String getEnumDesc(Class<E> enumClass, Integer id) {
		E[] enumConstants = enumClass.getEnumConstants();
		for (E e : enumConstants) {
			if (id.equals(e.getId())) {
				return e.getValue();
			}
		}
		return null;
	}

	public static <E extends BaseEnum> String getEnumDesc(Class<E> enumClass, String name) {
		E[] enumConstants = enumClass.getEnumConstants();
		for (E e : enumConstants) {
			if (((Enum<?>) e).name().equalsIgnoreCase((name))) {
				return e.getValue();
			}
		}
		return null;
	}

	public static <E extends BaseEnum> E idOf(Class<E> enumClass, Integer id) {
		E[] enumConstants = enumClass.getEnumConstants();
		for (E e : enumConstants) {
			if (id.equals(e.getId())) {
				return e;
			}
		}
		return null;
	}

	public static <E extends BaseEnum> List<Integer> listId(Class<E> enumClass) {
		List<Integer> ids = new ArrayList<>();
		E[] enumConstants = enumClass.getEnumConstants();
		for (E e : enumConstants) {
			ids.add(e.getId());
		}
		return ids;
	}

	public static <E extends Enum<?> & BaseEnum> E nameOf(Class<E> enumClass, String name) {
		E[] enumConstants = enumClass.getEnumConstants();
		for (E e : enumConstants) {
			if (name.equalsIgnoreCase(e.name())) {
				return e;
			}
		}
		return null;
	}
}
