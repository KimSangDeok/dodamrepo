jQuery.fn.calendarPicker = function(options) {
  // --------------------------  start default option values --------------------------
  if (!options.date) {
    options.date = new Date();
  }

  if (typeof(options.years) == "undefined")
    options.years=1;

  if (typeof(options.months) == "undefined")
    options.months=3;

  if (typeof(options.days) == "undefined")
    options.days=4;

  if (typeof(options.showDayArrows) == "undefined")
    options.showDayArrows=true;

  if (typeof(options.useWheel) == "undefined")
    options.useWheel=true;

  if (typeof(options.callbackDelay) == "undefined")
    options.callbackDelay=500;
  
  if (typeof(options.monthNames) == "undefined")
    options.monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

  if (typeof(options.dayNames) == "undefined")
    options.dayNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];


  // --------------------------  end default option values --------------------------

  var calendar = {currentDate: options.date};
  calendar.options = options;

  //build the calendar on the first element in the set of matched elements.
  var theDiv = this.eq(0);//$(this);
  theDiv.addClass("calBox");

  //empty the div
  theDiv.empty();


  var divYears = $("<div>").addClass("calYear");
  var divMonths;
  var divDays;


  theDiv.append(divYears);

  calendar.changeDate = function(date) {
	  
	  
	  
    calendar.currentDate = date;

    var fillYears = function(date) {
      var year = date.getFullYear();
      

      // mpayView3.jsp 의 달력을 클릭했을 때!!!!! 가져와라~~
      
      $.ajax({
      	url : "/mpay/mpayView3Change.dodam",
      	type : 'get',
      	data : {'selectYY' : year},
      	dataType: 'json',
      	success : function(data){
      		console.log(data);
      	
      		// 진료, 입원및호텔, 미용의 건수를 담을 변수(array) 선언.
      		var jinryo_many = new Array();
      		var stay_many = new Array();
      		var beauty_many = new Array();
      		
      		
      		for(var i=0; i<12; i++){
      			jinryo_many.push(data[i].TOTAL);
      		}
      		for(var i=12; i<24; i++){
      			stay_many.push(data[i].TOTAL);
      		}
      		for(var i=24; i<36; i++){
      			beauty_many.push(data[i].TOTAL);
      		}
      		
      		console.log("result");
      		console.log(jinryo_many);
      		console.log(stay_many);
      		console.log(beauty_many);
      		
      		
  			Highcharts.chart('container', {
  			    chart: {
  			        type: 'column'
  			    },
  			    title: {
  			        text: '시간 및 매출별 건수'
  			    },
  			    xAxis: {
  			        categories: ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC']
  			    },
  			    yAxis: {
  			        min: 0,
  			        title: {
  			            text: 'Total fruit consumption'
  			        },
  			        stackLabels: {
  			            enabled: true,
  			            style: {
  			                fontWeight: 'bold',
  			                color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
  			            }
  			        }
  			    },
  			    legend: {
  			        align: 'right',
  			        x: -30,
  			        verticalAlign: 'top',
  			        y: 25,
  			        floating: true,
  			        backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
  			        borderColor: '#CCC',
  			        borderWidth: 1,
  			        shadow: false
  			    },
  			    tooltip: {
  			        headerFormat: '<b>{point.x}</b><br/>',
  			        pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
  			    },
  			    plotOptions: {
  			        column: {
  			            stacking: 'normal',
  			            dataLabels: {
  			                enabled: true,
  			                color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
  			            }
  			        }
  			    },
  			    series: [{
  			        name: '진료',
  			        data: jinryo_many
  			    }, {
  			        name: '입원 및 호텔',
  			        data: stay_many
  			    }, {
  			        name: '미용',
  			        data: beauty_many
  			    }]
  			});
      		
      	}
      	
      })      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      var t = new Date();
      divYears.empty();
      var nc = options.years*2+1;
      var w = parseInt((theDiv.width()-4-(nc)*4)/nc)+"px";
      for (var i = year - options.years; i <= year + options.years; i++) {
        var d = new Date(date);
        d.setFullYear(i);
        var span = $("<span>").addClass("calElement").attr("millis", d.getTime()).html(i).css("width",w);
        if (d.getYear() == t.getYear())
          span.addClass("today");
        if (d.getYear() == calendar.currentDate.getYear())
          span.addClass("selected");
        divYears.append(span);
      }
    }

    var fillMonths = function(date) {
      var month = date.getMonth();
      var t = new Date();
      //divMonths.empty();
      var oldday = date.getDay();
      var nc = options.months*2+1;
      var w = parseInt((theDiv.width()-4-(nc)*4)/nc)+"px";
      for (var i = -options.months; i <= options.months; i++) {
        var d = new Date(date);
        var oldday = d.getDate();
        d.setMonth(month + i);

        if (d.getDate() != oldday) {
          d.setMonth(d.getMonth() - 1);
          d.setDate(28);
        }
        var span = $("<span>").addClass("calElement").attr("millis", d.getTime()).html(options.monthNames[d.getMonth()]).css("width",w);
        if (d.getYear() == t.getYear() && d.getMonth() == t.getMonth())
          span.addClass("today");
        if (d.getYear() == calendar.currentDate.getYear() && d.getMonth() == calendar.currentDate.getMonth())
          span.addClass("selected");
        //divMonths.append(span);

      }
    }

    var fillDays = function(date) {
      var day = date.getDate();
      var t = new Date();
     // divDays.empty();
      var nc = options.days*2+1;
      var w = parseInt((theDiv.width()-4-(options.showDayArrows?12:0)-(nc)*4)/(nc-(options.showDayArrows?2:0)))+"px";
      for (var i = -options.days; i <= options.days; i++) {
        var d = new Date(date);
        d.setDate(day + i)
        var span = $("<span>").addClass("calElement").attr("millis", d.getTime())
        if (i == -options.days && options.showDayArrows) {
          span.addClass("prev");
        } else if (i == options.days && options.showDayArrows) {
          span.addClass("next");
        } else {
          span.html("<span class=dayNumber>" + d.getDate() + "</span><br>" + options.dayNames[d.getDay()]).css("width",w);
          if (d.getYear() == t.getYear() && d.getMonth() == t.getMonth() && d.getDate() == t.getDate())
            span.addClass("today");
          if (d.getYear() == calendar.currentDate.getYear() && d.getMonth() == calendar.currentDate.getMonth() && d.getDate() == calendar.currentDate.getDate())
            span.addClass("selected");
        }
       // divDays.append(span);

      }
    }

    var deferredCallBack = function() {
      if (typeof(options.callback) == "function") {
        if (calendar.timer)
          clearTimeout(calendar.timer);

        calendar.timer = setTimeout(function() {
          options.callback(calendar);
        }, options.callbackDelay);
      }
    }


    fillYears(date);
    fillMonths(date);
    fillDays(date);

    deferredCallBack();

  }

  theDiv.click(function(ev) {
    var el = $(ev.target).closest(".calElement");
    if (el.hasClass("calElement")) {
      calendar.changeDate(new Date(parseInt(el.attr("millis"))));
    }
  });





  calendar.changeDate(options.date);

  return calendar;
};