// SECURITY TOKEN
$(document).ajaxSend(function(event, request, settings) {
  if (typeof(AUTH_TOKEN) == "undefined") return;
  // settings.data is a serialized string like "foo=bar&baz=boink" (or null)
  settings.data = settings.data || "";
  settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
});

$(function(){

  // DRAGGABLE
  $('#unbound_tropes li').draggable({revert:true});

  // TROPE FLAGS
  $('#bound_tropes li').live('click',function(){
    var $this = $(this);
    $.ajax({
        url: '/flags/'+$this.attr('flag_id').split('_').pop(),
        type: 'post',
        dataType: 'script',
        data: { '_method': 'delete' },
        success: function() {
          $this.remove().appendTo('#unbound_tropes');
        }
    });
  });


  // TEXTILE PREVIEW
  $('textarea').each(function(){
    var self = $(this);
    var div = $('<div class="textile_preview"/>');
    var edit = $('<div class="edit content"/>');
    var preview = $('<div class="preview content"/>');

    div.append(edit);
    div.append(preview);
    div.append('<hr/>');

    self.after(div);
    self.remove().appendTo(edit);
    self.after('<a class="tip" href="http://textile.thresholdstate.com/">Format your content with Textile</a>');

    var togglePreview = $("<span class='action'>Toggle preview</span>");
    togglePreview.insertAfter(self).click(function(){
      $(this).parent().next('div.preview').toggle();
    });

    self.keyup(function(){
      preview.html($.textile(self.val()));
    });
    self.keyup();

  });

  // TOC HEADERS
  if (!$.browser.msie){
    $('div.comment_head')
    .prepend("<span class='ui-icon ui-icon-triangle-2-n-s'/>");
  }

  var h2_cpt=0;
  $('h2.toc').each(function(){
      h2_cpt++;
      $(this).prepend(""+h2_cpt+".&nbsp;");
      var h3_cpt=0;
      $('h3.toc',$(this).next('div.toc')).each(function(){
          h3_cpt++;
          $(this).prepend(""+h2_cpt+"."+h3_cpt+".&nbsp;");
          var h4_cpt=0;
          $('h4.toc',$(this).next('div.toc')).each(function(){
              h4_cpt++;
              $(this).prepend(""+h2_cpt+"."+h3_cpt+"."+h4_cpt+".&nbsp;");
          });
      });
  });

  if (!$.browser.msie){
	  $('h2,h3,h4,h5').filter('.toc').each(function(){
		var self = $(this);
		var span = $("<span class='ui-icon ui-icon-triangle-2-n-s'>&nbsp;</span>");
		self.prepend(span);
		span.click(function(){
		  self.next('div.toc').slideToggle('fast');
		});
	  });
  }

  $('div[id^=flash_]').fadeOut(5000);

});


// SORTING IN LISTS
$(function(){

  var items = $('ul.list li');
  $('span.action.sortby').click(function(){
    $('span.action.sortby span').remove();
    var self = $(this);
    var arrow = $("<span class='ui-icon'>&nbsp;</span>");
    self.prepend(arrow);
    var sortDir;
    if (self.hasClass('asc')){
      sortDir="desc";
      arrow.addClass('ui-icon-triangle-1-n');
      self.addClass('desc').removeClass('asc');
    }
    else {
      sortDir = "asc";
      arrow.addClass('ui-icon-triangle-1-s');
      self.addClass('asc').removeClass('desc');
    }
    var sortby = self.attr('alt');
    var extractFn = function(e){
      return $('span.'+sortby,e).text();
    };
    items.selso({
      extract:extractFn,
      type:'alpha',
      direction:sortDir
    });
  });

  $('span.action.sortby[alt=title]').click();

});


