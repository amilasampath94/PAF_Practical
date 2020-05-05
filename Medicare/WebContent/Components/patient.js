$(document).ready(function(){
	if($("#alertSuccess").text().trim() == "")
		{
			$("#alertSuccess").hide();
		}
	$("#alertError").hide();
});

//SAVE 
$(document).on("click", "#btnSave", function(event) 
{
			$("#alertSuccess").text("");
			$("#alertSuccess").hide("");
			$("#alertError").text("");
			$("#alertError").hide("");
		
			//form validation
			var status = validatePatientForm();
			if (status != true)
				{
					$("#alertError").text(status);
					$("#alertError").show();
					return;
				}

			$("#formPatient").submit();
			
			var type = ($("#hidPatientIdSave").val() == "") ? "POST" : "PUT"; 
			$.ajax
				({  
					url : "PatientAPI",  
					type : type,  
					data : $("#formPatient").serialize(),  
					dataType : "text",  
					complete : function(response, status)  
					{   
						onPatientSaveComplete(response.responseText, status);
					} 
				});
			
});

function onPatientSaveComplete(response, status) 
{  
	if (status == "success")  
	{   
		var resultSet = JSON.parse(response); 

		if (resultSet.status.trim() == "success")   
		{    
			$("#alertSuccess").text("Successfully saved.");    
			$("#alertSuccess").show(); 

			$("#divPatientGrid").html(resultSet.data);   
			} 
		else if (resultSet.status.trim() == "error")   
		{    
			$("#alertError").text(resultSet.data);    
			$("#alertError").show();   
		} 

	} 
	else if (status == "error")  
	{   
		$("#alertError").text("Error while saving.");   
		$("#alertError").show();  
		} else  
		{   
			$("#alertError").text("Unknown error while saving..");   
			$("#alertError").show();  
		} 
	
	$("#hidPatientIdSave").val(""); 
	$("#formPatient")[0].reset();

 
}

//Update
$(document).on("click", ".btnUpdate", function(event) {
	 $("#hidPatientIdSave").val($(this).closest("tr").find('#hidPatientIdUpdate').val());
	 $("#PateintName").val($(this).closest("tr").find('td:eq(0)').text()); 
	 $("#address").val($(this).closest("tr").find('td:eq(1)').text()); 
	 $("#email").val($(this).closest("tr").find('td:eq(2)').text()); 
	 $("#age").val($(this).closest("tr").find('td:eq(3)').text()); 
	 $("#channelledDocName").val($(this).closest("tr").find('td:eq(4)').text()); 
	 $("#phoneNo").val($(this).closest("tr").find('td:eq(5)').text()); 
	 
})

//DELETE
$(document).on("click", ".btnRemove", function(event) 
{  
	$.ajax(  
	{   
		url : "PatientAPI",   
		type : "DELETE",   
		data : "patientId=" + $(this).data("patientid"),   
		dataType : "text",   
		complete : function(response, status)   
		{    
			onPatientDeleteComplete(response.responseText, status);   
		}  
	}); 
});
 

function onPatientDeleteComplete(response, status) 
{  

	
	if (status == "success")  
	{   
		var resultSet = JSON.parse(response); 
		

		if (resultSet.status.trim() == "success")   
		{    
			$("#alertSuccess").text("Successfully deleted.");    
			$("#alertSuccess").show(); 

			$("#divPatientGrid").html(resultSet.data);   
		} else if (resultSet.status.trim() == "error")   
		{    
			$("#alertError").text(resultSet.data);    
			$("#alertError").show();   
		} 

	} else if (status == "error")  
	{   
		$("#alertError").text("Error while deleting.");   
		$("#alertError").show();  
	} else  
	{   
		$("#alertError").text("Unknown error while deleting..");   
		$("#alertError").show();  
	} 
	$("#hidPatientIdSave").val("");  
	$("#formPatient")[0].reset();
	
	
}



//FORM VALIDATE
function validatePatientForm()
{
	//name
	if($("#patientName").val().trim() == ""){
		return "insert patientName.";
	}
	
	//address
	if($("#address").val().trim() == ""){
		return "insert address.";
	}
	
	//email
	if($("#email").val().trim() == ""){
		return "Insert email.";
		}

	
		  
	//age
	var tmpAge = $("#age").val().trim();
	if (!$.isNumeric(tmpAge)) {
		return "Insert a numerical value for Age.";
	}
	
	//channelledDocName
	if($("#channelledDocName").val().trim() == ""){
		return "insert channelled Doctor Name.";
	}
	
	//phone Number
	var tmpphoneNo = $("#phoneNo").val().trim();
	if (!$.isNumeric(tmpphoneNo)) {
		return "Insert a numerical value for phone number.";
	}
	


	
	return true;

	
}




  









