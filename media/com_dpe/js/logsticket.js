var logticket = {

	originalSaveFormData: null,
	originalCreate: null,
	restoreOriginals: function()
	{
		if (typeof com_tjucm !== 'undefined' && com_tjucm.Services && com_tjucm.Services.Item)
		{
			if (logticket.originalSaveFormData)
			{
				com_tjucm.Services.Item.saveFormData = logticket.originalSaveFormData;
				logticket.originalSaveFormData = null;
			}
			if (logticket.originalCreate)
			{
				com_tjucm.Services.Item.create = logticket.originalCreate;
				logticket.originalCreate = null;
			}
		}
	},

	afterSaveLinkFieldUpdate: function(ucmFormId)
	{
		var ucmData = ucmFormId.split(",");
		setTimeout(function(){jQuery.ajax({
			url: Joomla.getOptions('system.paths').base + "/index.php?option=com_dpe&format=json&task=tjucm.getLogFieldValue",
			type: "POST",
			dataType: 'json',
			data: jQuery.param({ 'ucmId':ucmData[0], 'fieldId':ucmData[1]}),
			success:function(response)
			{

				jQuery('#jform_'+response.data.fieldId).val(response.data.fieldValue);
				jQuery('#jform_'+response.data.fieldId).text(response.data.fieldValue);
				jQuery('#jform_'+response.data.fieldId).attr('readonly','readonly');

			}
		})
	}, 2000);
	},
	_showTicketValidationErrors: function(parsedValue)
	{
		var toUserval = jQuery("#jform_" + parsedValue.toUser + " :selected").val();
		var subject   = jQuery("#jform_" + parsedValue.subject).val();
		var message   = jQuery("#jform_" + parsedValue.message).val();
		var linkField = jQuery("#jform_" + parsedValue.linkField).val();
		var clusterId = jQuery("#jform_" + parsedValue.clusterId).val();

		var error = '';
		var labelTxt = '';

		if (!clusterId)
		{
			labelTxt = jQuery("#jform_" + parsedValue.clusterId + "-lbl").text().replace(/\*/g, '').trim();
			error = labelTxt + Joomla.Text._('COM_DPE_TICKET_FIELD_REQUIRED');
		}
		else if (!toUserval)
		{
			labelTxt = jQuery("#jform_" + parsedValue.toUser + "-lbl").text().replace(/\*/g, '').trim();
			error = labelTxt + Joomla.Text._('COM_DPE_TICKET_FIELD_REQUIRED');
		}
		else if (!subject)
		{
			labelTxt = jQuery("#jform_" + parsedValue.subject + "-lbl").text().replace(/\*/g, '').trim();
			error = labelTxt + Joomla.Text._('COM_DPE_TICKET_FIELD_REQUIRED');
		}
		else if (!message)
		{
			labelTxt = jQuery("#jform_" + parsedValue.message + "-lbl").text().replace(/\*/g, '').trim();
			error = labelTxt + Joomla.Text._('COM_DPE_TICKET_FIELD_REQUIRED');
		}
		else if (linkField)
		{
			error = Joomla.Text._('COM_DPE_TICKET_ALREADY_EXIST');
		}

		if (!error)
		{
			return false; // no errors — proceed
		}

		var container = jQuery('#system-message-container');
		if (container.length)
		{
			container.find('.addticket-alert').remove();
			var alertHtml = '<joomla-alert type="danger" close-text="Close" dismiss="true" role="alert" class="addticket-alert" style="animation-name: joomla-alert-fade-in;">'
				+ '<div class="alert-heading"><span class="error"></span><span class="visually-hidden">error</span></div>'
				+ '<div class="alert-wrapper"><div class="alert-message">' + error + '</div></div>'
				+ '</joomla-alert>';
			container.html(alertHtml);
		}
		jQuery('html, body').animate({ scrollTop: 0 }, 400);
		return true; // has errors
	},
	saveAndAddTicket: function(ucmFieldValue, callback)
	{
		var parsedValue = JSON.parse(ucmFieldValue);

		// Run validation first — show specific field errors at the top of the page
		if (logticket._showTicketValidationErrors(parsedValue))
		{
			return;
		}

		// Clear any previous addticket alert on success path
		jQuery('#system-message-container .addticket-alert').remove();

		// Clean up any stale wrappers first
		logticket.restoreOriginals();

		if (typeof com_tjucm !== 'undefined' && com_tjucm.Services && com_tjucm.Services.Item)
		{
			logticket.originalSaveFormData = com_tjucm.Services.Item.saveFormData;
			logticket.originalCreate = com_tjucm.Services.Item.create;

			com_tjucm.Services.Item.saveFormData = function(formData, cb) {
				if (formData instanceof FormData) {
					formData.delete('draft');
					formData.append('draft', 0);
				}
				var originalSave = logticket.originalSaveFormData;
				logticket.restoreOriginals();
				if (originalSave) {
					return originalSave.call(this, formData, cb);
				}
			};

			com_tjucm.Services.Item.create = function(formData, cb) {
				if (formData instanceof FormData) {
					formData.delete('draft');
					formData.append('draft', 0);
				}
				var originalCreate = logticket.originalCreate;
				if (originalCreate) {
					return originalCreate.call(this, formData, cb);
				}
			};
		}

		// If valid, set the pending ticket data and callback
		logticket.pendingTicketData = ucmFieldValue;
		logticket.pendingTicketCallback = callback;

		if (typeof tjUcmItemForm !== 'undefined' && typeof tjUcmItemForm.afterDataSave === 'function' && !tjUcmItemForm.afterDataSave.isWrappedForTickets)
		{
			var originalAfterDataSave = tjUcmItemForm.afterDataSave;
			tjUcmItemForm.afterDataSave = function(error, response) {
				var result = originalAfterDataSave.apply(this, arguments);
				
				var parsedResponse = null;
				try {
					parsedResponse = typeof response === 'string' ? JSON.parse(response) : response;
				} catch (e) {}

				if (!error && parsedResponse && parsedResponse.data && logticket.pendingTicketData)
				{
					var data = logticket.pendingTicketData;
					var cb = logticket.pendingTicketCallback;
					logticket.pendingTicketData = null;
					logticket.pendingTicketCallback = null;
					logticket.restoreOriginals();
					logticket.addTicketfromUcm(data);
					if (typeof cb === 'function') {
						cb();
					}
				}
				else if (error || (parsedResponse && !parsedResponse.data))
				{
					logticket.pendingTicketData = null;
					logticket.pendingTicketCallback = null;
					logticket.restoreOriginals();
				}
				return result;
			};
			tjUcmItemForm.afterDataSave.isWrappedForTickets = true;
		}

		// Save the form
		if (typeof editorcontent === 'function')
		{
			editorcontent();
		}
		if (typeof tjUcmItemForm !== 'undefined' && typeof tjUcmItemForm.saveUcmFormData === 'function')
		{
			tjUcmItemForm.saveUcmFormData();
		}
		else
		{
			// Fallback: if tjUcmItemForm is not defined (unlikely), just call addTicketfromUcm
			logticket.restoreOriginals();
			logticket.pendingTicketData = null;
			logticket.pendingTicketCallback = null;
			logticket.addTicketfromUcm(ucmFieldValue);
			if (typeof callback === 'function') {
				callback();
			}
		}
	},
	saveAndAddTicketBottom: function(ucmFieldValue, callback)
	{
		logticket.saveAndAddTicket(ucmFieldValue, callback);
	},
	addTicketfromUcm: function(ucmFieldValue)
	{
		var ucmFieldValue = JSON.parse(ucmFieldValue);
		var toUser        = jQuery("#jform_" + ucmFieldValue.toUser + " :selected").text();
		var toUserval     = jQuery("#jform_" + ucmFieldValue.toUser + " :selected").val();
		var subject       = jQuery("#jform_"+ucmFieldValue.subject).val();
		var message       = jQuery("#jform_"+ucmFieldValue.message).val();
		var linkField	  = jQuery("#jform_"+ucmFieldValue.linkField).val();
		var clusterId     = jQuery("#jform_"+ucmFieldValue.clusterId).val();
		var lableTxt      = '';

		if (!toUserval || !subject || linkField  || !clusterId || !message)
		{	
			if (!clusterId)
			{
				lableTxt = jQuery("#jform_"+ucmFieldValue.clusterId+'-lbl').text().replace(/\*/g,'');
				jQuery('#addTicketMessage').text(lableTxt + Joomla.Text._('COM_DPE_TICKET_FIELD_REQUIRED'));
				jQuery('#addTicketMessage').css('color','red');
			}

			else if (!toUserval)
			{
				lableTxt = jQuery("#jform_"+ucmFieldValue.toUser+'-lbl').text().replace(/\*/g,'');
				jQuery('#addTicketMessage').text(lableTxt+ Joomla.Text._('COM_DPE_TICKET_FIELD_REQUIRED'));
				jQuery('#addTicketMessage').css('color','red');
			}
			else if (!subject)
			{
				lableTxt = jQuery("#jform_"+ucmFieldValue.subject+'-lbl').text().replace(/\*/g,'');
				jQuery('#addTicketMessage').text(lableTxt+ Joomla.Text._('COM_DPE_TICKET_FIELD_REQUIRED'));
				jQuery('#addTicketMessage').css('color','red');
			}
			else if (linkField) 
			{
				jQuery('#addTicketMessage').text(Joomla.Text._('COM_DPE_TICKET_ALREADY_EXIST'));
				jQuery('#addTicketMessage').css('color','red');
			}
			
			else if (!message)
			{
				lableTxt = jQuery("#jform_"+ucmFieldValue.message+'-lbl').text().replace(/\*/g,'');
				jQuery('#addTicketMessage').text(lableTxt + Joomla.Text._('COM_DPE_TICKET_FIELD_REQUIRED'));
				jQuery('#addTicketMessage').css('color','red');
			}

			jQuery('#addTicketMessage').removeClass('d-none');
			setTimeout(function() {
				jQuery('#addTicketMessage').addClass('d-none');
			}, 3000);
			return false;

		}
		else
		{	

			jQuery('#addTicket').prop("disabled", true);
			var client = jQuery('#ucm-client').val();
			var fieldData = {};
			var formData = {};

			jQuery.each(ucmFieldValue, function(key, value) {

				fieldData[value]= jQuery("#jform_"+value).val();
			});

			formData['content_id'] 	= jQuery("#recordId").val();
			formData['client']     	= client;
			formData['created_by']	= jQuery("input[name='jform[checked_out]']").val();
			formData['clusterId']   = clusterId;
			formData['toUser']     	= toUser;
			formData['subject']     = subject;
			formData['message']     = message;
			formData['toUserId']    = toUserval;


const formDatas = JSON.stringify(formData);
const fieldDatas = JSON.stringify(fieldData);

localStorage.setItem('ticket', formDatas);
localStorage.setItem('fieldDatas', fieldDatas);
localStorage.setItem('client', client);
localStorage.setItem('ucmFieldValue',ucmFieldValue.linkField);

url=Joomla.getOptions('system.paths').base+'/index.php?option=com_rsticketspro&view=submit&tmpl=component&clientType='+client; 
var wwidth = jQuery(window).width() -250;
        var wheight = jQuery(window).height() - 150;
 		SqueezeBox.open(url, {
            handler: 'iframe',
            closable: true,
            size: {
                x: wwidth,
                y: wheight
            },
            sizeLoading: {
                x: wwidth,
                y: wheight
            },
            classWindow: '',
            onClose: function()
			{
						localStorage.removeItem('formData');
						localStorage.removeItem('fieldDatas');
						localStorage.removeItem('client');
						localStorage.removeItem('ticket');
						window.parent.jQuery('#addTicket').prop('disabled',false);
			}
          
        });
 

			jQuery('#addTicketMessage').addClass('d-none');
		}

	},

	saveTicketInLinkField: function(event)
	{ event.preventDefault();
		var ucmformDatas 	= JSON.parse(localStorage.getItem('ticket'));
		var fieldDatas 	= JSON.parse(localStorage.getItem('fieldDatas'));
		var client 		= localStorage.getItem('client');
		jQuery('#ucmpopupBtn').prop('disabled',true);


		var formData = new FormData(jQuery("#adminForm")[0]);

			// Append additional form data if needed
			formData.append('data', JSON.stringify(fieldDatas));
			formData.append('client', client);
			formData.append('ucmformDatas', JSON.stringify(ucmformDatas));
		formData.append('task', 'rsticket.addTicketFromUcmLog');

		var editorContent = tinymce.get('jform_message').getContent();
			formData.append('jform[message]',editorContent);


			// Append the file
			var fileInput = jQuery('#jform_files')[0].files[0];
			formData.append('file', fileInput);

		
		jQuery.ajax({
				url: Joomla.getOptions('system.paths').base + "/index.php?option=com_dpe&task=rsticket.addTicketFromUcmLog&format=json",
				type: "POST",
				dataType: 'json',
				 data: formData,
			    contentType: false,
			    processData: false,
				
				success:function(response)
				{ 
					window.onbeforeunload = null;
   								
   								
					if (response.data.success)
					{		

					  window.parent.jQuery("#jform_"+localStorage.getItem('ucmFieldValue')).val(response.data.url);
					 // window.parent.jQuery("#jform_"+localStorage.getItem('ucmFieldValue')).hide();
					  window.parent.jQuery(".ticketbtnclass").hide();
					  window.parent.jQuery('#addTicket').addClass('d-none');

					  // Create the new div with the provided HTML
					var newDiv = jQuery(					    
					    '<div class="col-sm-5 mb-10  fw-bold"><a href="'+response.data.url+'" target="_blank">Go to Ticket </a> </div>');
					// Insert the new div before a specific div with the class 'existingDiv'
					 window.parent.jQuery(newDiv).insertBefore("#jform_"+localStorage.getItem('ucmFieldValue'));


						localStorage.removeItem('formData');
						localStorage.removeItem('fieldDatas');
						localStorage.removeItem('client');
						localStorage.removeItem('ticket');
						localStorage.removeItem('ucmFieldValue');
						jQuery('<div id="system-message-container"></div>').insertBefore('.addticketLogpop');
						Joomla.renderMessages({
			            'success': [response.data.msg]
			        		});
						jQuery("html, body").animate({
				            scrollTop: 0
				        }, 500);
					        
						setTimeout(function(){            
							  window.parent.SqueezeBox.close();
							 },3000);

						
					}else{
						
						jQuery('#ucmpopupBtn').prop('disabled',false);
						jQuery('<div id="system-message-container"></div>').insertBefore('.addticketLogpop');
						Joomla.renderMessages({
			            'warning': [response.data.msg]
			        		});
						jQuery("html, body").animate({
				            scrollTop: 0
				        }, 500);
					}
				}
			})
			
					
	}


}

