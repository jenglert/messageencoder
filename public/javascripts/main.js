jQuery.fn.extend({
    
    // Returns true if there are any elements in the jQuery wrapped set. Otherwise returns false.
    exists: function() {
        return jQuery(this).size() >= 1;
    },

	// Conditionally shows the an element only if necessary
	showiff: function(show) {
		if (show) {
			this.fadeIn("slow");
		}
		else {
			this.hide();
		}
	},
	
	checked: function() {
		return jQuery(this).is(":checked");
	}

});

/*
* Function used hide or show the instructions related to the difficulty
*/
function hideShowDifficultyInstructions() {
	// Easy 
	jQuery('.easyDifficulty').showiff(jQuery('#message_difficulty').val() == 1);
	jQuery('.multipleChoiceAnswers').showiff(jQuery('#message_difficulty').val() == 1);
	jQuery('#correctAnswerBlock').showiff(jQuery('#message_difficulty').val() == 1);
	
	// Medium
	jQuery('.mediumDifficulty').showiff(jQuery('#message_difficulty').val() == 2);
	jQuery('.hintsSection').showiff(jQuery('#message_difficulty').val() == 2);	

	
	// Hard
	jQuery('.hardDifficulty').showiff(jQuery('#message_difficulty').val() == 3);
	
	// No Selection
	jQuery('.noneDifficulty').showiff(jQuery('#message_difficulty').val() < 1);
}

/**
*  Function that will show another answer in the question box.
*/
function showAnotherAnswer() {
	jQuery('.multipleChoiceAnswers').children().filter(':hidden').filter('.answer').filter(":first").fadeIn("slow");
	
	if (!jQuery('.multipleChoiceAnswers').children().filter(':hidden').filter('.answer').filter(":first").exists()) {
		jQuery('.showAnotherAnswer').hide();
	}
}

/*
*
*/
function showAnotherHint() {
	jQuery('.hintsSection').children().filter(':hidden').filter('.hint').filter(":first").fadeIn("slow");

	if (!jQuery('.hintsSection').children().filter(':hidden').filter('.hint').filter(":first").exists()) {

		jQuery('.showAnotherHint').hide();
	}
}

/**
* Function that will hide or show the recipient's email addresses
*/
function hideShowRecipientEmail() {
	jQuery('.recipientEmail').showiff(jQuery('#message_recipient_email_address_checkbox').checked());
}

/**
* Functionality that should occur when the page loads
*/
jQuery(document).ready( function() {

	// Supports the text area resizing capabilities.
	jQuery('textarea.resizable:not(.processed)').TextAreaResizer();
});

/*
* Javascript/flash copy to clipboard functionality
*/
function copy_to_clipboard(text)  
  {  
      if(window.clipboardData)  
      {  
      window.clipboardData.setData('text',text);  
      }  
      else  
      {  
          var clipboarddiv=document.getElementById('divclipboardswf');  
      if(clipboarddiv==null)  
      {  
         clipboarddiv=document.createElement('div');  
             clipboarddiv.setAttribute("name", "divclipboardswf");  
         clipboarddiv.setAttribute("id", "divclipboardswf");  
         document.body.appendChild(clipboarddiv);  
      }  
          clipboarddiv.innerHTML='<embed src="/clipboard.swf" FlashVars="clipboard='+  
  encodeURIComponent(text)+'" width="0" height="0" type="application/x-shockwave-flash"></embed>';  
      }  
      alert('The text is copied to your clipboard...');  
      return false;  
  }

