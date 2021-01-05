$(function(){
	var $section = $('.parallax > div'),
		$sectionInfo = [];
		
	$section.each(function(){
			var $this = $(this);
			$sectionInfo.push($this.offset().top);
	});
		
	$section.css({position: 'fixed'});
	
	$(window).scroll(function(){
		var sct = $(this).scrollTop();
		
		$section.each(function(idx){
			var $this = $(this);
			var $newtop = $sectionInfo[idx] - sct;
			$this.css({top:$newtop});
		});
		
	}); //window scroll event
		
		
});