package site.xinghui.pblog_sb.util;

import java.util.Map;

public class FieldErr {
	private String opMsg;
	private Map<String, String> fieldErrMsgMap;

	public FieldErr() {
	}

	public FieldErr(String opMsg, Map<String, String> fieldErrMsgMap) {
		super();
		this.opMsg = opMsg;
		this.fieldErrMsgMap = fieldErrMsgMap;
	}

	public String getOpMsg() {
		return opMsg;
	}

	public void setOpMsg(String opMsg) {
		this.opMsg = opMsg;
	}

	public Map<String, String> getFieldErrMsgMap() {
		return fieldErrMsgMap;
	}

	public void setFieldErrMsgMap(Map<String, String> fieldErrMsgMap) {
		this.fieldErrMsgMap = fieldErrMsgMap;
	}

}
