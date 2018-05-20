/* Цвет недели */

// Разница в днях текущей даты с новым годом для года year
function delta(year) {
  var date = new Date();
  var newYear = new Date(year, 0, 1);
  return (Math.floor((date.getTime() - newYear.getTime()) / 1000 / 60 / 60 / 24));
}

// Корректно определяем номер недели в году
function getWeekNum(day, month, year) {
  // С чего начинать неделю, в США день 0 (Вс), в мире день 1 (Пн)
  var calStartDOW = 1;
  //Чтоб работало и для САЩ
  if (calStartDOW == 0) day++;
  // в JS месяцы нумеруются с нуля
  month++;
  var a = Math.floor((14 - month) / 12);
  var y = year + 4800 - a;
  var m = month + 12 * a - 3;
  var J = day + Math.floor((153 * m + 2) / 5) + 365 * y + Math.floor(y / 4) - Math.floor(y / 100) + Math.floor(y / 400) - 32045;
  d4 = (((J + 31741 - (J % 7)) % 146097) % 36524) % 1461;
  var L = Math.floor(d4 / 1460);
  var d1 = ((d4 - L) % 365) + L;
  var week = Math.floor(d1 / 7) + 1;
  // Лидирующий ноль для недель 1-9
  if (week < 10) week = '0' + week;
  return week;
}

// Найти номер недели начала учебного года для года Y
function numWeekSep(Y) {
  var date1 = new Date(Y, 9-1, 1);
  var wd1 = date1.getDay();
  var nw1 = getWeekNum(1, 9-1, Y);
  // Если 1 сент. - Сб или Вс, начнём со след. Пн
  if (wd1 == 0 || wd1 == 6) nw1++;
  return nw1;
}

// Выводим инфо о номере недели в году и семестре
function weekInfo() {
  var date = new Date();
  var Y = date.getFullYear();
  var M = date.getMonth();
  var D=date.getDate();
  var NW=getWeekNum(D, M, Y);
  // document.getElementById('info').innerHTML += 'Номер недели в году по стандарту ИСО: '+NW+'<br>'+"\n";
  // Определяем неделю начала учебного года и номер недели в осеннем семестре
  // осенний семестр - с 1 сентября, если оно не Сб или Вс, тогда со след. Пн
  if (M>8-1) {
    var nw1 = numWeekSep(Y);
    // номер недели семестра
    var num = NW - nw1 + 1;
    // Показываем не дольше 15 недель
    if (num > 0 && num < 16) {
      // document.getElementById('info').innerHTML += 'Номер недели в осеннем семестре: '+num;
      // определяется номером недели по ISO
      // четная
      if (NW % 2 == 0) return(1);
      // нечетная
      else return(2);
    }
  }
  // весенний семестр - NED недель спустя, но не раньше января и кончится не позже июля
  else if (M < 7 - 1) {
    var NED = 20;
    var nw1 = numWeekSep(Y - 1);
    // Ищем, когда прошло NED недель с начала учебного года (следующий Пн):
    // 28 дек. гарантированно относится к прошлому году
    var nw2 = getWeekNum(28, 12-1, Y-1);
    var w28 = nw2 - nw1 + 1;
    var date2 = new Date(Y-1, 12-1, 28);
    var wd28 = date2.getDay();
    var t28 = date2.getTime();
    // ищем Пн, наступивший NED недель спустся после начала осеннего семестра
    while (!(wd28 == 1 && w28 == NED)) {
      // прибавить сутки
      t28 += 1000 * 60 * 60 * 24;
      date2.setTime(t28);   
      wd28 = date2.getDay();
      if (wd28 == 1) w28++;
    }
    // Это будет начало весеннего семестра:
    var date3 = new Date();
    date3.setTime(t28);
    var y2 = date3.getFullYear();
    var m2 = date3.getMonth();
    var d2 = date3.getDate();
    var nw2 = getWeekNum(d2, m2, y2);
    // номер недели семестра
    var num = NW - nw2 + 1;
    // Показываем не дольше 20 недель
    if (num > 0 && num < 21) {
      // document.getElementById('info').innerHTML += 'Номер недели в весеннем семестре: '+num;
      // четная
      if (NW % 2 == 0) return(1);
      // нечетная
      else return(2);
    }
  }
}

function colorWeek() {
  var week = weekInfo();
  var h = document.getElementsByClassName("fc-center")[0].firstChild;
  if (week == 1) h.style.color = "red";
  else h.style.color = "blue"
}

/* Главная функция */

function main() {
  colorWeek();
}
