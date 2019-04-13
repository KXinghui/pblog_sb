package site.xinghui.pblog_sb.exception;

public class CustException extends RuntimeException {

	private static final long serialVersionUID = -502951890655557708L;

	private String ip;
	private String errMsg;
	private String url;

	public CustException() {
	}

	public CustException(String message) {
		super(message);
	}

	public CustException(String ip, String errMsg, String url) {
		super();
		this.ip = ip;
		this.errMsg = errMsg;
		this.url = url;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "CustException [ip=" + ip + ", errMsg=" + errMsg + ", url=" + url + "]";
	}

	public static void main(String[] args) {
		CustException custException = new CustException("sgdf");
		System.out.println(custException.getMessage());
	}

}
