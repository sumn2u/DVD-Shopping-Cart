
	$(function(){
	
	init_logoHover();
	
	init_panels();
	
	init_accordion();
	
	init_tables();
	
	init_calendar();
	
	init_wysiwyg();
	
	init_forms();
	
	init_notices();
	
	init_gallery();
	
	});
	
	
	
	function init_logoHover(){
		$(".logo").hover(function(){
			$(this).animate({opacity:0.8},'fast');
		},function(){
			$(this).animate({opacity:1},'fast');
		});
	}
	
	function init_panels() {
		
		$('.tabs-content').each(function(){
			var tabs = $(this).closest('.panel').find('.tabs');
						
			if ($('li:eq(0)', tabs).hasClass('active')){
				$(this).closest('.panel').find('.tabs-content').addClass('first-tab');
			}
		});
		
		
					
		$('.panel .tabs li').click(function(){
			var parent = $(this).closest('.panel');
			var content = $('a', this).attr('rel');
			
			if ($(this).index()==0){
				$(this).closest('.panel').find('.tabs-content').addClass('first-tab');
			}else{
				$(this).closest('.panel').find('.tabs-content').removeClass('first-tab');
			}
			
			$('.tabs .active', parent).removeClass('active');
			$(this).addClass('active');
			
			$('.tabs-content > .active', parent).slideUp('fast', function(){
				$(this).removeClass('active');
				
				$('#'+content).slideDown('fast', function(){
					$(this).addClass('active');
				});
			});
			
			return false;
		});
		
	}
	
	
	/***** Feature - accordion *************************************************/	
		function init_accordion() { 
			
			$('.accordion li>h4').click(function(){
				var parent = $(this).closest('li');
				var widget = $(this).closest('.accordion');
				var expanded = true;
				
				if ($('div:hidden', parent).size()) {
					expanded = false;
				} 
				
				if (expanded == false){
				
					 $('li.current>div',widget).slideUp(150,function(){
						$('li.current',widget).removeClass('current');
						

					}); 
					 
					$('div:hidden', parent).slideDown(350, function(){
						$(parent).addClass('current');
					}); 
					 
				}else{
					$('div:hidden', parent).slideUp();
				}
			
			});
		}
		
		
	function init_tables() {

		if ($('table.sortable').size()){
			$("table.sortable").tablesorter(); 
		}
		
	}
	
	
	function init_calendar(){
	
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear(); 
	
		if ($('#sample-calendar').size() == 0){
			return false;
		}
	
		 $('#sample-calendar').fullCalendar({ 
			header: {
						left: 'prev',
						center: 'title',
						right: 'next'
					},
			editable: true,
			events: [
				{
					title: 'All Day Event',
					start: new Date(y, m, 1)
				},
				{
					title: 'Long Event',
					start: new Date(y, m, d-5),
					end: new Date(y, m, d-2)
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d-3, 16, 0),
					allDay: false
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d+4, 16, 0),
					allDay: false
				},
				{
					title: 'Meeting',
					start: new Date(y, m, d, 10, 30),
					allDay: false
				},
				{
					title: 'Lunch',
					start: new Date(y, m, d, 12, 0),
					end: new Date(y, m, d, 14, 0),
					allDay: false
				},
				{
					title: 'Birthday Party',
					start: new Date(y, m, d+1, 19, 0),
					end: new Date(y, m, d+1, 22, 30),
					allDay: false
				},
				{
					title: 'Click for Google',
					start: new Date(y, m, 28),
					end: new Date(y, m, 29),
					url: 'http://google.com/'
				}
			]

		 });
		 
	}
	
	function init_wysiwyg() {
		
		$('textarea.wysiwyg-editor').each(function(){
			
			var editor_id = $(this).attr('id');
			new nicEditor({iconsPath : '_layout/scripts/nicEdit/nicEditorIcons.gif'}).panelInstance(editor_id); 
			
		});
		
	}
	
	function init_forms(){ 
	
		if($("select, input:checkbox, input:radio, input:file").size()){
			$("select, input:checkbox, input:radio, input:file").uniform();
		}
		
		$("form .submit").click(function(){
			$(this).closest('form').submit(); 
		});
	}
	
	function init_notices(){

		$('.notice-one , .notice-two , .notice-three , .notice-four').click(function(){
			$(this).slideUp('fast');
		})
		
	}
	
	
	function init_gallery(){
	
		if (typeof(jQuery.colorbox ) == 'undefined'){
			return false;
		}
	
		$(".gallery div a").colorbox();
	}
