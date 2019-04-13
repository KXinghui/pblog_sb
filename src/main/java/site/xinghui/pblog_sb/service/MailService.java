package site.xinghui.pblog_sb.service;

import org.springframework.stereotype.Service;

@Service
public class MailService {

	// @Value("${spring.mail.username}")
	// private static String from;
	//
	// @Autowired
	// private static JavaMailSender javaMailSender;
	// @Autowired
	// private static TemplateEngine templateEngine;

	//
	// public static void sendSimpleMail(String to, String subject, String content)
	// {
	// SimpleMailMessage message = new SimpleMailMessage();
	// message.setTo(to);
	// message.setSubject(subject);
	// message.setText(content);
	// message.setFrom(from);
	//
	// javaMailSender.send(message);
	// }
	//
	// public static void sendHtmlMail(String to, String subject, String content)
	// throws MessagingException {
	// MimeMessage message = javaMailSender.createMimeMessage();
	// MimeMessageHelper helper = new MimeMessageHelper(message, true);
	// helper.setTo(to);
	// helper.setSubject(subject);
	// helper.setText(content, true);
	// helper.setFrom(from);
	//
	// javaMailSender.send(message);
	// }

	/* 带附件邮件 */
	// public static void sendAttachementsMail(String to, String subject, String
	// content, String[] filePaths)
	// throws MessagingException {
	// MimeMessage message = javaMailSender.createMimeMessage();
	// MimeMessageHelper helper = new MimeMessageHelper(message, true);
	// helper.setTo(to);
	// helper.setSubject(subject);
	// helper.setText(content, true);
	// helper.setFrom(from);
	//
	// for (String filePath : filePaths) {
	// FileSystemResource file = new FileSystemResource(new File(filePath));
	// String attachmentFilename = file.getFilename();
	// helper.addAttachment(attachmentFilename, file);
	// }
	// javaMailSender.send(message);
	// }

	// public static void sendInLineResourceMail(String to, String subject, String
	// content, Map<String, String> rscMap)
	// throws MessagingException {
	// MimeMessage message = javaMailSender.createMimeMessage();
	// MimeMessageHelper helper = new MimeMessageHelper(message, true);
	// helper.setTo(to);
	// helper.setSubject(subject);
	// helper.setText(content, true);
	// helper.setFrom(from);
	// for (String contentId : rscMap.keySet()) {
	// String rscPath = rscMap.get(contentId);
	// FileSystemResource file = new FileSystemResource(new File(rscPath));
	// helper.addInline(contentId, file);
	// }
	//
	// javaMailSender.send(message);
	// }

	/* 模板邮件 */
	// public static void sendTemplateMail(String to, String subject, Map<String,
	// Object> variables)
	// throws MessagingException {
	//
	// Context context = new Context();
	// context.setVariables(variables);
	// String emailContent = templateEngine.process("", context);
	//
	// sendHtmlMail(to, subject, emailContent);
	// }

}
