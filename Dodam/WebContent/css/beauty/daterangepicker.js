'use strict';
  
var _typeof = typeof Symbol === "function" && typeof Symbol.iterator === "symbol" ? function (obj) { return typeof obj; } : function (obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol ? "symbol" : typeof obj; };

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || !1; descriptor.configurable = !0; if ("value" in descriptor) descriptor.writable = !0; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

(function () {
    'use strict';

    var DatePicker = function () {
        function DatePicker(el, params) {
            _classCallCheck(this, DatePicker);

            this.params = $.extend({
                type: 'date',
                startDate: moment(),
                endDate: moment(),
                locale: 'ru',
                format: 'YYYY.MM.DD',
                delimiter: '-',
                ranges: [],
                modalMode: !1,
                minDate: null,
                maxDate: null,
                firstDayOfWeek: moment.localeData().firstDayOfWeek(),
                onShow: function onShow() {},
                onHide: function onHide() {}
            }, params);

            this.el = el;
            this.$el = $(document.createElement('div'));

            if (!this.params.modalMode) {
                this.el.after(this.$el);
            } else {
                $(document.body).append(this.$el);
            }

            moment.locale(this.params.locale);

            // datepicker range의 초기값을 무조건 오늘 날짜로 설정하기위함.
            
            this.viewStartDate = this.params.startDate;
 //           this.viewEndDate = this.params.startDate;
            this.viewEndDate = this.params.endDate;

            this.dateStart = this.params.startDate.clone();
//            this.dateEnd = this.params.startDate.clone();
           this.dateEnd = this.params.endDate.clone();

            this.render.call(this);

            this.initEvents();

            this.setValue();

            return this;
        }

        _createClass(DatePicker, [{
            key: 'setActiveDate',
            value: function setActiveDate(event) {
                var type = arguments.length <= 1 || arguments[1] === undefined ? 'start' : arguments[1];

                var el = event.currentTarget,
                    dayNum = parseInt(el.innerHTML, 10),
                    minDate = this.params.minDate,
                    maxDate = this.params.maxDate,
                    viewDate = type === 'start' ? this.viewStartDate : this.viewEndDate;

                if (String(dayNum).length === 1) dayNum = '0' + dayNum;

                var date = moment(viewDate.format('YYYY-MM') + '-' + dayNum);

                if (minDate !== null && (typeof minDate === 'undefined' ? 'undefined' : _typeof(minDate)) === 'object' && date.isBefore(minDate)) return;
                if (maxDate !== null && (typeof maxDate === 'undefined' ? 'undefined' : _typeof(maxDate)) === 'object' && date.isAfter(maxDate)) return;

                if (type === 'start') {
                    if (date.isAfter(this.dateEnd, 'day') && this.params.type === 'rangedate') {
                        this.dateEnd = date;
                    } else {
                        this.dateStart = date;
                    }
                } else {
                    if (date.isBefore(this.dateStart, 'day') && this.params.type === 'rangedate') {
                        this.dateStart = date;
                    } else {
                        this.dateEnd = date;
                    }
                }
                event.stopPropagation();
                this.render();
                this.setValue();
            }
        }, {
            key: 'setStartDate',
            value: function setStartDate(date) {
                this.viewStartDate = moment(date);
                this.dateStart = moment(date);
                this.render();
            }
        }, {
            key: 'setEndDate',
            value: function setEndDate(date) {
                this.viewEndDate = moment(date);
                this.dateEnd = moment(date);
                this.render();
            }
        }, {
            key: 'changeEventDate',
            value: function changeEventDate(event) {
                var calendar = arguments.length <= 1 || arguments[1] === undefined ? 'start' : arguments[1];
                var dateType = arguments.length <= 2 || arguments[2] === undefined ? 'day' : arguments[2];
                var action = arguments.length <= 3 || arguments[3] === undefined ? 'add' : arguments[3];

                var minDate = this.params.minDate,
                    maxDate = this.params.maxDate,
                    newDate = this.viewStartDate[action](1, dateType);

                if (minDate !== null && (typeof minDate === 'undefined' ? 'undefined' : _typeof(minDate)) === 'object' && moment(newDate).isBefore(minDate) || maxDate !== null && (typeof maxDate === 'undefined' ? 'undefined' : _typeof(maxDate)) === 'object' && moment(newDate).isAfter(maxDate)) {
                    this.viewStartDate = moment(newDate);
                    this.render();
                } else {
                    calendar === 'start' ? this.setStartDate(newDate) : this.setEndDate(newDate);
                }

                event.stopPropagation();
            }
        }, {
            key: 'setActiveRange',
            value: function setActiveRange(event) {
                var range = parseInt(event.currentTarget.getAttribute('data-range'), 10),
                    rangeParam = this.params.ranges[range];
                if (rangeParam) {
                    this.dateStart = rangeParam.startDate;
                    this.viewStartDate = rangeParam.startDate;
                    this.dateEnd = rangeParam.endDate;
                    this.viewEndDate = rangeParam.endDate;
                    this.render();
                }
            }
        }, {
            key: 'initEvents',
            value: function initEvents() {
                var _this = this;

                this.$el.on('click', '.dt__calendar_start .dt__calendar_m_d', function (event) {
                    return _this.setActiveDate(event, 'start');
                }).on('click', '.dt__calendar_end .dt__calendar_m_d', function (event) {
                    return _this.setActiveDate(event, 'end');
                }).on('click', '.dt__start .dt__calendar_head_month .next', function (event) {
                    return _this.changeEventDate(event, 'start', 'month', 'add');
                }).on('click', '.dt__start .dt__calendar_head_month .prev', function (event) {
                    return _this.changeEventDate(event, 'start', 'month', 'subtract');
                }).on('click', '.dt__end .dt__calendar_head_month .next', function (event) {
                    return _this.changeEventDate(event, 'end', 'month', 'add');
                }).on('click', '.dt__end .dt__calendar_head_month .prev', function (event) {
                    return _this.changeEventDate(event, 'end', 'month', 'subtract');
                }).on('click', '.dt__start .dt__calendar_head_year .next', function (event) {
                    return _this.changeEventDate(event, 'start', 'year', 'add');
                }).on('click', '.dt__start .dt__calendar_head_year .prev', function (event) {
                    return _this.changeEventDate(event, 'start', 'year', 'subtract');
                }).on('click', '.dt__end .dt__calendar_head_year .next', function (event) {
                    return _this.changeEventDate(event, 'end', 'year', 'add');
                }).on('click', '.dt__end .dt__calendar_head_year .prev', function (event) {
                    return _this.changeEventDate(event, 'end', 'year', 'subtract');
                }).on('click', '.dt__ranges_item', function (event) {
                    return _this.setActiveRange(event);
                }).on('click', '.dt-modal_close', function (event) {
                    return _this.hideCalendar();
                }).on('click', '.dt__wrapper', function (event) {
                    return !1;
                });

                this.el.on('click', function (event) {
                    return event.stopPropagation();
                }).on('focus', function (event) {
                    _this.showCalendar();
                    event.stopPropagation();
                });

                $(document).on('click', function (event) {
                    return _this.hideCalendar();
                });
                $(window).on('keydown', function (event) {
                    return _this.keyDown(event);
                });
            }
        }, {
            key: 'keyDown',
            value: function keyDown(event) {
                if (event.keyCode === 27) {
                    this.hideCalendar();
                }
            }
        }, {
            key: 'showCalendar',
            value: function showCalendar() {
                this.params.onShow();
                this.$el.addClass('show');
            }
        }, {
            key: 'hideCalendar',
            value: function hideCalendar() {
                this.params.onHide();
                this.$el.removeClass('show');
                
                
                
                

            }
        }, {
            key: 'renderMonth',
            value: function renderMonth(date) {
                var type = arguments.length <= 1 || arguments[1] === undefined ? 'start' : arguments[1];

                var html = '',
                    daysInMonth = date.daysInMonth(),
                    sameDate = type === 'start' ? this.dateStart : this.dateEnd,
                    minDate = this.params.minDate,
                    maxDate = this.params.maxDate,
                    dayClass = '';

                for (var i = 0; i < daysInMonth; i++) {
                    var dayNum = i + 1,
                        forDate = moment(date.format('YYYY-MM') + '-' + (dayNum < 10 ? '0' + dayNum : dayNum));

                    if (forDate.isSame(this.dateStart, 'day')) {
                        dayClass = 'active ';
                    } else if (forDate.isSame(this.dateEnd, 'day') && this.params.type === 'rangedate') {
                        dayClass = 'active ';
                    } else {
                        dayClass = '';
                    }

                    if (this.params.type === 'rangedate' && forDate.isAfter(this.dateStart, 'day') && forDate.isBefore(this.dateEnd, 'day')) {
                        dayClass += 'between ';
                    }

                    if ((typeof minDate === 'undefined' ? 'undefined' : _typeof(minDate)) === 'object' && forDate.isBefore(minDate)) dayClass += 'disabled';
                    if ((typeof maxDate === 'undefined' ? 'undefined' : _typeof(maxDate)) === 'object' && forDate.isAfter(maxDate)) dayClass += 'disabled';

                    html += '<div class="dt__calendar_m_d ' + dayClass + '">' + dayNum + '</div>';
                };

                return html;
            }
        }, {
            key: 'renderCalendar',
            value: function renderCalendar(date) {
                var type = arguments.length <= 1 || arguments[1] === undefined ? 'start' : arguments[1];

                var html = '',
                    navClass = type,
                    selectDate = type === 'start' ? this.dateStart : this.dateEnd,
                    weekShortDays = moment.weekdaysShort(),
                    firstDayOfWeek = date.clone().startOf('month').weekday();

                if (this.params.firstDayOfWeek != 0) {
                    var i = this.params.firstDayOfWeek;
                    while (i > 0) {
                        weekShortDays.push(weekShortDays.shift());
                        i--;
                    }
                }

                html += '<div class="dt__calendar dt__' + type + '">';
                html += '<div class="dt__calendar_head">';
                html += '<div class="dt__calendar_head_wday">' + selectDate.format('dddd') + '</div>';
                html += '<div class="dt__calendar_head_month"><i class="prev"><</i><span>' + selectDate.format('MMMM') + '</span><i class="next">></i></div>';
                html += '<div class="dt__calendar_head_day">' + selectDate.format('D') + '</div>';
                html += '<div class="dt__calendar_head_year"><i class="prev"><</i><span>' + selectDate.format('Y') + '</span><i class="next">></i></div>';
                html += '</div>';
                html += '<div class="dt__calendar_nav">';
                html += '<div class="dt__calendar_nav_title">' + date.format('MMM YYYY') + '</div>';
                html += '</div>';

                html += '<div class="dt__calendar_' + navClass + '"><div class="dt__calendar_m">';
                html += '<div class="dt__calendar_m_w">';

                for (var wi = 0; wi < weekShortDays.length; wi++) {
                    html += '<div class="dt__calendar_m_w_n">' + weekShortDays[wi] + '</div>';
                };
                html += '</div>';

                for (var fi = 0; fi < firstDayOfWeek; fi++) {
                    html += '<div class="dt__calendar_m_d_e"></div>';
                };

                html += this.renderMonth(date, type);

                html += '</div></div>';

                if (this.params.modalMode) html += '<div class="dt-modal_close">&#215;</div>';

                html += '</div>';

                return html;
            }
        }, {
            key: 'renderRanges',
            value: function renderRanges() {
                var html = '',
                    ranges = this.params.ranges;

                html += '<div class="dt__ranges">';
                for (var i = 0, l = ranges.length; i < l; i++) {
                    html += '<div class="dt__ranges_item" data-range="' + i + '"">' + ranges[i].label + '</div>';
                }
                html += '</div>';
                return html;
                
                

                
                
                
                
                
                
                
                
                
                
                
                
            }
        }, {
            key: 'render',
            value: function render() {
                var html = '';

                if (this.params.modalMode) html += '<div class="dt-modal_wrapper">';

                html += '<div class="dt__wrapper">';

                html += this.renderCalendar(this.viewStartDate, 'start');

                if (this.params.type === 'rangedate') {
                    html += this.renderCalendar(this.viewEndDate, 'end');

                    if (this.params.ranges.length) {
                        html += this.renderRanges();
                    }
                }

                if (this.params.modalMode) html += '</div>';

                html += '</div>';

                this.$el.html(html);

                this.onAfterRender();
            }
        }, {
            key: 'setValue',
            value: function setValue() {
                if (this.params.type === 'date') {
                    this.el.val(this.dateStart.format(this.params.format));
                } else {
                        this.el.val(this.dateStart.format(this.params.format) + this.params.delimiter + this.dateEnd.format(this.params.format));
                    }
                
                
                
                // 날짜를 클릭하여, datepicker가 꺼지면(hide) 그 날짜를 검색해 줘야한다. 이것도 ajax를 사용하자.
                $.ajax({
                	url : "/beauty/changeDate.dodam",
                	type : 'get',
                	data : {'from_to_date' : $('#rangedate').val()},
                	dataType : 'json',
                	success : function(data){
                		
                		// table tbody를 비우자~~
                		$('.beautyTbody').text('');	// div 클리어!
                		
                		// success 라면, data를 뿌린다.
        				var i;
        				var count=0;
        				for (i in data) {
        				    if (data.hasOwnProperty(i)) {
        				        count++;
        				    }
        				}
                		
        				for(var i=0; i<count; i++){

        					
      					$('.beautyTbody').append
        					(
        					'<tr onclick="javascript:showList('+"'"+data[i].CUS_TEL+"', '"+data[i].CUS_NAME+"', '"+data[i].ANIMAL_NAME+"', '"+data[i].ANIMAL_BREED+"', '"+data[i].ANIMAL_NUM+"', '"+data[i].CUS_ADDR+"'"+')">'+
        					'<td>'+data[i].BTY_DT+'</td>'+
        					'<td>'+data[i].ANIMAL_NAME+'</td>'+
        					'<td>'+data[i].ANIMAL_BREED+'</td>'+
        					'<td>'+data[i].CUS_NAME+'</td>'+
        					'<td>'+data[i].CUS_TEL+'</td>'+
        					'<td>'+data[i].BTM_TYPE+'</td>'+
        					'<td>'+data[i].BTY_OX+'</td>'+
        					'<td style="display:none">'+data[i].CUS_ADDR+'</td>'+
        					'<td style="display:none">'+data[i].ANIMAL_NUM+'</td>'
        					);
      					
      					
      					var result = new Array();
 
      					

      					
      					
      					
      					
        				}                		  		
                	},
            		error:function(request, status,error){
           			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            		}                	
                })  
                
                
                
                
                
                
                
                
                
            }
        }, {
            key: 'onAfterRender',
            value: function onAfterRender() {
                this.$el.addClass('dt');

                if (this.params.type == 'rangedate') {
                    this.$el.find('.dt__wrapper').addClass('rangedate');
                }

                if (this.params.modalMode) {
                    this.$el.addClass('dt-modal');
                }
                
                
                
            }
        }, {
            key: 'destroy',
            value: function destroy() {
                this.$el.detach().off().remove();
            }
        }]);

        return DatePicker;
    }();

    if (window.jQuery) {
        jQuery.fn.DatePicker = function (params) {
            return new DatePicker(this, params);
        };
    }

    if (typeof define === 'function') {
        define('datetimepicker', function () {
            return DatePicker;
        });
    }
})();