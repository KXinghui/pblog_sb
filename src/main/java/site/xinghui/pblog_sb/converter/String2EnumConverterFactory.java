package site.xinghui.pblog_sb.converter;

import java.util.List;

import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.converter.ConverterFactory;

import site.xinghui.pblog_sb.enums.BaseEnum;

public class String2EnumConverterFactory implements ConverterFactory<String, BaseEnum> {
	@Override
	public <T extends BaseEnum> Converter<String, T> getConverter(Class<T> baseEnumClass) {

		return new String2EnumConverter<>(baseEnumClass);
	}

	protected class String2EnumConverter<T extends BaseEnum> implements Converter<String, T> {
		private final Class<T> baseEnumClass;

		public String2EnumConverter(Class<T> baseEnumClass) {
			this.baseEnumClass = baseEnumClass;
		}

		@Override
		public T convert(String source) {

			int id = Integer.parseInt(source);
			List<Integer> ids = BaseEnum.listId(baseEnumClass);
			if (ids.contains(id)) {
				return BaseEnum.idOf(baseEnumClass, id);
			}
			return null;
		}

	}

}
