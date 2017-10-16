<?php 
//Configuracion
	require_once('../src/vendor/autoload.php');
	use Phalcon\Loader;
	use Phalcon\Mvc\Micro;
	use Phalcon\Di\FactoryDefault;
	use Phalcon\Db\Adapter\Pdo\Mysql as PdoMysql;
	use Phalcon\Http\Response;
	use Phalcon\Exception;
	use Phalcon\Validation;
	use Phalcon\Mvc\Model\Query;
	use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
	use \Firebase\JWT\JWT;
	$loader = new Loader();
	$loader->registerDirs(array( __DIR__ . '/models/'))->register();
	$di = new FactoryDefault();
	$di->set('db', function() {return new PdoMysql( array("host" => "localhost","username" => "user","password" => "user","dbname" => "hhrr", "options" => array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8')));});
	$app = new Micro($di);
	$app->notFound(function () use ($app) {$app->response->setStatusCode(404, "API Not Found!")->sendHeaders();$app->response->setJsonContent(array('status' => 404,'message' => 'API Not Found!','error' => 'API Not Found!' ))->send();});
//APIs
	$app->get('/ip', function() { // returns ip address to store in syslog
		$response=new Response();
		try{
			$ip = getenv('HTTP_CLIENT_IP')?:	getenv('HTTP_X_FORWARDED_FOR')?:	getenv('HTTP_X_FORWARDED')?: getenv('HTTP_FORWARDED_FOR')?: getenv('HTTP_FORWARDED')?:	getenv('REMOTE_ADDR');
			$response -> setJsonContent(array('status' => http_response_code(),'data'=> $ip));
		}catch (\Exception $e) {$response->setJsonContent(array('status'=> http_response_code(),'data'=>$e));}; return $response;});
	$app->post('/login', function() use($app) { //login...
		$response = new Phalcon\Http\Response();
		$req = $app->request->getJsonRawBody();
		$username = $req->userName;
		try {
			$key = pack('H*', findParameterGeneral("key"));
			$llave = substr($username, 0,2).substr($username, -1);
			$llave = strtoupper($llave);
			$llave = encrypt($llave,$key);
			$complement = encrypt($req->password,$key);
			$password_encrypted = $llave.$complement;
			$password_encrypted = encrypt($password_encrypted,$key);
			$user = secUser::query()
			->where("userName = :user:")
			->andWhere("isActive = 1")
			->andWhere("password = :password:")
			->bind(array("user" => $username, "password" => $password_encrypted))
			->execute();
			if(count($user)){
				$key = findParameterToken("keyToken");
						//get the resources and add them to the token...
						// $token = array("user" => $user[0]->userName, "profile_id" => $user[0]->profileId, "timeLog" => date('Y-m-d'), "exp" => time() + findParameterToken("Expiration Time"));
				$token = array("user" => $user, "timeLog" => date('Y-m-d'), "exp" => time() + findParameterToken("Expiration Time"));
				$jwt = JWT::encode($token, $key);
				$data=array(
					"id" => $user[0]->id,
					"userName" => $user[0]->userName,
					"firstName" => $user[0]->firstName,
					"lastName" => $user[0]->lastName,
					"email" => $user[0]->email,
					"profileId" => $user[0]->profileId,
					"phone" => $user[0]->phone,
					"employeeId" => $user[0]->employeeId,
					"state" => $user[0]->isActive,
					"avatar" => $user[0]->avatar,
					"token" => $jwt
					);
				$response -> setJsonContent(array('status' => http_response_code(), 'message' => 'Access granted!', 'user' => $data));
				addLog($user[0]->id,'1','','LOGIN');
			}else{
				$jwt = 0; 
				http_response_code(401);
				$response -> setStatusCode(401); 
				$response -> setJsonContent(array('status' => http_response_code(), 'message' => 'Invalid Credentials!'));
			}
		}catch (\Exception $e){$response->setJsonContent(array('status' => http_response_code(), 'message' => 'Error', 'data'=>$e.error ));
		}
		return $response;});
	$app->get('/validateToken', function(){
		$response=new Response();
		try{
			$jwt = getallheaders()[findParameterToken("HeaderToken")];
			$key = findParameterToken("KeyToken");
			$decoded = JWT::decode($jwt, $key, array('HS256'));
			$response->setStatusCode(200, "Token Ok!");
			$response->setJsonContent(array('message'=>'Token Ok'));
			return $response;
		}catch(\Firebase\JWT\ExpiredException $e){
			$response->setStatusCode(440, "Token expired!");
			$response->setJsonContent(array('message'=>'Su sesión ha expirado!'));
		}catch (\UnexpectedValueException $e) {
			$response->setStatusCode(500);
			$response->setJsonContent(array('message'=>'Unexpected value exception...'));
		}catch (\Exception $e){
			$response->setStatusCode(500);
			$response->setJsonContent(array('message'=>'Unexpected exception...'));
		}
		$response->send();
		die();});
	$app->get('/getToken', function() use($app){ 
		$response = new Phalcon\Http\Response();
		try {
			$jwt = getallheaders()[findParameterToken("HeaderToken")];
			$key = findParameterToken("KeyToken");
			$decoded = JWT::decode($jwt, $key, array('HS256'));
			http_response_code(200);
			$response->setJsonContent(array('status'=> http_response_code(),'message'=> 'Success','data'=> $decoded,'userId' => $decoded->user[0]->id));
		} catch (\Exception $e) {http_response_code(500);$response->setJsonContent(array('status'=> http_response_code(),'message'=>'error','data'=>$e.message));};
		return $response; });
	$app->get('/user', function() use($app) { //returns users in user table
		$response = new Phalcon\Http\Response();
		try {
			validateToken();
			$params = "userName != 'root'" ;
			$data = secUser::find($params);
			$response -> setJsonContent(array('status' => http_response_code(),'data'=> $data));
		}catch (\Exception $e) {$response->setJsonContent(array('status'=> http_response_code(),'data'=>$e));	};
		return $response; });
	$app->put('/user', function() use($app){ //modifies user 
		$response = new Phalcon\Http\Response();
		try {
			$decoded = validateToken();
			$req = $app->request->getJsonRawBody();
			$user = secUser::findFirst($req->id);
			$user->userName = strtolower($req->userName);
			$user->firstName = $req->firstName;
			$user->lastName = $req->lastName;
			// $user->password = generarClave(strtolower($req->userName), $req->password);
			$user->profileId = $req->profileId;
			$user->employeeId = $req->employeeId;
			$user->email = $req->email;
			$user->phone = $req->phone;
			$user->avatar = $req->avatar;
			$user->isActive = $req->isActive;
			$isCommit = $user->save($user);
			if ($isCommit==true){$response -> setStatusCode(200);addLog($decoded->user[0]->id,'2','SecUser','PUT');};
			$response -> setJsonContent(array('status'=> http_response_code(),'type'=>'info','message'=>'Usuario agregado','commit'=> $isCommit,'data'=>$isCommit));
		}catch (\Exception $e) {http_response_code(500);	$response->setJsonContent(array('status'=> http_response_code(),'type'=>'error','message'=>$e.error,'data'=>$e));};
		return $response; });
	$app->post('/user', function() use($app){ //adds a new user
		$response = new Phalcon\Http\Response();
		$req = $app->request->getJsonRawBody();
		$userName = $req->userName;
		$password = $req->password;
		try {
			// validateToken();
			$encryptedPassword = generarClave($userName, $password);
			$user = new SecUser();
			$user->userName = strtolower($req->userName);
			$user->firstName = $req->firstName;
			$user->lastName = $req->lastName;
			$user->password =$encryptedPassword;
			$user->profileId = $req->profileId;
			$user->employeeId = $req->employeeId;
			$user->email = $req->email;
			$user->phone = $req->phone;
			$user->avatar = $req->avatar;
			$user->isActive = $req->isActive;
			// $user->changePass = $req->changePass;
			$isCommit = $user->save($user);
			if ($isCommit==true){
				if ($req->employeeId ){
					$newId = $user->getWriteConnection()->lastInsertId();
					$useremp = new secUserEmp();
					$useremp->userId = $newId;
					$useremp->employeeId = $req->employeeId;
					$isCommit = $useremp->save($useremp);
					if ($isCommit==true){$response -> setStatusCode(200);};
				};
			};
			$response -> setJsonContent(array('status'=> http_response_code(),'type'=>'info','message'=>'Usuario agregado','commit'=> $isCommit,'data'=>$isCommit));
		}catch (\Exception $e) {http_response_code(500);	$response->setJsonContent(array('status'=> http_response_code(),'type'=>'error','error'=>$e));};
		return $response;	});
	$app->post('/pass', function() use($app){ //returns password for given user and password combination... 
		$response = new Phalcon\Http\Response();
		$req = $app->request->getJsonRawBody();
		$userName = $req->userName;
		$password = $req->password;
		$encryptedPassword = generarClave($userName, $password);
		$response -> setJsonContent(array('Password:'=>$encryptedPassword));
		return $response;	});
	$app->get('/notUser', function() use($app) { // echo 'Devuleve los empleados que todavía no tienen una cuenta de usuario.';
		$response = new Phalcon\Http\Response();
		try {
			validateToken();
			$data=array();
			$phql ="SELECT e.id, e.firstName FROM mainEmployee e LEFT OUTER JOIN secUserEmp ue ON e.id = ue.employeeId WHERE (ue.employeeId IS NULL AND e.firstName!='root') ";
			$data = $app->modelsManager->executeQuery($phql);
			if(count($data)>0){http_response_code(200);}else{http_response_code(200);}
			$response -> setJsonContent(array('status' =>http_response_code(),'data'=> $data));
		}catch (\Exception $e) {$response->setJsonContent(array('status'=> http_response_code(500),'data'=>$e.message));}; 
		return $response;	});
	$app->get('/getAll/{table}', function ($table) use($app){ //Devuelve todos los registros en la tabla pasada como parametro table.
		$response = new Phalcon\Http\Response();
		try {
			// validateToken();
			$data=array();
			$phql = "SELECT * FROM $table";
			$data = $app->modelsManager->executeQuery($phql);
			if(count($data)>0){http_response_code(200);}else{http_response_code(406);}
			$response -> setJsonContent(array('status' =>http_response_code(),'data'=> $data));
		}catch (\Exception $e) {$response->setJsonContent(array('status'=> http_response_code(500),'data'=>$e));	}; 
		return $response;	});
	$app->get('/academicLevel', function() use($app) { //returns all profiles in catalogue
		$response = new Phalcon\Http\Response();
		try {
			validateToken();
			$data = CatAcademicLevel::find();
			$response -> setJsonContent(array('status' => http_response_code(),'data'=> $data));
		}catch(\Exception $e) {http_response_code(500);	$response->setJsonContent(array('status'=> http_response_code(),'message'=>'Error','data'=>[]));	};
		return $response;	});
	$app->get('/profile', function() use($app) { //returns all profiles in catalogue
		$response = new Phalcon\Http\Response();
		try {
			validateToken();
			$data = secProfile::find();
			$response -> setJsonContent(array('status' => http_response_code(),'data'=> $data));
		}catch(\Exception $e) {http_response_code(500);	$response->setJsonContent(array('status'=> http_response_code(),'message'=>'Error','data'=>[]));	};
		return $response;	});
	$app->get('/mainResource', function() use($app) { //returns all Modules 
		$response = new Phalcon\Http\Response();
		try {
			validateToken();
			$data = SysModule::find();
			$response->setJsonContent(array('status'=> http_response_code(),'message'=>'Success','data'=> $data));
		}catch(\Firebase\JWT\ExpiredException $e){
			http_response_code(440);
			$response -> setStatusCode(440);
			$response->setJsonContent(array('status'=> http_response_code(), 'message'=>'Token expired!', 'data'=>$e.error));
		}catch(\Exception $e){$response->setJsonContent(array('status' => http_response_code(), 'message' => 'Error', 'data'=>$e.error ));};
		return $response;	});
	$app->get('/resource', function() use($app) { //returns all resources
		$response = new Response();
		try {
			validateToken();
			$data = SysResource::find();
			$response -> setJsonContent(array('status' => http_response_code(),'data'=> $data));
		}catch (\Exception $e) {$response->setJsonContent(array('status'=> http_response_code(),'data'=>$e));	};
		return $response;	});
	$app->get('/resourceById/{id}', function($id) use($app) { //returns all resources by profile id
		$response = new Phalcon\Http\Response();
		try {
			validateToken();
			$phql ="	SELECT r.id, r.name, r.description, r.module, r.icon, r.state, r.inMenu
						FROM secProfile p
						INNER JOIN secProfileResource pr ON p.id = pr.profileId
						INNER JOIN SysResource r ON pr.resourceId = r.id
						WHERE p.id = '$id'";
			$data = [];
			$data = $app->modelsManager->executeQuery($phql);
			$response -> setJsonContent(array('status'=> http_response_code(200),'message'=> 'Success','data'=> $data));
		}catch(\Firebase\JWT\ExpiredException $e){$response->setJsonContent(array('status'=> http_response_code(440),'message'=>'Token expired!','data'=>$e.message));
		}catch(\Exception $e){$response->setJsonContent(array('status'=> http_response_code(500),'message'=>'Error','data'=>$e.message));};
		return $response;	});
	$app->get('/unit', function(){ //returns company units 
		$response = new Response();
		try {
			validateToken();
			$data = CatCompanyUnit::find();
			$response -> setJsonContent(array('status' => http_response_code(),'data'=> $data));
		}catch (\Exception $e) {$response->setJsonContent(array('status'=> http_response_code(),'data'=>$e));};
		return $response;	});
	$app->get('/job', function(){ //returns all jobs in catalogue
		$response = new Response();
		try {
			validateToken();
			$data = CatJob::find();
			$response -> setJsonContent(array('status' => http_response_code(),'data'=> $data));
		}catch (\Exception $e) {$response->setJsonContent(array('status'=> http_response_code(),'data'=>$e));};
		return $response;	});
	$app->get('/employee', function(){ //returns all employees
		$response = new Response();
		try {
			validateToken();
			$data = MainEmployee::find();
			$response -> setJsonContent(array('status' => http_response_code(),'data'=> $data));
		}catch (\Exception $e) {$response->setJsonContent(array('status'=> http_response_code(),'data'=>$e));};
		return $response;	});
	$app->post('/employee', function() use($app){ //adds an employee 
		$response = new Phalcon\Http\Response();
		$request = $app->request->getJsonRawBody();
		try {
			$decoded = validateToken();
			$employee = new MainEmployee();
			$employee->companyUnit = $request->companyUnit;
			$employee->email = $request->email;
			$employee->firstName = $request->firstName;
			$employee->job = $request->job;
			$employee->lastName = $request->lastName;
			$employee->mobilePhone = $request->mobilePhone;
			$employee->salary = $request->salary;
			$employee->idCard= $request->idCard;
			$employee->academicLevel = $request->academicLevel;
			$employee->profession= $request->profession;
			$employee->maritalStatus= $request->maritalStatus;
			$employee->gender= $request->gender;
			$employee->joined= $request->joined;
			// $employee->address = '1';$employee->bloodType = '1';$employee->city = '1';$employee->createdBy = '1';$employee->creationDate = '';$employee->departmentId = '1';$employee->dob = '';$employee->gender = '1';$employee->homePhone = '1';$employee->id = '';$employee->idCard = '1';$employee->joined = '1';$employee->maritalStatus = '1';$employee->nationality = '1';$employee->officePhone = '1';$employee->profession = '1';$employee->shift = '1';$employee->state = '1';$employee->type = '1';print_r($employee);
			$isCommit = $employee->save();
			if ($isCommit==true){$response -> setStatusCode(200); addLog($decoded->user[0]->id,'2','MainEmployee','POST');};
			$response -> setJsonContent(array('status'=> http_response_code(),'type'=>'info','message'=>'Empleado agregado','commit'=> $isCommit,'data'=>$employee->getMessages()));
		}catch (\Exception $e) {http_response_code(500);	$response->setJsonContent(array('status'=> http_response_code(),'type'=>'error','error'=>$e));};
		return $response; });
	$app->put('/employee', function() use($app){ //modifies an employee
		$response = new Phalcon\Http\Response();
		try {
			$decoded=validateToken();
			$request = $app->request->getJsonRawBody();
			$employee = MainEmployee::findFirst($request->id);
			$employee->companyUnit = $request->companyUnit;
			$employee->email = $request->email;
			$employee->firstName = $request->firstName;
			$employee->job = $request->job;
			$employee->lastName = $request->lastName;
			$employee->mobilePhone = $request->mobilePhone;
			$employee->salary = $request->salary;
			$employee->idCard= $request->idCard;
			$employee->academicLevel = $request->academicLevel;
			$employee->profession= $request->profession;
			$employee->maritalStatus= $request->maritalStatus;
			$employee->gender= $request->gender;
			$employee->joined= $request->joined;
			$isCommit = $employee->save();
			if ($isCommit==true){$response -> setStatusCode(200); addLog($decoded->user[0]->id,'2','MainEmployee','PUT');};
			$response -> setJsonContent(array('status'=> http_response_code(),'type'=>'info','message'=>'Registro modificado','commit'=> $isCommit,'data'=>$employee->getMessages()));
		}catch (\Exception $e) {http_response_code(500);	$response->setJsonContent(array('status'=> http_response_code(),'type'=>'error','error'=>$e));};
		return $response; });
	$app->get('/employeeBoss/{id:[0-9]+}', function ($id) use($app){ //Devuelve datos del jefe de un empleado
		$response = new Phalcon\Http\Response();
		try {
			validateToken();
			$data=array();
			$phql = "SELECT e.id, e.firstName, cs.unitId, cs.parentUnitId, ee.firstName as Jefe, ee.email as email
			from mainCompanyStructure cs
			inner join mainEmployee e ON cs.unitId = e.companyUnit
			inner join mainEmployee ee ON cs.parentUnitId = ee.companyUnit
			inner join catCompanyUnit cu on cs.unitId = cu.id
			where e.id = '$id'";
			$data = $app->modelsManager->executeQuery($phql);
			if(count($data)>0){http_response_code(200);}else{http_response_code(406);}
			$response -> setJsonContent(array('status' =>http_response_code(),'data'=> $data));
		}catch (\Exception $e) {$response->setJsonContent(array('status'=> http_response_code(500),'data'=>$e));	}; 
		return $response;	});
	$app->get('/overtime', function(){ //Catalogo de horas extras
		$response = new Response();
		try {
			validateToken();
			$data = catOvertime::find();
			$response -> setJsonContent(array('status' => http_response_code(),'data'=> $data));
		}catch (\Exception $e) {$response->setJsonContent(array('status'=> http_response_code(),'data'=>$e));};
		return $response;	});
	$app->get('/closedOvertimeRequest', function() use($app){	//Devuelve las solicitudes de horas extras cerradas
		$response=new Response();
		try {
			// validateToken();
			$data=[];
			$phql="SELECT e.firstName, r.id, r.date, r.startTime, r.estimatedTime, r.requestedBy, r.class, r.description, r.state, r.observations, e.salary
			from payOvertimeRequest r
			inner join mainEmployee e on r.employeeId = e.id
			where r.state='Cerrada'
			order by e.id, r.date";
			$data = $app->modelsManager->executeQuery($phql);
			if($data){$response->setJsonContent(array('status'=>200,'message'=>'success','data'=>$data));	}else{$response->setJsonContent(array('status'=>200,'message'=>'Tabla vacía!'));};
		}catch (Exception $e){$response->setJsonContent(array('status'=>500,'message'=>'Internar error services','error'=> $e.error));};
		return $response;	});
	$app->get('/allOvertimeRequest', function() use($app){	//Devuelve todas las solicitudes de horas extras
		$response=new Response();
		try {
			// validateToken();
			$data=[];
			$phql="SELECT e.firstName, r.id, r.date, r.startTime, r.estimatedTime, r.requestedBy, r.class, r.description, r.state, r.observations, e.salary
			from payOvertimeRequest r
			inner join mainEmployee e on r.employeeId = e.id
			order by e.id, r.date";
			$data = $app->modelsManager->executeQuery($phql);
			if($data){$response->setJsonContent(array('status'=>200,'message'=>'success','data'=>$data));	}else{$response->setJsonContent(array('status'=>200,'message'=>'Tabla vacía!'));};
		}catch (Exception $e){$response->setJsonContent(array('status'=>500,'message'=>'Internar error services','error'=> $e.error));};
		return $response;	});
	$app->get('/pendingOvertimeRequestbyBoss/{id}', function($id) use($app) { //Devuelve las solicitudes de horas extras pendientes de aprobacion para un determinado Jefe
		$response=new Response();
		try {
			// validateToken();
			$data=[];
			$phql="SELECT emp.firstName, r.id, r.date, r.startTime, r.estimatedTime, r.requestedBy, r.description, r.state
			from mainCompanyStructure cs
			inner join mainEmployee emp ON cs.unitId = emp.companyUnitId
			inner join mainEmployee boss ON cs.parentUnitId = boss.companyUnitId
			inner join catCompanyUnit cu on cs.unitId = cu.id
			inner join payOvertimeRequest r on emp.id = r.employeeId
			where boss.id= '$id'";
			$data = $app->modelsManager->executeQuery($phql);
			if($data){$response->setJsonContent(array('status'=>200,'message'=>'success','data'=>$data));}else{$response->setJsonContent(array('status'=>200,'message'=>'Tabla vacía!'));}
		}catch (Exception $e){$response->setJsonContent(array('status'=>500,'message'=>'Internar error services','error'=> $e.error));}
		return $response;	});
	$app->get('/overReqById/{id:[0-9]+}', function($id) use($app){ //Devuelve las solicitudes de horas extras de un empleado
		$response=new Response();
		try {
			validateToken();
			$request = $app->request->getJsonRawBody();
			$parametros = "employeeId = '" . $id . "'" ;
			$data = payOvertimeRequest::find($parametros);
			if( $data){$response->setJsonContent(array('status'  => 200, 'message' => 'success', 'data' => $data));}else{$response->setJsonContent(array('status' => 200,'message' => 'Tabla vacía!'));};
		} catch (Exception $e) {$response->setJsonContent(array('status' => 500,'message' => 'Internar error services','error' => $e));};
		return $response;	});
	$app->get('/overReqByMonth/{id:[0-9]+}', function($id) use($app){ //devuelve datos para kpi y grafico
		$response = new Phalcon\Http\Response();
		try {
			// validateToken();
			$data=array();
			$phql ="SELECT r.id,  r.employeeId, d.activityDate, d.startTime, d.endTime
			from payOvertimeDetail d 
			inner join payOvertimeRequest r on d.requestId = r.id 
			inner join mainEmployee e on r.employeeId = e.id
			where month(d.activityDate)='$id'
			order by e.id, d.activityDate, d.startTime";
			$data = $app->modelsManager->executeQuery($phql);
			if (count($data)>0) {http_response_code(200);} else {http_response_code(406);};
			$response -> setJsonContent(array('status' =>http_response_code(),'data'=> $data));
		} catch (\Exception $e) {$response->setJsonContent(array('status'=> http_response_code(500),'data'=>$e.message));}; 
		return $response;	});
	$app->get('/overReqByRange/{range}', function($range) use($app){ //Devuelve datos para la planilla - solo las cerradas y autorizadas
		$startDate = substr($range, 0, 10); 
		$endDate = substr($range,-10); 
		$response = new Phalcon\Http\Response();
		try {
			// $tok=validateToken();
			$data=array();
			$phql="SELECT e.id as employeeId, e.firstName, r.id, r.date, r.startTime, r.estimatedTime, r.requestedBy, r.class, r.description, r.state, r.decidedBy, r.decisionDate , r.observations, e.salary
			from payOvertimeRequest r
			inner join mainEmployee e on r.employeeId = e.id
			where r.date>='$startDate ' and r.date<='$endDate' and (r.state='Cerrada' or r.state='Autorizada')
			order by e.firstName,r.date";
			$data = $app->modelsManager->executeQuery($phql);
			if (count($data)>0) {
				http_response_code(200);
				$response -> setJsonContent(array('status' =>http_response_code(),'message' => 'Ok','data'=> $data));
			} else {
				http_response_code(406);
				$response -> setJsonContent(array('status' =>http_response_code(),'message' => 'No hay datos en ese rango!','data'=> $data));
			};
		} catch (\Exception $e) {$response->setJsonContent(array('status'=> http_response_code(500),'data'=>$e));};
		return $response;	});
	$app->post('/overReq', function() use($app){ //Agrega una solicitud de horas extras
		$response=new Response();
		try {
			$decoded = validateToken();
			$request = $app->request->getJsonRawBody();
			$fecha = date ( $request->date );
			$parametros = "employeeId = '" . $request->employeeId . "' AND date = '" . $fecha . "'" ;
			$valida = payOvertimeRequest::find($parametros);
			if( count($valida) > 0 ){
				http_response_code(406);
				$response->setJsonContent(array('status' => 406,'message' => 'Solo se permite una solicitud diaria.')); 
			}else{
				$hora = new payOvertimeRequest();
				$hora->employeeId = $request->employeeId;
				$hora->date = $request->date;
				$hora->startTime = $request->startTime;
				$hora->estimatedTime = $request->estimatedTime;
				$hora->requestedBy = $request->requestedBy;
				$hora->class = $request->class;
				$hora->description = $request->description;
				$hora->isOpen = true;
				$hora->state = 'Pendiente' ;
				$hora->decidedBy = $request->decidedBy;
				$hora->decisionDate = $request->decisionDate;
				$hora->authorizedBy = $request->authorizedBy;
				$hora->authorizationDate = $request->authorizationDate;
				$hora->payDate = $request->payDate;
				$hora->observations = $request->observations;
				$isCommit = $hora->save($hora);
				addLog($decoded->user[0]->id,'2','payOvertimeRequest','POST');
				$response->setJsonContent(array('status'  => 200, 'message' => 'Su solicitud ha sido enviada para aprobación.', 'commit' => $isCommit));
			}
		} catch (Exception $e) {$response->setJsonContent(array('status' => 500,'message' => 'Internar error services','error' => $e));};
		return $response;	});
	$app->put('/overReq', function() use($app){ //Modifica una solicitud
		$message='';
		$messageType='';
		$response = new Response();
		try{
			$decoded = validateToken();
			$request = $app->request->getJsonRawBody();
			$overreq = PayOvertimeRequest::findFirst($request->id);
			$overreq->state = $request->state;
			$overreq->decidedBy = $request->decidedBy;
			$overreq->decisionDate = $request->decisionDate;
			$overreq->authorizedBy = $request->authorizedBy;
			$overreq->authorizationDate = $request->authorizationDate;
			$overreq->observations = $request->observations;
			$isCommit = $overreq->save($overreq);
			addLog($decoded->user[0]->id,'2','pay_overtime_request','PUT');
			if ($isCommit) { $message = 'Registro actualizado.'; $messageType='success';}else{$message='No se pudo actualizar el registro!'; $messageType='error';};
			$response->setJsonContent(array('status' => http_response_code(), 'message' => $message, 'type' => $messageType,'commit' => $isCommit));
		}catch (Exception $e) {$response->setJsonContent(array('status' => 500,'message' => 'Internar error services','error' => $e.error));};
		return $response; 	});
	$app->get('/overParams/{id:[0-9]+}', function($id) use($app){ // Devuleve los parametros de horas extras del un empleado.';
		$response = new Phalcon\Http\Response();
		try {
			// validateToken();
			$data=array();
			$phql ="SELECT e.firstName as Empleado, wh.name as Jornada, wh.overtimeStart as Permitido, wh.maxOverPerWeek as Semana
			from mainEmployee e
			inner join catWorkingHours wh on e.shift = wh.id 
			where e.id = '$id'";
			$data = $app->modelsManager->executeQuery($phql);
			if(count($data)>0){http_response_code(200);}else{http_response_code(200);}
			$response -> setJsonContent(array('status' =>http_response_code(),'data'=> $data));
		}catch (\Exception $e) {$response->setJsonContent(array('status'=> http_response_code(500),'data'=>$e.message));}; 
		return $response;	});
	$app->get('/overDetail/{id:[0-9]+}', function($id) use($app){ //Devuelve el detalle de una solicitud de horas extras
		$response=new Response();
		try {
					// validateToken();
			$request = $app->request->getJsonRawBody();
			$parametros = "requestId = '" . $id . "'" ;
			$data = payOvertimeDetail::find($parametros);
			if( $data){$response->setJsonContent(array('status'  => 200, 'message' => 'success', 'data' => $data));}else{$response->setJsonContent(array('status' => 200,'message' => 'Tabla vacía!'));};
		} catch (Exception $e) {$response->setJsonContent(array('status' => 500,'message' => 'Internar error services','error' => $e));};
		return $response;	});
	$app->post('/overDetail', function() use ($app){	//Agrega una linea al detalle de horas extras
		$response=new Response();
		try {
			$decoded = validateToken();
			$request = $app->request->getJsonRawBody();
			$fecha = date ( $request->activityDate );
			$hora = $request->startTime;
			$parametros = "activityDate = '" . $fecha . "' AND startTime = '" . $request->startTime . "' AND requestId = '" . $request->requestId . "'" ;
			$valida = payOvertimeDetail::find($parametros);
			if( count($valida) > 0 ){
				http_response_code(406);
				$response->setJsonContent(array('status' => 406,'message' => 'Ya tiene una actividad a esa hora!')); 
			}else{
				$detail = new payOvertimeDetail();
				$detail->requestId = $request->requestId;
				$detail->entryDate = $request->entryDate;
				$detail->activityDate = $request->activityDate;
				$detail->startTime = $request->startTime;
				$detail->endTime = $request->endTime;
				$detail->activities = $request->activities;
				$isCommit = $detail->save($detail);
				addLog($decoded->user[0]->id,'2','payOvertimeDetail','POST');
				$response->setJsonContent(array('status'  => 200, 'message' => 'Registro agregado.', 'commit' => $isCommit));
			}
		} catch (Exception $e) {$response->setJsonContent(array('status' => 500,'message' => 'Internar error services','error' => $e));};
		return $response;	});
	$app->get('/overtimeBar', function() use ($app){ // returns data for overtime bar chart - hours by employee
		$response=new Response();
		try {
			$data = ViewOvertime::find();
			$response -> setJsonContent(array('status' => http_response_code(),'data'=> $data));
		}catch (\Exception $e) {$response->setJsonContent(array('status'=> http_response_code(),'data'=>$e));	};
		return $response; });
	$app->get('/overtimeLine', function() use ($app){ // returns data for overtime line chart - total hours in month
		$response=new Response();
		try {
			$data=array();
			$phql = "SELECT monthname(r.date) as Mes, week(r.date) as Semana, dayname(r.date) as Dia, r.date, r.employeeId, u.userName as Usuario, e.firstName as Empleado, count(r.estimatedTime) as Solicitudes, sum(r.estimatedTime) as Horas
			from payOvertimeRequest r
			inner join mainEmployee e on r.employeeId=e.id
			inner join secUser u on r.employeeId=u.employeeId
			group by r.date
			order by r.date";
			$data = $app->modelsManager->executeQuery($phql);
			if(count($data)>0){http_response_code(200);}else{http_response_code(200);}
			$response -> setJsonContent(array('status' =>http_response_code(),'data'=> $data));
		}catch (\Exception $e) {$response->setJsonContent(array('status'=> http_response_code(500),'data'=>$e));}; 
		return $response; });
	$app->get('/payrolltypes', function(){ //returns payroll types
		$response = new Response();
		try{
			$data = array();
			$types = catPayrollType::find();
			$response->setJsonContent(array('status' => 200,'message' => 'success', 'data' => $types));
		}catch(\Exception $e){$response->setJsonContent(array('status' => 500,'message' => 'Internal error services'));};
		return $response;	
		});
	$app->get('/kpi', function() use($app){//returns information for indicators...
		$response = new Response();
		try {
			// validateToken();
			$he=[];
			$phql="SELECT count(r.id) as Solicitudes, sum(r.estimatedTime) as Horas,
			(select count(*) from PayOvertimeRequest r where MONTH(r.dateTimeStamp)=month(curdate()) and r.state='Pendiente') as Pendientes	
			FROM PayOvertimeRequest r where MONTH(r.dateTimeStamp)=month(curdate())";
			$he = $app->modelsManager->executeQuery($phql);
			$emp=[];
			$phql="SELECT count(e.id) as Empleados FROM MainEmployee e";
			$emp = $app->modelsManager->executeQuery($phql);
			$data_obj=[];
			@$data_obj[0]->he=$he[0];
			@$data_obj[0]->emp=$emp[0];
			$response->setJsonContent(array('status'=>200,'message'=>'success', 'data'=>$data_obj));
		}catch (Exception $e){$response->setJsonContent(array('status'=>500,'message'=>'Internar error services','error'=> $e.error));};
		return $response; });
	$app->get('/fecha', function() {// date functions...
		$hoy = getdate();
		print_r($hoy);
		echo strtotime("now"), "\n";
		echo strtotime("10 September 2000"), "\n";
		echo strtotime("+1 day"), "\n";
		echo strtotime("+1 week"), "\n";
		echo strtotime("+1 week 2 days 4 hours 2 seconds"), "\n";
		echo strtotime("next Thursday"), "\n";
		echo strtotime("last Monday"), "\n";
		$input = "2016-02-10T10:09:10";
		$info = date_parse($input);
		echo "Year:",$info["year"], "\nMonth:", $info["month"]; });
	//En proceso...
	$app->post("/overtimePayroll", function() use($app){
		$porcentajes=CatOvertime::find();
		$planillas = payPayrollHeader::find();
		if (count($planillas)>0) {
			$ultima = $planillas->getLast();
			$ultimo_id=$ultima->idplanilla+1;
		} else {
			$ultimo_id=1;
		}
		//Encabezado de la Planilla
		$response = new Response(); 
		$request = $app->request->getJsonRawBody();
		$fecha = substr($request->fechapago, 0, 10); 
		$parametros = " = '" . $request->idtipoplanilla . "' AND fechapago = '" . $fecha ."'" ;
		$existe=payPayrollHeader::find($parametros);
		if( count($existe) > 0 ){
			$response->setJsonContent(array('status' => 404,'message' => 'La Planilla ya existe!')); 
			return $response;
		}
		try{
			$planilla=new payPayrollHeader();
			$planilla->id = $ultimo_id;
			$planilla->payrollmodule = $request->payrollmodule;
			$planilla->month = $request->month;
			$planilla->fromDate = $request->fromDate;
			$planilla->toDate = $request->toDate;
			$planilla->payDate = $request->payDate;
			$planilla->workflowStatus = $request->workflowStatus;
			$planilla->isPayed = $request->isPayed;
			$isCommit=$planilla->save($planilla);
			$textfile="planilla".$fecha.".txt";
			$payroll = fopen($textfile,"w");
			$content = "Planilla: ".$ultimo_id."-".$planilla->RrhhTipoplanilla->nombre.", Fecha: ".$fecha."\n\n";
			fwrite($payroll,$content);
			$response->setJsonContent(array('status'  => 200, 'message' => 'Registro de encabezado de planilla creado', 'commit' => $isCommit));
		} catch(\Exception $e) {
			$response->setJsonContent(array('status' => 500,'message' => 'No se pudo crear el encabezado de planilla!','error' => $e));
			return $response;
		}
		//Detalle de planilla
		$empleados=MainEmployee::find();
		$planilla_detalle=new PayPayrollDetail();
		foreach ($empleados as $empleado) {
			echo $empleado->nombre;
			$response = new Response();
			$planilla_detalle->idplanilladetalle="";
			$planilla_detalle->idplanilla=$planilla->idplanilla;
			$planilla_detalle->idempleado=$empleado->idempleado;
			$fecha1 = date_parse($request->fechapago);
			$horasextrasempleado=RrhhMovhorasextras::find("idempleado='$empleado->idempleado'");
			if (count($horasextrasempleado)>0){
				echo "\ntiene ", count($horasextrasempleado), " registros de hora extra";
				$total_horas_extras=0;
				foreach ($horasextrasempleado as $hora ) {
					$fecha2=date_parse($hora->fechainicio);
					if ($fecha1["month"]==$fecha2["month"] and $fecha1["year"]==$fecha2["year"]){
						foreach ($porcentajes as $p){
							$current_time = $hora->horainicio; echo "\n ", $current_time;
							$sunrise = $p->horainicio; 
							$sunset = $p->horafin; 
							if(strtotime($current_time) >= strtotime($sunrise) && strtotime($current_time) < strtotime($sunset)) { 
								echo "\n $p->descripcion "; 
									// }
									// $a=date_parse($p->horainicio); $b=date_parse($hora->horainicio); $c=date_parse($p->horafin);
									// echo $a["hour"],$b["hour"],$c["hour"];
									// if ($b["hour"] >= $a["hour"] and $b["hour"] < $c["hour"]){
								$tasaPorHora=$empleado->salario/30/8;
									// echo "Tasa:",$tasaPorHora;
								$porcentaje=1+$p->porcentaje;
									// echo $porcentaje;
								$total_horas_extras+=$hora->cantidad*$tasaPorHora*$porcentaje;
								echo "\n",$total_horas_extras;
							}
						} 
					}
					$planilla_detalle->salario=$total_horas_extras;
					echo "\n",$total_horas_extras;
				}
			}else {
				$planilla_detalle->salario=0;
			}
			$planilla_detalle->bruto=$planilla_detalle->salario;
			$isCommit=$planilla_detalle->save($planilla_detalle);
			$response->setJsonContent(array('status'  => 200, 'message' => 'Registro del empleado creado', 'commit' => $isCommit));
		};
		fclose($payroll);
		return $response;	});
//Funciones
	function new_id() { //retuens last payroll id... consider replacing with builtin function...
		$planillas = RrhhPlanilla::find(); if (count($planillas)>0) {$ultima = $planillas->getLast(); $ultimo_id=$ultima->idplanilla+1;} else {$ultimo_id=1;}; return $ultimo_id;
		};
	function payroll_head($app) {//devuelve el header de una planilla
		$response = new Response();
		$request = $app->request->getJsonRawBody();
		$fecha = substr($request->fechapago, 0, 10); 
		$parametros = "idtipoplanilla = '" . $request->idtipoplanilla . "' AND fechapago = '" . $fecha ."'" ;
		$existe=RrhhPlanilla::find($parametros);
		if( count($existe) > 0 ){
			$response->setJsonContent(array('status' => 404,'message' => 'La Planilla ya existe!')); 
			return $response;
		}
		try{
			$request = $app->request->getJsonRawBody();
			$planilla=new RrhhPlanilla();
			$planilla->idplanilla = $ultima;
			$planilla->idtipoplanilla = $request->idtipoplanilla;
			$planilla->periodo = $request->periodo;
			$planilla->fechainicio = $request->fechainicio;
			$planilla->fechafin = $request->fechafin;
			$planilla->fechapago = $request->fechapago;
			$planilla->estado = $request->estado;
		} catch(\Exception $e){$response->setJsonContent(array('status' => 500,'message' => 'No se pudo crear el encabezado de planilla!','error' => $e));};
		return  $planilla;};
	function generarClave($username, $password){//generates an encrypted password for given user+pass combination
		$key = pack('H*', findParameterGeneral("key"));
		$llave = substr($username, 0,2).substr($username, -1);
		$llave = strtoupper($llave);
		$llave = encrypt($llave,$key);
		$complement = encrypt($password,$key);
		$password_encrypted = $llave.$complement;
		$password_encrypted = encrypt($password_encrypted,$key);
		return $password_encrypted;};
	function encrypt($data, $key){
		return md5(mcrypt_encrypt(MCRYPT_RIJNDAEL_128,$key,$data,MCRYPT_MODE_CBC,"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"));
		};
	function findParameterToken($key){
		$data = sysTokenparameter::findFirst(array("conditions"=>"name = :value:",	'bind' => array('value' =>  $key)));
		return $data->value;
		};
	function findParameterGeneral($key){
		$data = sysGeneralparameter::findFirst(array("conditions"=>"name = :value:",	'bind' => array('value' =>  $key)));
		return $data->value;
		};
	function validateToken() {
		$response=new Response();
		try{
			$jwt = getallheaders()[findParameterToken("HeaderToken")];
			$key = findParameterToken("KeyToken");
			$decoded = JWT::decode($jwt, $key, array('HS256'));
			return $decoded;
		}catch(\Firebase\JWT\ExpiredException $e) {$response->setStatusCode(440, "Token expired!"); $response->setJsonContent(array('isValid'=>false, 'message'=>'Token expired!'));
		}catch (\UnexpectedValueException $e) {	$response->setStatusCode(500); $response->setJsonContent(array('isValid'=>false, 'message'=>'Unexpected value exception...'));
		}catch (\Exception $e) {$response->setStatusCode(500); $response->setJsonContent(array('isValid'=>false, 'message'=>'Unexpected exception...'));};
		$response->send(); die();};
	function addLog($id,$action,$table,$enum) {
		$ip = getenv('HTTP_CLIENT_IP')?:	getenv('HTTP_X_FORWARDED_FOR')?:	getenv('HTTP_X_FORWARDED')?: getenv('HTTP_FORWARDED_FOR')?: getenv('HTTP_FORWARDED')?:	getenv('REMOTE_ADDR');
		$record = new SysLog();
		$record->userId = $id;
		$record->action = $action;
		$record->table = $table;
		$record->actionEnum = $enum;
		$record->userName = $ip;
		$isCommit=$record->save($record);
		return $isCommit;};
	function getUserId($id){
		$phql="SELECT u.id from SecUser u inner join MainEmployee e on u.employeeId = e.id where u.employeeId='$id'"; 
		return $app->modelsManager->executeQuery($phql);
		};
$app->handle();