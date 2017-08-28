public bool EmailNotification()
    {
            using (var mail = new MailMessage(emailFrom, "test.test.com"))
            {
                string body = "Your message : [Ipaddress]/Views/ForgotPassword.html";
                mail.Subject = "Forgot password";
                mail.Body = body;
                mail.IsBodyHtml = false;
                var smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential(emailFrom, emailPwd);
                smtp.Port = 587;
                smtp.Send(mail);
                return true;
            }
    }

    $.ajax({
        type: "POST",
        url: "Service.asmx/EmailNotification",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data)
        {

        },
        error: function (XHR, errStatus, errorThrown) {
            var err = JSON.parse(XHR.responseText);
            errorMessage = err.Message;
            alert(errorMessage);
        }
    });

    <?php
$success = mail('example@example.com', 'My Subject', $message);
if (!$success) {
    $errorMessage = error_get_last()['message'];
}
?>

<?php
// The message
$message = "Line 1\r\nLine 2\r\nLine 3";

// In case any of our lines are larger than 70 characters, we should use wordwrap()
$message = wordwrap($message, 70, "\r\n");

// Send
mail('caffeinated@example.com', 'My Subject', $message);
?>