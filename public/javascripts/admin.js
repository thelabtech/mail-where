jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});

var _childWindow = null;

jQuery.popup = function(url) {
	if (_childWindow && !_childWindow.closed && _childWindow.location) {
		_childWindow.location.href = url;
	}
	else {
		_childWindow=window.open(url,'name','height=600,width=1000,scrollbars=yes,resizable=yes');
		if (!_childWindow.opener) _childWindow.opener = self;
	}
	if (window.focus) {_childWindow.focus()}
	return false;
};

jQuery(function($) {
  $('#upload_list a.popup').live('click', function(event) {
    var href = $(this).attr('href');
    $.popup(href);
    return false;
  });
  $(document.body).bind('reload.uploads', function(event) {
    var div = $('#upload_list');
     
    var url = '/pilotport/uploads';
    
    div.fadeTo('fast', 0.5);
     
    var data = {
      'authenticity_token': window._token,
    };
    data[$('form').attr('data-model-class') + '_id'] = $('form').attr('data-model-id');
     
    $('#upload_list').load(url, jQuery.param(data), function(data, textStatus) {
      div.html(data);
      div.fadeTo('fast', 1.0);
    });
     
    return false;
  });
});

jQuery(function($) {

  $.fn.conditionalDisplay = function(callback) {
    $(this).each(function(index) {
      $(this).change(callback).change();
    });
  };

  $.fn.topTags = function() {
    this.each(function(index, element) {
      
      var input = $(this).find('input');
      
      var addTag = function(tag){
        var value = input.val();
        if (value.indexOf(tag) == -1) {
          if (value.length > 0) {
            value += ', ';
          }
          value += tag;
          input.val(value);
        }
      };
      
      $('a.top_tag', this).click(function(event) {
        addTag($(this).text());
        return false;
      });
      
    });
  };

  $('form.formtastic li.top_tags').topTags();

  var styles = {
    'font-family': 'Helvetica, Arial, san-serif',
    'font-size': '12px',
    'line-height': '1.4em',
  };




  $('.multiple_selects_holder').click(function(event) {

    if ($(event.target).is('a.add')) {
      
      var select = $(this).next('.multiple_selects_template')[0].innerHTML;
      var new_menu = "<p>" + select + "</p>";
      
      $(event.target).closest('p.add_new').before(new_menu);
      $('select', this).enable();
      
      return false;
    } else if ($(event.target).is('a.remove')) {
      $(event.target).closest('p').remove();
      return false;
    }
  });

  $('a.delete_attachment').click(function(event) {
    var p, attachment, href;

    p = $(this).closest('p.inline-hints');
    attachment = $(this).attr('data-type');
    href = $(this).attr('href');
    // span.setOpacity(.5);
    p.text('deleting...');

    $.post(href, { 'authenticity_token': window._token,
                   'attachment': attachment },
                function(data, textStatus) {
                  p.innerHTML = '';
                });
    return false;
  });
  
  $('table.track tr').prepend('<td class="sort_handle"></td>');
  $('table.track').tableDnD({onDragClass: 'dragging', onDrop: function(table, row) {
    
    function ordinal(element) {
      return $(element).prevAll().length + 1;
    }
    
    var releaseID = $('.release').attr('data-param');
    var param = $(row).attr('data-param');
    var url = '/pilotport/releases/' + releaseID + '/tracks/' + param + '/order';
    
    $(table).fadeTo('fast', .5);
    $(table).after('<p class="saving">Saving...</p>');
    $.post(url, {ordinal: ordinal(row), authenticity_token: window._token}, function(data, textStatus) {
      $(table).fadeTo('fast', 1);
      $(table).next('p.saving').remove();
    });
    
    // post result
    Cycle.reset('rows');
    $('tbody tr', table).each(function(index, tableRow) {
      $(tableRow).removeClass('odd').removeClass('even').addClass(Cycle.thru('odd', 'even', {name:'rows'}));
      $('td.ordinal', tableRow).html(ordinal(tableRow));
    });
  }});
  
  $('form.basic input[type=text]:first').focus();

});

jQuery(function($) {
  
  var syncState = function(country) {
    var show = country == 'US';
    $('li#venue_state_input').toggle(show);
    $('li#venue_state_input select')[0].enabled = show;
  }
  
  $('select#venue_country').change(function(event) {
    var country = $(this).val();
    syncState(country);
  });
  
  $("input#venue_name").autocomplete('/pilotport/venues/autocomplete', {
    parse: function(data) { return data; },
    formatItem: function(row) { return row; },
    highlight: function(value, term) { return value; }
  }).result(function(event, value, li) {
    $('input#venue_url').val($('.payload .url', li).text());
    $('input#venue_city').val($('.payload .city', li).text());
    var country = $('.payload .country', li).text();
    $('select#venue_country').val(country);
    syncState(country);
    $('#venue_state').val($('.payload .state', li).text());
  });
});