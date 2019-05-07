<?php


$app->post('/api/CreateAccount', function ($request, $response, $args) { //POST example
 	$pdo =$this->pdo;
	$params = $request->getParsedBody();
	$email = $params['email'];
    $password = $params['password'];
    $insertStatement = $pdo->insert(array('email', 'password'))
								->into('users')
								->values(array($email, $password));
    $insert =  $insertStatement->execute();
	$res['status'] = 'success';
	$response->write(json_encode($res));
	$pdo = null;
	return $response;
});
?>