/**
 * 
 */
 let oEditors = []
	    smartEditor = function() {
	      nhn.husky.EZCreator.createInIFrame({
	        oAppRef: oEditors,
	        elPlaceHolder: "exampleFormControlTextarea1",
	        sSkinURI: "../resources/smarteditor/SmartEditor2Skin.html",
	        fCreator: "createSEditor2"
	      })
	    }
	    $(document).ready(function() {
	      smartEditor()
	    })
	    function submitPost(){
			oEditors.getById["exampleFormControlTextarea1"].exec("UPDATE_CONTENTS_FIELD", []);
			var content = $("#exampleFormControlTextarea1").val();
			var subject = document.getElementById("exampleFormControlInput1").value;
			if(!subject){
				alert("제목을 입력하세요.");
				return false;
			}
			if(content == ""  || content == null || content == '&nbsp;' || content == '<p>&nbsp;</p>')  {
				alert("내용을 입력하세요.");
				oEditors.getById["exampleFormControlTextarea1"].exec("FOCUS"); //포커싱
				return false;
				}	         
		    }