package model;

import java.util.Date;
import java.util.Properties;
import javax.mail.Session;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {
    
    static final String from = "hoangphucc898@gmail.com";
    static final String password = "lnzcvpkkurgztank"; // Use an app-specific password

    public static boolean sendEmail(String to, String tieuDe, String noiDung) {
        // Validate the recipient email address
        if (!isValidEmailAddress(to)) {
            System.out.println("Invalid email address: " + to);
            return false;
        }

        // Properties : khai báo các thuộc tính
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP HOST
        props.put("mail.smtp.port", "587"); // TLS port
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true"); // Enable STARTTLS

        // create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };

        // Phiên làm việc
        Session session = Session.getInstance(props, auth);

        // Tạo một tin nhắn
        MimeMessage msg = new MimeMessage(session);

        try {
            // Kiểu nội dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");

            // Người gửi
            msg.setFrom(new InternetAddress(from));

            // Người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            // Tiêu đề email
            msg.setSubject(tieuDe);

            // Quy đinh ngày gửi
            msg.setSentDate(new Date());

            // Nội dung
            msg.setContent("<!DOCTYPE html>\n" +
"<html xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\" lang=\"en\">\n" +
"\n" +
"<head>\n" +
"	<title></title>\n" +
"	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n" +
"	<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><!--[if mso]><xml><o:OfficeDocumentSettings><o:PixelsPerInch>96</o:PixelsPerInch><o:AllowPNG/></o:OfficeDocumentSettings></xml><![endif]--><!--[if !mso]><!-->\n" +
"	<link href=\"https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900\" rel=\"stylesheet\" type=\"text/css\">\n" +
"	<link href=\"https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&amp;display=swap\" rel=\"stylesheet\" type=\"text/css\"><!--<![endif]-->\n" +
"	<style>\n" +
"		* {\n" +
"			box-sizing: border-box;\n" +
"		}\n" +
"\n" +
"		body {\n" +
"			margin: 0;\n" +
"			padding: 0;\n" +
"		}\n" +
"\n" +
"		a[x-apple-data-detectors] {\n" +
"			color: inherit !important;\n" +
"			text-decoration: inherit !important;\n" +
"		}\n" +
"\n" +
"		#MessageViewBody a {\n" +
"			color: inherit;\n" +
"			text-decoration: none;\n" +
"		}\n" +
"\n" +
"		p {\n" +
"			line-height: inherit\n" +
"		}\n" +
"\n" +
"		.desktop_hide,\n" +
"		.desktop_hide table {\n" +
"			mso-hide: all;\n" +
"			display: none;\n" +
"			max-height: 0px;\n" +
"			overflow: hidden;\n" +
"		}\n" +
"\n" +
"		.image_block img+div {\n" +
"			display: none;\n" +
"		}\n" +
"\n" +
"		@media (max-width:700px) {\n" +
"\n" +
"			.desktop_hide table.icons-inner,\n" +
"			.social_block.desktop_hide .social-table {\n" +
"				display: inline-block !important;\n" +
"			}\n" +
"\n" +
"			.icons-inner {\n" +
"				text-align: center;\n" +
"			}\n" +
"\n" +
"			.icons-inner td {\n" +
"				margin: 0 auto;\n" +
"			}\n" +
"\n" +
"			.mobile_hide {\n" +
"				display: none;\n" +
"			}\n" +
"\n" +
"			.row-content {\n" +
"				width: 100% !important;\n" +
"			}\n" +
"\n" +
"			.stack .column {\n" +
"				width: 100%;\n" +
"				display: block;\n" +
"			}\n" +
"\n" +
"			.mobile_hide {\n" +
"				min-height: 0;\n" +
"				max-height: 0;\n" +
"				max-width: 0;\n" +
"				overflow: hidden;\n" +
"				font-size: 0px;\n" +
"			}\n" +
"\n" +
"			.desktop_hide,\n" +
"			.desktop_hide table {\n" +
"				display: table !important;\n" +
"				max-height: none !important;\n" +
"			}\n" +
"\n" +
"			.row-1 .column-1 .block-4.spacer_block {\n" +
"				height: 45px !important;\n" +
"			}\n" +
"\n" +
"			.row-1 .column-1 .block-5.heading_block h1 {\n" +
"				font-size: 33px !important;\n" +
"			}\n" +
"\n" +
"			.row-1 .column-1 .block-6.heading_block h2 {\n" +
"				font-size: 16px !important;\n" +
"			}\n" +
"\n" +
"			.row-1 .column-1 .block-9.paragraph_block td.pad {\n" +
"				padding: 10px 15px 15px !important;\n" +
"			}\n" +
"		}\n" +
"	</style>\n" +
"</head>\n" +
"\n" +
"<body class=\"body\" style=\"background-color: #fdeef1; margin: 0; padding: 0; -webkit-text-size-adjust: none; text-size-adjust: none;\">\n" +
"	<table class=\"nl-container\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #fdeef1;\">\n" +
"		<tbody>\n" +
"			<tr>\n" +
"				<td>\n" +
"					<table class=\"row row-1\" align=\"center\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-size: auto;\">\n" +
"						<tbody>\n" +
"							<tr>\n" +
"								<td>\n" +
"									<table class=\"row-content stack\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-size: auto; background-color: #ffffff; background-image: url('https://d1oco4z2z1fhwp.cloudfront.net/templates/default/8676/Main-Bcgk.png'); background-position: top center; background-repeat: no-repeat; color: #000000; width: 680px; margin: 0 auto;\" width=\"680\">\n" +
"										<tbody>\n" +
"											<tr>\n" +
"												<td class=\"column column-1\" width=\"100%\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; padding-bottom: 5px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;\">\n" +
"													<div class=\"spacer_block block-1\" style=\"height:30px;line-height:30px;font-size:1px;\">&#8202;</div>\n" +
"													<div class=\"spacer_block block-2\" style=\"height:60px;line-height:60px;font-size:1px;\">&#8202;</div>\n" +
"													<table class=\"image_block block-3\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n" +
"														<tr>\n" +
"															<td class=\"pad\" style=\"width:100%;padding-right:0px;padding-left:0px;\">\n" +
"																<div class=\"alignment\" align=\"center\" style=\"line-height:10px\">\n" +
"																	<div style=\"max-width: 170px;\"><a href=\"http://localhost:8080/web-shoes/index.jsp\" target=\"_blank\" style=\"outline:none\" tabindex=\"-1\"><img src=\"https://ac17f2d8d5.imgdist.com/pub/bfra/wb0ri0py/or4/1x0/y4t/logo.jpg\" style=\"display: block; height: auto; border: 0; width: 100%;\" width=\"170\" alt=\"logo-dark-image\" title=\"logo-dark-image\" height=\"auto\"></a></div>\n" +
"																</div>\n" +
"															</td>\n" +
"														</tr>\n" +
"													</table>\n" +
"													<div class=\"spacer_block block-4\" style=\"height:75px;line-height:75px;font-size:1px;\">&#8202;</div>\n" +
"													<table class=\"heading_block block-5\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n" +
"														<tr>\n" +
"															<td class=\"pad\" style=\"padding-top:10px;text-align:center;width:100%;\">\n" +
"																<h1 style=\"margin: 0; color: #2c2b2b; direction: ltr; font-family: 'Montserrat', 'Trebuchet MS', 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', Tahoma, sans-serif; font-size: 38px; font-weight: 700; letter-spacing: normal; line-height: 150%; text-align: center; margin-top: 0; margin-bottom: 0; mso-line-height-alt: 57px;\"><span class=\"tinyMce-placeholder\" style=\"word-break: break-word;\">THANK YOU!</span></h1>\n" +
"															</td>\n" +
"														</tr>\n" +
"													</table>\n" +
"													<table class=\"heading_block block-6\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n" +
"														<tr>\n" +
"															<td class=\"pad\" style=\"padding-bottom:10px;text-align:center;width:100%;\">\n" +
"																<h2 style=\"margin: 0; color: #454545; direction: ltr; font-family: 'Montserrat', 'Trebuchet MS', 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', Tahoma, sans-serif; font-size: 22px; font-weight: 400; letter-spacing: normal; line-height: 120%; text-align: center; margin-top: 0; margin-bottom: 0; mso-line-height-alt: 26.4px;\"><span class=\"tinyMce-placeholder\" style=\"word-break: break-word;\">"+tieuDe+"</span></h2>\n" +
"															</td>\n" +
"														</tr>\n" +
"													</table>\n" +
"													<table class=\"divider_block block-7\" width=\"100%\" border=\"0\" cellpadding=\"10\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n" +
"														<tr>\n" +
"															<td class=\"pad\">\n" +
"																<div class=\"alignment\" align=\"center\">\n" +
"																	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"55%\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n" +
"																		<tr>\n" +
"																			<td class=\"divider_inner\" style=\"font-size: 1px; line-height: 1px; border-top: 1px solid #575757;\"><span style=\"word-break: break-word;\">&#8202;</span></td>\n" +
"																		</tr>\n" +
"																	</table>\n" +
"																</div>\n" +
"															</td>\n" +
"														</tr>\n" +
"													</table>\n" +
"													<div class=\"spacer_block block-8\" style=\"height:25px;line-height:25px;font-size:1px;\">&#8202;</div>\n" +
"													<table class=\"paragraph_block block-9\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;\">\n" +
"														<tr>\n" +
"															<td class=\"pad\" style=\"padding-bottom:15px;padding-top:10px;\">\n" +
"																<div style=\"color:#454545;direction:ltr;font-family:'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;font-size:14px;font-weight:300;letter-spacing:0px;line-height:150%;text-align:center;mso-line-height-alt:21px;\">\n" +
"																	<p style=\"margin: 0; margin-bottom: 16px;\">We are happy to welcome you to our community.</p>\n" +
"																	<p style=\"margin: 0;\">We started out to create value for the services you use on a daily basis.<br>We are so glad you joined us on our path to something great!<br><br>with love, <br>Coco & Team</p>\n" +
"																</div>\n" +
"															</td>\n" +
"														</tr>\n" +
"													</table>\n" +
"													<div class=\"spacer_block block-10\" style=\"height:20px;line-height:20px;font-size:1px;\">&#8202;</div>\n" +
"													<table class=\"button_block block-11\" width=\"100%\" border=\"0\" cellpadding=\"10\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n" +
"														<tr>\n" +
"															<td class=\"pad\">\n" +
"																<div class=\"alignment\" align=\"center\"><!--[if mso]>\n" +
"<v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"http://localhost:8080/web-shoes/AllServlet?action=listAll\" style=\"height:49px;width:137px;v-text-anchor:middle;\" arcsize=\"9%\" strokeweight=\"0.75pt\" strokecolor=\"#000000\" fillcolor=\"#ffffff\">\n" +
"<w:anchorlock/>\n" +
"<v:textbox inset=\"0px,0px,0px,0px\">\n" +
"<center dir=\"false\" style=\"color:#000000;font-family:'Trebuchet MS', Tahoma, sans-serif;font-size:16px\">\n" +
"<![endif]--><a href=\"http://localhost:8080/web-shoes/AllServlet?action=listAll\" target=\"_blank\" style=\"background-color:#ffffff;border-bottom:1px solid #000000;border-left:1px solid #000000;border-radius:4px;border-right:1px solid #000000;border-top:1px solid #000000;color:#000000;display:inline-block;font-family:'Montserrat', 'Trebuchet MS', 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', Tahoma, sans-serif;font-size:16px;font-weight:600;mso-border-alt:none;padding-bottom:8px;padding-top:8px;text-align:center;text-decoration:none;width:auto;word-break:keep-all;\"><span style=\"word-break: break-word; padding-left: 30px; padding-right: 30px; font-size: 16px; display: inline-block; letter-spacing: normal;\"><span style=\"word-break: break-word; line-height: 32px;\">Continue</span></span></a><!--[if mso]></center></v:textbox></v:roundrect><![endif]--></div>\n" +
"															</td>\n" +
"														</tr>\n" +
"													</table>\n" +
"													<div class=\"spacer_block block-12\" style=\"height:165px;line-height:165px;font-size:1px;\">&#8202;</div>\n" +
"												</td>\n" +
"											</tr>\n" +
"										</tbody>\n" +
"									</table>\n" +
"								</td>\n" +
"							</tr>\n" +
"						</tbody>\n" +
"					</table>\n" +
"					<table class=\"row row-2\" align=\"center\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n" +
"						<tbody>\n" +
"							<tr>\n" +
"								<td>\n" +
"									<table class=\"row-content stack\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #000000; border-radius: 0; color: #000000; width: 680px; margin: 0 auto;\" width=\"680\">\n" +
"										<tbody>\n" +
"											<tr>\n" +
"												<td class=\"column column-1\" width=\"100%\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; padding-bottom: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;\">\n" +
"													<table class=\"divider_block block-1\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n" +
"														<tr>\n" +
"															<td class=\"pad\" style=\"padding-bottom:10px;\">\n" +
"																<div class=\"alignment\" align=\"center\">\n" +
"																	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n" +
"																		<tr>\n" +
"																			<td class=\"divider_inner\" style=\"font-size: 1px; line-height: 1px; border-top: 1px solid #000000;\"><span style=\"word-break: break-word;\">&#8202;</span></td>\n" +
"																		</tr>\n" +
"																	</table>\n" +
"																</div>\n" +
"															</td>\n" +
"														</tr>\n" +
"													</table>\n" +
"												</td>\n" +
"											</tr>\n" +
"										</tbody>\n" +
"									</table>\n" +
"								</td>\n" +
"							</tr>\n" +
"						</tbody>\n" +
"					</table>\n" +
"					<table class=\"row row-3\" align=\"center\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n" +
"						<tbody>\n" +
"							<tr>\n" +
"								<td>\n" +
"									<table class=\"row-content stack\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #fdfdfd; border-radius: 0; color: #000000; width: 680px; margin: 0 auto;\" width=\"680\">\n" +
"										<tbody>\n" +
"											<tr>\n" +
"												<td class=\"column column-1\" width=\"50%\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; padding-bottom: 10px; padding-left: 10px; padding-right: 10px; padding-top: 10px; vertical-align: middle; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;\">\n" +
"													<table class=\"text_block block-1\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;\">\n" +
"														<tr>\n" +
"															<td class=\"pad\" style=\"padding-bottom:5px;padding-left:10px;padding-right:10px;padding-top:5px;\">\n" +
"																<div style=\"font-family: 'Trebuchet MS', Tahoma, sans-serif\">\n" +
"																	<div class style=\"font-size: 12px; font-family: 'Montserrat', 'Trebuchet MS', 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', Tahoma, sans-serif; mso-line-height-alt: 14.399999999999999px; color: #ffffff; line-height: 1.2;\">\n" +
"																		<p style=\"margin: 0; font-size: 18px; text-align: left; mso-line-height-alt: 21.599999999999998px;\"><strong><span style=\"word-break: break-word; font-size: 14px; color: #000000;\"><span style=\"word-break: break-word;\">Social media</span></span></strong></p>\n" +
"																	</div>\n" +
"																</div>\n" +
"															</td>\n" +
"														</tr>\n" +
"													</table>\n" +
"													<table class=\"text_block block-2\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;\">\n" +
"														<tr>\n" +
"															<td class=\"pad\" style=\"padding-bottom:10px;padding-left:10px;padding-right:20px;padding-top:10px;\">\n" +
"																<div style=\"font-family: Arial, sans-serif\">\n" +
"																	<div class style=\"font-size: 12px; font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif; mso-line-height-alt: 14.399999999999999px; color: #C0C0C0; line-height: 1.2;\">\n" +
"																		<p style=\"margin: 0; font-size: 14px; text-align: left; mso-line-height-alt: 16.8px;\"><span style=\"word-break: break-word; color: #454545; font-size: 12px;\">Stay up-to-date with current activities by following us on your favorite social media channels.</span></p>\n" +
"																	</div>\n" +
"																</div>\n" +
"															</td>\n" +
"														</tr>\n" +
"													</table>\n" +
"													<table class=\"social_block block-3\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n" +
"														<tr>\n" +
"															<td class=\"pad\" style=\"text-align:left;padding-right:0px;padding-left:0px;\">\n" +
"																<div class=\"alignment\" align=\"left\">\n" +
"																	<table class=\"social-table\" width=\"144px\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; display: inline-block;\">\n" +
"																		<tr>\n" +
"																			<td style=\"padding:0 4px 0 0;\"><a href=\"https://www.facebook.com/\" target=\"_blank\"><img src=\"https://app-rsrc.getbee.io/public/resources/social-networks-icon-sets/t-only-logo-dark-gray/facebook@2x.png\" width=\"32\" height=\"auto\" alt=\"Facebook\" title=\"Facebook\" style=\"display: block; height: auto; border: 0;\"></a></td>\n" +
"																			<td style=\"padding:0 4px 0 0;\"><a href=\"https://twitter.com/\" target=\"_blank\"><img src=\"https://app-rsrc.getbee.io/public/resources/social-networks-icon-sets/t-only-logo-dark-gray/twitter@2x.png\" width=\"32\" height=\"auto\" alt=\"Twitter\" title=\"Twitter\" style=\"display: block; height: auto; border: 0;\"></a></td>\n" +
"																			<td style=\"padding:0 4px 0 0;\"><a href=\"https://plus.google.com/\" target=\"_blank\"><img src=\"https://app-rsrc.getbee.io/public/resources/social-networks-icon-sets/t-only-logo-dark-gray/googleplus@2x.png\" width=\"32\" height=\"auto\" alt=\"Google+\" title=\"Google+\" style=\"display: block; height: auto; border: 0;\"></a></td>\n" +
"																			<td style=\"padding:0 4px 0 0;\"><a href=\"https://instagram.com/\" target=\"_blank\"><img src=\"https://app-rsrc.getbee.io/public/resources/social-networks-icon-sets/t-only-logo-dark-gray/instagram@2x.png\" width=\"32\" height=\"auto\" alt=\"Instagram\" title=\"Instagram\" style=\"display: block; height: auto; border: 0;\"></a></td>\n" +
"																		</tr>\n" +
"																	</table>\n" +
"																</div>\n" +
"															</td>\n" +
"														</tr>\n" +
"													</table>\n" +
"												</td>\n" +
"												<td class=\"column column-2\" width=\"50%\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; padding-bottom: 10px; padding-left: 10px; padding-right: 10px; padding-top: 10px; vertical-align: middle; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;\">\n" +
"													<table class=\"text_block block-1\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;\">\n" +
"														<tr>\n" +
"															<td class=\"pad\" style=\"padding-bottom:5px;padding-left:10px;padding-right:10px;padding-top:5px;\">\n" +
"																<div style=\"font-family: 'Trebuchet MS', Tahoma, sans-serif\">\n" +
"																	<div class style=\"font-size: 12px; font-family: 'Montserrat', 'Trebuchet MS', 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', Tahoma, sans-serif; mso-line-height-alt: 14.399999999999999px; color: #ffffff; line-height: 1.2;\">\n" +
"																		<p style=\"margin: 0; font-size: 18px; text-align: left; mso-line-height-alt: 21.599999999999998px;\"><span style=\"word-break: break-word; font-size: 14px; color: #000000;\"><strong><span style=\"word-break: break-word;\">Where to find us</span></strong></span></p>\n" +
"																	</div>\n" +
"																</div>\n" +
"															</td>\n" +
"														</tr>\n" +
"													</table>\n" +
"													<table class=\"text_block block-2\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;\">\n" +
"														<tr>\n" +
"															<td class=\"pad\" style=\"padding-bottom:5px;padding-left:10px;padding-right:10px;padding-top:10px;\">\n" +
"																<div style=\"font-family: Arial, sans-serif\">\n" +
"																	<div class style=\"font-size: 12px; font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif; mso-line-height-alt: 14.399999999999999px; color: #3f3f3f; line-height: 1.2;\">\n" +
"																		<p style=\"margin: 0; font-size: 14px; text-align: left; mso-line-height-alt: 16.8px;\"><span style=\"word-break: break-word; color: #454545; font-size: 12px;\">With Love, Coco Team<br>Prishtine, Kosove</span></p>\n" +
"																	</div>\n" +
"																</div>\n" +
"															</td>\n" +
"														</tr>\n" +
"													</table>\n" +
"													<table class=\"text_block block-3\" width=\"100%\" border=\"0\" cellpadding=\"10\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;\">\n" +
"														<tr>\n" +
"															<td class=\"pad\">\n" +
"																<div style=\"font-family: Arial, sans-serif\">\n" +
"																	<div class style=\"font-size: 12px; font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif; mso-line-height-alt: 14.399999999999999px; color: #C0C0C0; line-height: 1.2;\">\n" +
"																		<p style=\"margin: 0; font-size: 12px; mso-line-height-alt: 14.399999999999999px;\">&nbsp;</p>\n" +
"																	</div>\n" +
"																</div>\n" +
"															</td>\n" +
"														</tr>\n" +
"													</table>\n" +
"												</td>\n" +
"											</tr>\n" +
"										</tbody>\n" +
"									</table>\n" +
"								</td>\n" +
"							</tr>\n" +
"						</tbody>\n" +
"					</table>\n" +
"					<table class=\"row row-4\" align=\"center\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #ffffff;\">\n" +
"						<tbody>\n" +
"							<tr>\n" +
"								<td>\n" +
"									<table class=\"row-content stack\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #ffffff; color: #000000; width: 680px; margin: 0 auto;\" width=\"680\">\n" +
"										<tbody>\n" +
"											<tr>\n" +
"												<td class=\"column column-1\" width=\"100%\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; padding-bottom: 5px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;\">\n" +
"													<table class=\"icons_block block-1\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; text-align: center;\">\n" +
"														<tr>\n" +
"															<td class=\"pad\" style=\"vertical-align: middle; color: #1e0e4b; font-family: 'Inter', sans-serif; font-size: 15px; padding-bottom: 5px; padding-top: 5px; text-align: center;\">\n" +
"																<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n" +
"																	<tr>\n" +
"																		<td class=\"alignment\" style=\"vertical-align: middle; text-align: center;\"><!--[if vml]><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"display:inline-block;padding-left:0px;padding-right:0px;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\"><![endif]-->\n" +
"																			<!--[if !vml]><!-->\n" +
"																		\n" +
"																		</td>\n" +
"																	</tr>\n" +
"																</table>\n" +
"															</td>\n" +
"														</tr>\n" +
"													</table>\n" +
"												</td>\n" +
"											</tr>\n" +
"										</tbody>\n" +
"									</table>\n" +
"								</td>\n" +
"							</tr>\n" +
"						</tbody>\n" +
"					</table>\n" +
"				</td>\n" +
"			</tr>\n" +
"		</tbody>\n" +
"	</table><!-- End -->\n" +
"</body>\n" +
"\n" +
"</html>", "text/HTML; charset=UTF-8");

            // Gửi email
            Transport.send(msg);
            System.out.println("Gửi email thành công");
            return true;
        } catch (Exception e) {
            System.out.println("Gặp lỗi trong quá trình gửi email");
            e.printStackTrace();
            return false;
        }
    }

    private static boolean isValidEmailAddress(String email) {
        boolean result = true;
        try {
            InternetAddress emailAddr = new InternetAddress(email);
            emailAddr.validate();
        } catch (javax.mail.internet.AddressException ex) {
            result = false;
        }
        return result;
    }
}
