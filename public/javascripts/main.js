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
	jQuery('.showOnRecipientEmail').showiff(jQuery('#message_recipient_email_address_checkbox').checked());
}

/**
* Hides or shows the receipt notification
*/
function hideShowReceiptNotification() {
	jQuery('.receiptNotificationEmail').showiff(jQuery('#message_receipt_notification').checked());
}

/**
* Show the popup ad when the forum is submitted
*/
function addPopupAdHandler(url) {
	if (jQuery("FORM #popupadcheckbox").exists()) {
		jQuery("FORM#new_message")[0].onsubmit = function() {
			if (jQuery("FORM #popupadcheckbox").checked()) {
				window.open(url, 'popupAd', 'height=500,width=800,scrollbars,resizable');
				
				return true;
			}
		}
	}
}

/**
* Functionality that should occur when the page loads
*/
jQuery(document).ready( function() {

	// Supports the text area resizing capabilities.
	jQuery('textarea.resizable:not(.processed)').TextAreaResizer();
});


