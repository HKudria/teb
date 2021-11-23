<?php
function validate_form($array){
  $errors = array();
  if(empty(trim($array['name']))){
    $errors[] = 'Please enter a name';
    }
  return $errors;
}

protected function options($name, $options) {
  $tmp = array();
    foreach ($options as $k => $v) {
      $s = "<option value=\"{$this->encode($k)}\""; if ($this->isOptionSelected($name, $k)) {
      $s .= ' selected'; }
      $s .= ">{$this->encode($v)}</option>";
      $tmp[] = $s;
    }
 return implode('', $tmp);
}

 ?>
