package site.xinghui.pblog_sb.util;

import javax.servlet.http.Part;

public class UpLoadFile {

	public static boolean isImage(Part part) {
		return part.getContentType().startsWith("image");
	}

	public static String getFileSuffix(String fileName) {
		return fileName.substring(fileName.lastIndexOf(".") + 1);
	}

	public static boolean isEqualsIgnoreCaseSuffix(Part part, String[] authSuffix) {
		String fileName = part.getSubmittedFileName();

		String suffix = getFileSuffix(fileName);
		for (String s : authSuffix) {
			if (suffix.equalsIgnoreCase(s)) {
				return true;
			}
		}
		return false;
	}

	public static boolean isSize(Part part, long min, long max) {
		long fileSize = part.getSize();
		System.out.println(fileSize);
		if (min <= fileSize && fileSize <= max) {
			return true;
		}
		return false;
	}

	public static void main(String[] args) {
		// String panfu = "d:";
		// System.out.println(String.format("%s" + File.separator + "%s", panfu, "z"));
		// String msg = "";
		// msg = "fdfdfdf";
		// System.out.println(getFileSuffix("adfadf.afadf.afdaf.jpg"));
		// System.out.println(msg == null);
		// System.out.println(msg.equals(""));
		// System.out.println("".equals(msg));
	}
}
