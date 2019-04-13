package site.xinghui.pblog_sb.util;

import java.util.List;
import java.util.Map;

public class PageResult<T> {
	public static final int DEFAULT_PAGESIZE = 10, DEFAULT_PAGERECORD = 10;
	private Page page;
	private List<T> list;
	private Map<Integer, T> map;

	public PageResult() {
	}

	public PageResult(int total, List<T> list, Page page) {
		super();
		this.page = new Page(total, page.getPageSize(), page.getCurrent(), page.getPageRecord());
		if (null != page.getParamMap()) {
			this.page.setParamMap(page.getParamMap());
		}
		this.page.setUrl(page.getUrl());
		this.list = list;
	}

	public PageResult(int total, Map<Integer, T> map, Page page) {
		super();
		this.page = new Page(total, page.getPageSize(), page.getCurrent(), page.getPageRecord());
		if (null != page.getParamMap()) {
			this.page.setParamMap(page.getParamMap());
		}
		this.page.setUrl(page.getUrl());
		this.map = map;
	}

	public PageResult(int total, List<T> list, Map<Integer, T> map, Page page) {
		super();
		this.page = new Page(total, page.getPageSize(), page.getCurrent(), page.getPageRecord());
		this.page.setParamMap(page.getParamMap());
		this.page.setUrl(page.getUrl());
		this.list = list;
		this.map = map;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public Map<Integer, T> getMap() {
		return map;
	}

	public void setMap(Map<Integer, T> map) {
		this.map = map;
	}

	@Override
	public String toString() {
		return "PageResult [page=" + page + ", list=" + list + ", map=" + map + "]";
	}
}
