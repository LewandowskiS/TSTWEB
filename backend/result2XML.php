<?php
/*
 * Función para transformar el resultado  de la base de datos en XML.
 * Esta función no es necesario modificarla. Solo hay que incluirla en el 
 * código para que el script dbConnect.php funcione, ya que ese script 
 * utiliza esta función.
 * */

function result2XML($db_result, $list_node_name, $elem_node_name){
  $xml = new DOMDocument("1.0");
  $xml->formatOutput=false; 

  $root=$xml->createElement($list_node_name);
  $xml->appendChild($root);

  $fields=$db_result->fetch_fields();

  while($row=mysqli_fetch_array($db_result)){
    $elem=$xml->createElement($elem_node_name);
    foreach ($fields as $field){
     $elem->appendChild($xml->createElement($field->name, $row[$field->name]));
    }
    $root->appendChild($elem);
       
  }
  return $xml->saveXML($xml->documentElement);
}
?>