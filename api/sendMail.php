<?php
date_default_timezone_set('Etc/UTC');
error_reporting(E_ALL);
ini_set('display_errors', '1');
require_once 'phpmailer/PHPMailerAutoload.php';
if (isset($_POST['name']) && isset($_POST['email']) && isset($_POST['subject']) && isset($_POST['from'])) {
	if (empty($_POST['name']) || empty($_POST['email']) || empty($_POST['subject']) || empty($_POST['from'])) {$data = array('success' => false, 'message' => 'Please fill out the form completely.');echo json_encode($data);exit;}
	$mail = new PHPMailer();	
	$mail->isSMTP();
	$mail->SMTPDebug = 2;
	$mail->Debugoutput = 'html';
	$mail->Host = 'smtp.gmail.com';
	$mail->Port = 587;
	$mail->SMTPSecure = 'tls';
	$mail->SMTPAuth = true;
	$mail->Username = "sflores@hngsystems.com";
	$mail->Password = "s2lv3d8r";
	$mail->setFrom($_POST['from'],'Admin');
	$mail->AddAddress($_POST['email']); 
	$mail->Subject = $_POST['subject']; 
	$mail->Body = "Name: " . $_POST['email'] . "\r\n\r\nMessage: " . stripslashes($_POST['message']);
	$mail->isHTML(true);
	if (isset($_POST['ref'])) {$mail->Body .= "\r\n\r\nRef: " . $_POST['ref'];}
	if(!$mail->send()) {$data = array('success' => false, 'message' => 'Message could not be sent. Mailer Error: ' . $mail->ErrorInfo); echo json_encode($data); exit;}
	$data = array('success' => true, 'message' => 'Thanks! We have received your message.'); echo json_encode($data);
} else {$data = array('success' => false, 'message' => 'Please fill out the form completely.'); echo json_encode($data);}
