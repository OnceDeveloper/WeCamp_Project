/**
 * 
 */

$("#loadMore").click(function(){
	  let pageCount = document.getElementById("pageCount").value;
	  let nextPage = document.getElementById("nextPage").value;
	  let campIdx = document.getElementById("campIdx").value;
	 //console.log("nextPage : "+nextPage+", pageCount : "+pageCount );
	 if(nextPage > pageCount) {
         $('#loadMore').attr("disabled", "disabled");
         $('#loadMore').text("END");
         return false;
     }
  $.ajax({
      url:"./loadMore.wcc",
      type:"POST",
      data: {
    	  camp_idx : campIdx,
    	  nextPage : nextPage
    	 // cp : ${cp}
      },
      dataType: "HTML",
      contentType: 'application/x-www-form-urlencoded; charset=utf-8',
      success: function(result) {
    	  	document.getElementById("nextPage").value = Number(nextPage)+1;
          if (result) {
        	  $(".reviewList").append(result);
        	 // alert(">>${cp} : "+${cp}+", pageCount : "+pageCount );
          }
      }
   });
});

function setSessionAndSubmit(){
//	var test = document.getElementsByClassName("check-bbq")[0];
	var checkbbq = document.getElementsByClassName("check-bbq");
	var isBbqChecked = $(checkbbq).is(":checked");
	var bbqPrice = 0;
		
	if(isBbqChecked){
		bbqPrice = document.getElementById("bbqPrice").value;
	} else {
		bbqPrice = 0;
	}
	var bookingInfo = {
			campIdx : document.getElementById('campIdx').value,
			campName : campName,
			address : document.getElementById("address").value,
			campZone : campZone,
			peopleNum : document.getElementById('peopleNum').value, 
			category : category,
			campPrice : campPrice,
			bbqPrice : bbqPrice,
			//totalPrice : Number(campPrice),
			checkDate : document.getElementById('checkDate').value,
			sort_idx : sort_idx
	};
	console.log("bookingInfo.sort_idx : "+bookingInfo.sort_idx);
	sessionStorage.setItem("bookingInfo", JSON.stringify(bookingInfo)); //세션저장
	
	var sessionItem = JSON.parse(sessionStorage.getItem("bookingInfo"));
	
	
	location.href = "../booking/booking.wcc";
	//location.href = "../booking/booking.wcc?camp_idx="+camp_idx;
}



window.onload = function setCalender(){
	var now = new Date();
	var currentDate = now.getDate()+'/'+(now.getMonth()+1)+'/'+now.getFullYear();
	document.getElementsByClassName("calender-customize").value = currentDate;
	
	// 숫자 타입에서 쓸 수 있도록 format() 함수 추가
	Number.prototype.format = function(){
	    if(this==0) return 0;

	    var reg = /(^[+-]?\d+)(\d{3})/;
	    var n = (this + '');

	    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

	    return n;
	};

	// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
	String.prototype.format = function(){
	    var num = parseFloat(this);
	    if( isNaN(num) ) return "0";

	    return num.format();
	};
	
	$(".price").text(function() {//1000단위 컴마처리
	    $(this).text(
	        $(this).text().format()
	    );
	});
	
	$("#bbqPrice").text(function() {//1000단위 컴마처리
	    $(this).val(
	        $(this).val().format()
	    );
	});
	
	//$('input[name="daterange"]').val(getCurrentDate()+" - "+getCurrentDate());
	//예약버튼 비활성화
	document.getElementById('booking-event').style.pointerEvents = 'none';
	$('#booking-event').css({cursor: 'pointer'});
}

/***added by rhie (not used yet)***/
/*function getCurrentDate(){
    var now = new Date();
    var nowYear = now.getFullYear();
    var nowMonth = now.getMonth() + 1;
    var nowDate = now.getDate();
    var dayOfTheWeek = now.getDay();
    if (nowMonth < 10) {
        nowMonth = "0" + nowMonth;
    }
    if (nowDate < 10) {
        nowDate = "0" + nowDate;
    }
    currentDate = nowYear + "/" + nowMonth + "/" + nowDate;
    if(typeof nowYear == 'String'){
    	console.log(true);
    }
    return currentDate;
}
function getDay(idx){
   var date = "";
   switch (idx) {
       case 0:
           date = "일";
           break;
       case 1:
           date = "월";
           break;
       case 2:
           date = "화";
           break;
       case 3:
           date = "수";
           break;
       case 4:
           date = "목";
           break;
       case 5:
           date = "금";
           break;
       case 6:
           date = "토";
           break;
   }
   return date;    	   
}
*/