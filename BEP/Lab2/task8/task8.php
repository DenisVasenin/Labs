<?php
// устанавливаем свой обработчик ошибок
set_error_handler("myErrorHandler");

// получаем и проверяем параметры запроса
$pairsArray = getParametresArray();
$arg1Value = getArgumentValue($pairsArray, 'arg1');
$arg2Value = getArgumentValue($pairsArray, 'arg2');
$operation = getOperation($pairsArray);

// выбираем операцию
switch ($operation) {
    case "add":
        echo add($arg1Value, $arg2Value);
        break;
    case "sub":
        echo sub($arg1Value, $arg2Value);
        break;
    case "mul":
        echo mul($arg1Value, $arg2Value);
        break;
    case "div":
        echo div($arg1Value, $arg2Value);
        break;
    default:
        break;
}

// FUNCTIONS ================================================================

function getParametresArray()
{
    $query = $_SERVER['QUERY_STRING'];
    parse_str($query, $pairsArray);
    if (count($pairsArray) != 3) {
        trigger_error("<b style=\"color: red\">Bad parameters count.</b>", E_USER_ERROR);
    }
    return $pairsArray;
}

function getArgumentValue($pairsArray, $argNumber)
{
    if (!isset($_GET[$argNumber])) {
        trigger_error("<b style=\"color: red\">$argNumber not found.</b>", E_USER_ERROR);
    } else {
        $argumentValue = $pairsArray[$argNumber];
        if (!is_numeric($argumentValue)) {
            trigger_error("<b style=\"color: red\">$argumentValue not a number.</b>", E_USER_ERROR);
        }
        return floatval($argumentValue);
    }
}

function getOperation($pairsArray)
{
    if (!isset($_GET['operation'])) {
        trigger_error("<b style=\"color: red\">Operation not found.</b>", E_USER_ERROR);
    } else {
        $operation = $pairsArray['operation'];
        if ($operation != 'add' && $operation != 'sub' && $operation != 'mul' && $operation != 'div') {
            trigger_error("<b style=\"color: red\">Undefined operation.</b>", E_USER_ERROR);
        }
        return $operation;
    }
}

function add($val1, $val2)
{
    return $val1 + $val2;
}

function sub($val1, $val2)
{
    return $val1 - $val2;
}

function mul($val1, $val2)
{
    return $val1 * $val2;
}

function div($val1, $val2)
{
    if ($val2 == 0) {
        trigger_error("<b style=\"color: red\">Division by zero.</b>", E_USER_ERROR);
        return;
    }
    return $val1 / $val2;
}

function myErrorHandler($errno, $errstr, $errfile, $errline)
{
    if (!(error_reporting() & $errno)) {
        // Этот код ошибки не включен в error_reporting,
        // так что пусть обрабатываются стандартным обработчиком ошибок PHP
        return false;
    }
    switch ($errno) {
        case E_USER_ERROR:
            echo "<b>Error [$errno] $errstr<br />";
            echo "Fatal error in string $errline from file $errfile</b>";
            exit(1);
            break;
        default:
            echo "<b>Undefined error: [$errno] $errstr<br /></b>";
            break;
    }
    // Не запускаем внутренний обработчик ошибок PHP
    return true;
}
