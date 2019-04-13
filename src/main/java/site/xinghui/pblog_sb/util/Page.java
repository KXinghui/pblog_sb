package site.xinghui.pblog_sb.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Page {
	public static final int DEFAULT_PAGESIZE = 8, DEFAULT_CURRENT = 1, DEFAULT_PAGERECORD = 10;
	/* 总记录数 */
	private int total;
	/* 总页数 */
	private int totalPage;
	/* 每页的记录数 */
	private int pageRecord;
	// 上一页
	private int prePage;
	// 下一页
	private int nextPage;
	// 显示页数
	private int pageSize;
	// 开始页(索引从1开始)
	private int start;
	// 当前页
	private int current;
	// 尾页
	private int end;
	// url
	private String url;
	// 请求参数map(参数名 参数值数组)
	private Map<String, String[]> paramMap;
	// 每页第一条记录的索引(由当前页和每页记录数决定)
	private int pageFirst;

	public Page() {
		this.current = DEFAULT_CURRENT;
		this.pageRecord = DEFAULT_PAGERECORD;
		this.pageSize = DEFAULT_PAGESIZE;
		this.pageFirst = getPageFirst();
	}

	public Page(int current, int pageRecord) {
		this.current = current;
		this.pageRecord = pageRecord;
		this.pageSize = DEFAULT_PAGESIZE;
		this.pageFirst = getPageFirst();
	}

	public Page(int pageSize, int current, int pageRecord) {
		this.pageSize = pageSize;
		this.current = current;
		this.pageRecord = pageRecord;
		this.pageFirst = getPageFirst();
	}

	public Page(int total, int pageSize, int current, int pageRecord) {
		this.total = total;
		this.pageSize = pageSize;
		this.pageRecord = pageRecord;
		this.current = current;

		totalPage = getTotalPage();
		startEndRange();
		prePage = getPrePage();
		nextPage = getNextPage();
		pageFirst = getPageFirst();
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	// TODO (1)
	public int getTotalPage() {
		int except = (total / pageRecord);
		totalPage = (total % pageRecord == 0) ? except : except + 1;
		return totalPage;
	}

	public int getPageRecord() {
		return pageRecord;
	}

	public void setPageRecord(int pageRecord) {
		this.pageRecord = pageRecord;
	}

	/* 显示页数是否为偶数 */
	public boolean pageSizeIsEven() {
		if (pageSize % 2 == 0) {
			return true;
		}
		return false;
	}

	// TODO (2)-1
	protected void pageSizeRange() {
		this.pageSize = (this.pageSize > totalPage) ? totalPage : this.pageSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		pageSize = (pageSize == 0) ? DEFAULT_PAGESIZE : pageSize;
		if (1 <= pageSize && pageSize <= totalPage) {
			this.pageSize = pageSize;
		}
	}

	public int getCurrent() {
		return current;
	}

	public void setCurrent(int current) {
		this.current = current;
	}

	/* 是否上一页 */
	protected boolean isPre() {
		// 当前页-1大于0 true
		if (current - 1 > 0) {
			return true;
		}
		return false;
	}

	/* 是否下一页 */
	protected boolean isNext() {
		// 当前页+1小于等于总页数 true
		if (current + 1 <= totalPage) {
			return true;
		}
		return false;
	}

	public int getPrePage() {
		currentRange();
		prePage = (isPre()) ? current - 1 : 1;
		return prePage;
	}

	public int getNextPage() {
		currentRange();
		nextPage = (isNext()) ? current + 1 : totalPage;
		return nextPage;
	}

	// TODO (2)-2
	protected void currentRange() {
		if (current < 1) {
			current = 1;
		} else if (current > totalPage) {
			current = totalPage;
		}
	}

	// TODO (2)
	protected void startEndRange() {
		pageSizeRange();
		int except = pageSize / 2;
		currentRange();
		if (current <= except + 1) {
			start = 1;
			end = pageSize;
		} else if (totalPage - except <= current) {
			start = totalPage - (pageSize - 1);
			end = totalPage;
		} else if (totalPage - except > current) {
			start = current - except;
			end = current + (except - 1);
		}
	}

	protected boolean isEnd() {
		if (end > totalPage) {
			return true;
		}
		return false;
	}

	/* 根据当前页获取开始页 */
	// TODO (3)
	public int getStart() {
		startEndRange();
		return start;
	}

	/* 获取尾页 */
	// TODO (4)
	public int getEnd() {
		startEndRange();
		return end;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Map<String, String[]> getParamMap() {
		return paramMap;
	}

	public void setParamMap(Map<String, String[]> paramMap) {
		this.paramMap = paramMap;
	}

	@Override
	public String toString() {
		return "Page [total=" + total + ", totalPage=" + totalPage + ", pageRecord=" + pageRecord + ", prePage="
				+ prePage + ", nextPage=" + nextPage + ", pageSize=" + pageSize + ", start=" + start + ", current="
				+ current + ", end=" + end + ", url=" + url + ", paramMap=" + paramMap + ", pageFirst=" + pageFirst
				+ "]";
	}

	// TODO
	public int getPageFirst() {
		// LIMIT (offset , count)的 offset 由当前页和每页记录数决定
		return current * pageRecord - pageRecord;
	}

	public static void main(String[] args) {
		List<Integer> ids = new ArrayList<>();
		for (int i = 0; i < 5; i++) {
			ids.add(i);
		}

		// System.out.println(p.pageSize);
		// System.out.println(p.getTotalPage());

		// System.out.println(p.getStart());
		// System.out.println(p.getEnd());
		// System.out.println(p.getPrePage() + " " + p.getNextPage());
		// System.out.println(p);
	}
}
