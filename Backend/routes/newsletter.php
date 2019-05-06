<?php
// <!-- CREATE TABLE `rzhou7`.`contact` (
//   `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
//   `update_time` TIMESTAMP NULL,
//   `id` INT NOT NULL AUTO_INCREMENT,
//   `name` VARCHAR(45) NOT NULL,
//   `email` VARCHAR(45) NOT NULL,
//   `subject` VARCHAR(45) NULL,
//   `message` VARCHAR(45) NULL,
//   PRIMARY KEY (`id`)); -->

$app->get('/api/newsletter', function ($request, $response, $args) {  //GET example
    $pdo =$this->pdo;
    $selectStatement = $pdo->select()
                            ->from('newsletter');
	$stmt = $selectStatement->execute();
	$newsletters= $stmt->fetchAll();
	$res['success'] = true;
	$res['data'] = $newsletters;
	$response->write(json_encode($res));
	$pdo = null;
	return $response;
});
$app->post('/api/newsletter', function ($request, $response, $args) { //POST example
 	$pdo =$this->pdo;
	$params = $request->getParsedBody();
	$email1 = $params['email1'];
    $insertStatement = $pdo->insert(array('email1'))
								->into('newsletter')
								->values(array($email1));
    $insert =  $insertStatement->execute();
	$res['status'] = 'success';
	$response->write(json_encode($res));
	$pdo = null;
	return $response;
});
?>