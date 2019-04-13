package site.xinghui.pblog_sb.config;

import java.util.concurrent.Executor;

import org.springframework.aop.interceptor.AsyncUncaughtExceptionHandler;
import org.springframework.scheduling.annotation.AsyncConfigurer;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

//@Configuration
//@EnableAsync
public class AsyncConfig implements AsyncConfigurer {
	// 获取线程池
	@Override
	public Executor getAsyncExecutor() {
		// 自定义线程池
		ThreadPoolTaskExecutor taskExecutor = new ThreadPoolTaskExecutor();
		taskExecutor.setCorePoolSize(10);
		taskExecutor.setMaxPoolSize(30);
		taskExecutor.setQueueCapacity(2000);
		taskExecutor.initialize();
		return taskExecutor;
		// return AsyncConfigurer.super.getAsyncExecutor();
	}

	// 异步异常处理器
	@Override
	public AsyncUncaughtExceptionHandler getAsyncUncaughtExceptionHandler() {

		return AsyncConfigurer.super.getAsyncUncaughtExceptionHandler();
	}
}
