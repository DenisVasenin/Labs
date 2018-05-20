$(document).ready(function() {
  var initialLocaleCode = 'ru';
  var date = new Date();
  var values = [ date.getMonth() + 1, date.getDate() ];
  for( var id in values ) {
    values[ id ] = values[ id ].toString().replace( /^([0-9])$/, '0$1' );
  }
  date = date.getFullYear() + '-' + values[ 0 ] + '-' + values[ 1 ];
  $('#calendar').fullCalendar
  ({
    header: {
    left: 'prev,next today',
    center: 'title',
    right: 'day,week,month'
  },

  // customize the button names,
  // otherwise they'd all just say "list"
  views:
  {
    listDay: { buttonText: 'list day' },
    listWeek: { buttonText: 'list week' }
  },
  defaultView: 'listWeek',
  defaultDate: date,
  locale: initialLocaleCode,
  navLinks: true, // can click day/week names to navigate views
  editable: true,
  eventLimit: true, // allow "more" link when too many events
  events: [
    {
      title: 'All Day Event',
      start: '2017-02-01'
    },
    {
      title: 'Long Event',
      start: '2017-02-07',
      end: '2017-02-10'
    },
    {
      id: 999,
      title: 'Repeating Event',
      start: '2017-02-09T16:00:00'
    },
    {
      id: 999,
      title: 'Repeating Event',
      start: '2017-02-16T16:00:00'
    },
    {
      title: 'Conference',
      start: '2017-02-11',
      end: '2017-02-13'
    },
    {
      title: 'Meeting',
      start: '2017-02-12T10:30:00',
      end: '2017-02-12T12:30:00'
    },
    {
      title: 'Lunch',
      start: '2017-02-12T12:00:00'
    },
    {
      title: 'Meeting',
      start: '2017-02-12T14:30:00'
    },
    {
      title: 'Happy Hour',
      start: '2017-02-12T17:30:00'
    },
    {
      title: 'Dinner',
      start: '2017-02-12T20:00:00'
    },
    {
      title: 'Birthday Party',
      start: '2017-02-13T07:00:00'
    },
    {
      title: 'Click for Google',
      url: 'http://google.com/',
      start: '2017-02-28'
    }
  ]});
});
