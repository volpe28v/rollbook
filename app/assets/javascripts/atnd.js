//jQuery
(function($) {
	$(function() {

		var url = document.location;

		//layout --------------------------------------------
		if ( $('header').height() > 60 ) {
			var height = $('header').height();
			$('header').children().height(height);
		}

		$('#sessions-others li input[type="text"]').addClass('input-text');
		$('#comments-content .comments-entry:first').css('border-top','1px dotted #757575');
		$('#events-members ol li:nth-child(10n)').addClass('count10');

		$('.messages-to ul:last').css('margin-bottom','0px');
		$('.messages-to ul li:nth-child(5n)').after('<br clear="all">');

		$('#entry-new input[type="text"]').addClass('input-text');
		$('#entry-new textarea').addClass('input-textarea');

		$('#messages-box ul.ul-to li:nth-child(4n)').after('<br clear="all">');

		if ( !jQuery.support.leadingWhitespace ) {
			$('.a-btn').css('padding-top','8px');
		}


		//#index --------------------------------------------
		$('#index').prev().css('padding-bottom','40px');
		$('#index .populars div:even').addClass('left');
		$('#index .populars div:odd').addClass('right').after('<br clear="all">');

		//#index hover
		$('#index .populars div').hover( function() {
			$(this).stop(true, false).animate({ opacity: .5 }, { duration: 200});
			if ( !jQuery.support.leadingWhitespace ) { this.style.removeAttribute('filter'); }
		}, function() {
			$(this).stop(true, false).animate({ opacity: 1 }, { duration: 200});
			if ( !jQuery.support.leadingWhitespace ) { this.style.removeAttribute('filter'); }
		}).each(function() {
			var height = $(this).find('dl').height();
			//alert(height);
			$(this).append('<div style="height:' + height + 'px;"></div>');
		});

		//common - tab init --------------------------------------------
		var hash = $('<div>').text(window.location.hash).html(); //escape
		var hash_content = $(hash + '-content');
		if (hash_content.length != 0) {
			$(hash_content).show();
			$('a[href="'+hash+'"]').addClass('selected').parent().siblings().children('a').removeClass('selected');
		} else {
			$('.ui-tabs').each(function() {
				$(this).children('.ui-tabs-body:first').show();
			});
		}

		//common - tab --------------------------------------------
		$('.ui-tabs').each(function() {
			var a = $(this).children('nav').children('.ui-tabs-nav').children('li').find('a');
			var contents = $(this).children('.ui-tabs-body');
			a.filter('.selected').find('.symbol').html('▼');
			a.click(function() {
			  if(window.location.search != ""){
		    	window.location.hash = $(this).attr('href');
			    var loc = window.location.toString(); // こちらはOK
			    window.location = loc.replace(window.location.search,"");
			    return false;
			  }
			  a.removeClass('selected').find('.symbol').html('▶');
			  $(this).addClass('selected').find('.symbol').html('▼');
			  contents.hide();
			  $($(this).attr('href') + "-content").show();
				$('.full').each(function() {
					full_height($(this).parent().attr('id'));
				});
			  window.location.hash = $(this).attr('href');
			  return false;
			});
		});

		$('.ui-tabs-nav li a').equalHeight();

/*		var tabs_nav_max = 0;
		$('.ui-tabs-nav li').each(function() {
			tabs_nav_max = Math.max(tabs_nav_max, $(this).outerHeight());
		}).height(tabs_nav_max);
*/

		$('.ui-tabs-body a[href^="#"]').each(function() {
			$(this).click(function() {
				var a = $(this).attr('href');
				$('.ui-tabs-nav a.selected').removeClass('selected').find('.symbol').html('▶');
				$('.ui-tabs-nav a[href=' + a + ']').addClass('selected').find('.symbol').html('▼');
				$('.ui-tabs-body').hide();
				$(a + '-content').show();
				window.location.hash = $(this).attr('href');
				return false;
			});
		});

		//common - toggle --------------------------------------------
		$('.ui-toggle').click(function() {
			$(this).siblings('.ui-toggle-body').toggle("fast",function() {
				if ( $(this).is(':hidden')) {
					$(this).prevAll().find('.symbol').html('▶');
				} else {
					$(this).prevAll().find('.symbol').html('▼');
				}
			});
			return false;
		}).siblings('.ui-toggle-body').hide();

		//common - hover & click --------------------------------------------
		$('.click').hover(function() {
			$(this).addClass('click-hover');
		}, function() {
			$(this).removeClass('click-hover');
		}).click(function() {
			window.location = $(this).find('a').not('[rel="nofollow"]').attr('href');
		});

		$('a img').hover(function() {
			$(this).stop(true, false).animate({ opacity: .5 }, { duration: 200});
		}, function() {
			$(this).stop(true, false).animate({ opacity: 1 }, { duration: 200});
		});


		//.list-toggle：/messages/inbox & /messages/outbox & /users/list --------------------------------------------
		$('.list-toggle a:not([rel="nofollow"])').click( function() {
			var target = $(this).attr('target');
			var href = $(this).attr('href');
			if (target == "_blank") {
				window.open(href,null);
			} else {
				window.location = href;
			}
			return false;
		});

/*
		$('.list-toggle .full').each(function() {
			var text = $(this).html();
			if ( text.length > 40 ) {
				text =  text.substring(0,39) + '…';
			}

			$(this).before('<p class="exp">' + text + '</p>');
			$(this).hide();
		});*/

/*		function list_open (exp,full,btn) {
			if (full.is(':hidden')) {
				exp.slideToggle('fast', function() { full.slideToggle('fast'); });
				btn.find('.symbol').html('▲');
				btn.find('strong').html('CLOSE');
				//icon.hide();
			} else {
				exp.slideToggle('fast', function() { full.slideToggle('fast'); });
				btn.find('.symbol').html('▶');
				btn.find('strong').html('OPEN');
			}
		}*/

		/*$('.list-toggle tr').hover( function() {
			$(this).addClass('click-hover');
		}, function() {
			$(this).removeClass('click-hover');
		}).click( function() {
			var exp = $(this).find('.exp');
			var full = $(this).find('.full');
			var btn = $(this).find('.open');
			var message_id = $(this).find('#message_id').val();
			var event_id = $(this).find('#event_id').val();
			list_open(exp,full,btn);
			if(message_id && event_id){
			  list_open_request(event_id, message_id, full);
			}
			return false;
		});*/


		$('.list-toggle .full .message-body').each(function() {
			$(this).hide();
			$('.full').each(function() { full_height($(this).parent().attr('id')); });
		});


		function list_open (message_body, btn, message_id, event_id) {
			btn.hide();
			if (message_body.is(':hidden')) {
				btn.find('.symbol').html('▲');
				btn.find('strong').html('CLOSE');
				if(message_id != undefined && event_id != undefined){
					list_open_request(event_id, message_id);
				}
			} else {
				btn.find('.symbol').html('▶');
				btn.find('strong').html('OPEN');
			}
			message_body.slideToggle('fast',function() {
				full_height('id-' + message_id);
				btn.fadeIn(500,function() {
					if ( !jQuery.support.leadingWhitespace ) { this.style.removeAttribute('filter'); }
				});
			});
		}

		function list_open_request(event_id, message_id){
		  var post_url = "http://" + location.host + "/events/" + event_id + "/messages/" + message_id + "/open";
			$.ajax({
				dataType: "text",
				data: {
					"authenticity_token": $("#authenticity_token").val()
				},
				type: "POST",
				url: post_url,
				success: function(data){
					$('#id-' + message_id).addClass('read').find('.icon-unread').fadeTo(500,0);
				}
			});
		}

		$('.list-toggle tr').hover( function() {
			$(this).addClass('click-hover');
		}, function() {
			$(this).removeClass('click-hover');
		}).click( function() {
			$(this).find('.entry').css('height','auto');
			var message_body = $(this).find('.message-body');
			var btn = $(this).find('.open');
			var message_id = $(this).attr('id').replace('id-','');
//			var message_id = $(this).find('#message_id').val();
			var event_id = $(this).find('#event_id').val();
			list_open(message_body,btn,  message_id, event_id);
			return false;
		});

		function full_height(id) {
			var th = $('#' + id).children('th').children('dl');
			var td= $('#' + id).children('td').children('.entry');
			//alert(th.height() + "：" + td.height());
			 if (th.innerHeight() > td.innerHeight() ) { td.innerHeight(th.innerHeight()); }
		}

		//messages member--------------------------------------------
		$('.member-uncheck').click(function() {
			$(this).parent().parent().next().children().find('input').attr('checked', false);
			return false;
		});

		$('.member-check').click(function() {
		  $(this).parent().parent().next().children().find('input').not('input:disabled').attr('checked', true);
		  return false;
		});

		$('li.nolink').find('label').click(function(){
			//return false;
		});



		$.ajax({
			type: 'GET',
			url : 'http://api.b.st-hatena.com/entry.count',
			data: 'url=' + url + '&callback=MyCallbackFunction',
			dataType : "jsonp",
			success : function( results ) {
				$('#info-hatena').html('<strong>' + results + '</strong>users').attr('href', 'http://b.hatena.ne.jp/entry/' + url);
			}
		});


		// alert --------------------------------------------
		var $alert = $('#header_message');
		if ($alert.length) {
			var alerttimer = window.setTimeout(function () {
				$alert.trigger('click');
			}, 3000);

			$alert.animate({height: $alert.css('line-height') || '50px'}, 600)
			.click(function () {
					window.clearTimeout(alerttimer);
					//$alert.animate({height: '0'}, 600);
					$alert.fadeOut(700);
					//$alert.animate({ top:"+=15px",opacity:0 }, "slow");
			});
		}

		$('#close_message').click(function(){
			$('#header_message').animate({ top:"+=15px",opacity:0 },
				"fast",
				function () {
					$('#header_message').remove();
			});
		});

		$('#header_message').click(function(){
			$('#header_message').animate(
				{ top:"+=15px",opacity:0 },
				"fast",
				function () {
			$('#header_message').remove();
			});
		});
	});

	// function equal Height --------------------------------------------
	$.fn.equalHeight = function(){
		var height = 0;
		return this.each(function(){
			height = Math.max(height, $(this).height());
	}).height(height);

}


})(jQuery);

//for IE6 hover
try {
document.execCommand('BackgroundImageCache', false, true);
} catch(e) {}
