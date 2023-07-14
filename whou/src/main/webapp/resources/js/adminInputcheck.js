/**
 * 
 */
 function input(){
	var subject = document.getElementById("exampleFormControlInput1").value;
	var content = document.getElementById("exampleFormControlTextarea1").value;
	if(!subject){
		alert("제목을 입력해주세요");
		return false;
	}
	if(!content){
		alert("내용을 입력해주세요");
		return false;
	}
}
 function aiInput(){
	var qes = document.getElementById("qes").value;
	var con = document.getElementById("con").value;
	var ref = document.getElementById("ref").value;
	var ref_level = document.getElementById("ref_level").value;
	
	if(!qes || !con || !ref || !ref_level){
		alert("모든 입력창에 입력해주세요");
		return false;
	}
}